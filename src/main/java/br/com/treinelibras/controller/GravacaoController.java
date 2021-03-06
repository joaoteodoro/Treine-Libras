package br.com.treinelibras.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.treinelibras.dao.IAvaliacaoDao;
import br.com.treinelibras.dao.IGravacaoDao;
import br.com.treinelibras.dao.ISinalDao;
import br.com.treinelibras.modelo.Avaliacao;
import br.com.treinelibras.modelo.Gravacao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;
import br.com.treinelibras.util.StringUtils;

@Transactional
@Controller
public class GravacaoController {
	
	@Autowired 
	protected ServletContext servletContext;
	
	@Autowired
	IGravacaoDao dao;
	
	@Autowired
	ISinalDao sinalDao;
	
	@Autowired
	IAvaliacaoDao avaliacaoDao;
	
	@RequestMapping("verificaAvaliacao")
	@ResponseBody
	public String verificaAvaliacao(Long idGravacao, HttpSession session){
		System.out.println("**********************************Entrou verificaAvaliacao()");
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		System.out.println("**********************************Usuario ID: "+usuario.getIdUsuario());
		System.out.println("**********************************ID Gravacao: "+idGravacao);
		Avaliacao a = avaliacaoDao.existeAvaliacaoGravada(usuario.getIdUsuario(), idGravacao);
		System.out.println("**********************************Avaliacao : "+a.toString());
		if(a != null){
			return "Voc๊ jแ avaliou esta grava็ใo";
		}else{
			return "";
		}
	}
	
	@RequestMapping("mostraGravacao")
	public String mostraGravacao(Long idSinal, Long idUsuario, Model model){
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO GravacaoController.mostraGravacao()");
		
		Sinal sinal = sinalDao.buscaPorId(idSinal);
		Gravacao gravacao = dao.gravacaoPorUsuarioSinal(idUsuario, idSinal);
		model.addAttribute("sinal",sinal);
		model.addAttribute("gravacao",gravacao);
		
		System.out.println("Sinal.toString(): "+sinal.toString());
		
		System.out.println("======================================== FIM GravacaoController.mostraGravacao()");
		
		return "avaliar-sinal";
	}
	
	
	@RequestMapping("listarUsuariosPorGravacao")
	public String listarUsuariosPorGravacao(Long idSinal, Model model, HttpServletRequest request){
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		//List<Gravacao> gravacoes = dao.gravacoesPorSinalSemUsuarioLogado(idSinal, usuario.getIdUsuario());
		List<Gravacao> gravacoes = dao.gravacoesParaAvaliarPorUsuarioSinal(usuario.getIdUsuario(), idSinal);
		Sinal sinal = sinalDao.buscaPorId(idSinal);
		
		model.addAttribute("gravacoes", gravacoes);
		model.addAttribute("sinal",sinal);
		return "lista-gravacoes-sinal";
	}
	
	@RequestMapping("existeGravacao")
	@ResponseBody
	public String existeGravacao(Long idSinal, Model model, HttpServletRequest request, HttpServletResponse response){
		Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");
		String nomeVideo = dao.videoPorSinalUsuario(idSinal,usuarioLogado.getIdUsuario());
		return servletContext.getContextPath()+"/resources/videos/"+nomeVideo; 
		//return "D:\\videosTreineLibras\\"+nomeVideo;
	}

	@Transactional
	@RequestMapping("gravarSinal")
	public String gravarSinal(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		Sinal sinal = (Sinal) request.getSession().getAttribute("sinalContexto");
		System.out.println("*************************************idSInal: "+sinal.getIdSinal());
		
		String idSinalFormatado = StringUtils.lpad(String.valueOf(sinal.getIdSinal()), "0", 4);
		System.out.println("*************************************SinalFormatado: "+idSinalFormatado);
		Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");
		String idUsuarioFormatado = StringUtils.lpad(usuarioLogado.getIdUsuario().toString(), "0", 4);
		System.out.println("*************************************idUsuarioFormatado: "+idUsuarioFormatado);
		Calendar calendar = Calendar.getInstance();
		String ano = String.valueOf(calendar.YEAR);
		System.out.println("*************************************ano: "+ano);
		String mes = StringUtils.lpad(String.valueOf(calendar.MONTH),"0", 2);
		System.out.println("*************************************mes: "+mes);
		String dia = StringUtils.lpad(String.valueOf(calendar.DAY_OF_MONTH),"0", 2);
		System.out.println("*************************************dia: "+dia);
		String nomeArquivo = ano+mes+dia+idSinalFormatado+idUsuarioFormatado+".webm";
		
		
		try {
			
			System.out.println("*************************************Entrou no try gravarSinal");
			
			String caminho = servletContext.getRealPath("/resources/videos") + "/";
			
			File diretorio = new File(caminho);
			
			if (!diretorio.exists()) {
				diretorio.mkdir();
			}
			
			File file = new File(diretorio, nomeArquivo);
			FileOutputStream output = new FileOutputStream(file);
			
			InputStream is = request.getInputStream();
			byte[] buffer = new byte[2048];
			int nLidos;

			while ((nLidos = is.read(buffer)) >= 0) {
				output.write(buffer, 0, nLidos);
			}
			output.flush();
			output.close();
			
			Gravacao gravacao = dao.gravacaoPorUsuarioSinal(usuarioLogado.getIdUsuario(), sinal.getIdSinal());
			
			if(gravacao != null){
				System.out.println("*************************************gravacao != null");
				gravacao.setVideo(nomeArquivo);
			}else{
				System.out.println("*************************************gravacao = null");
				gravacao = new Gravacao();
				gravacao.setUsuario(usuarioLogado);
				gravacao.setSinal(sinal);
				gravacao.setVideo(nomeArquivo);
				//dao.adiciona(gravacao);
			}
			System.out.println("*************************************antes add gravacao");
			dao.adiciona(gravacao);
			System.out.println("*************************************depois add gravacao");
			System.out.println("จจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจAntes de chamar o dao que apaga as gravacoes!");
			avaliacaoDao.apagaAvaliacoes(gravacao.getIdGravacao());
			System.out.println("จจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจDepois de chamar o dao que apaga as gravacoes!");
			
			
			
			
			
			/*List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	
			for (FileItem item : items) {
				if (item.isFormField()) {
					System.out.println("if: "+item.getFieldName());
				} else {
					
					
					//buscando sinal que esta sendo representado/gravado
					Long idSinal = Long.parseLong(item.getFieldName().substring(8, 12));
					Sinal sinal = sinalDao.buscaPorId(idSinal);
					
					//capturando usuario logado para colocar seu id no nome do arquivo de video
					Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");
					String idUsuarioFormatado = StringUtils.lpad(usuarioLogado.getIdUsuario().toString(), "0", 4);
					item.setFieldName(item.getFieldName()+idUsuarioFormatado+".webm");
					
					//inserindo video no diretorio
					this.inserirImagemDiretorio(item);
					
					Gravacao gravacao = dao.gravacaoPorUsuarioSinal(usuarioLogado.getIdUsuario(), idSinal);
					
					if(gravacao != null){
						gravacao.setVideo(item.getFieldName());
					}else{
						gravacao = new Gravacao();
						gravacao.setUsuario(usuarioLogado);
						gravacao.setSinal(sinal);
						gravacao.setVideo(item.getFieldName());
						//dao.adiciona(gravacao);
					}
					dao.adiciona(gravacao);
					System.out.println("จจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจจAntes de chamar o dao que apaga as gravacoes!");
					avaliacaoDao.apagaAvaliacoes(gravacao.getIdGravacao());
				}
			}*/
		} catch (Exception e) {
			throw new ServletException("Parsing file upload failed.", e);
		}
		
		return "redirect:exercicios";
	}

	/*private void inserirImagemDiretorio(FileItem item) throws IOException {
		String caminho = servletContext.getRealPath("/resources/videos") + "/";
		//String caminho = "D:\\videosTreineLibras\\";

		File diretorio = new File(caminho);

		if (!diretorio.exists()) {
			diretorio.mkdir();
		}

		String nome = item.getFieldName();
		String arq[] = nome.split("\\\\");

		for (int i = 0; i < arq.length; i++) {
			nome = arq[i];
		}

		File file = new File(diretorio, nome);
		FileOutputStream output = new FileOutputStream(file);
		InputStream is = item.getInputStream();
		byte[] buffer = new byte[2048];
		int nLidos;

		while ((nLidos = is.read(buffer)) >= 0) {
			output.write(buffer, 0, nLidos);
		}
		output.flush();
		output.close();
	}*/
}
