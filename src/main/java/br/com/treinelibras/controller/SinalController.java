package br.com.treinelibras.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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

import br.com.treinelibras.dao.IConfiguracaoDeMaoDao;
import br.com.treinelibras.dao.IExpressaoFacialDao;
import br.com.treinelibras.dao.IMovimentoDao;
import br.com.treinelibras.dao.IPontoDeArticulacaoDao;
import br.com.treinelibras.dao.ISinalDao;
import br.com.treinelibras.modelo.ConfiguracaoDeMao;
import br.com.treinelibras.modelo.ExpressaoFacial;
import br.com.treinelibras.modelo.Movimento;
import br.com.treinelibras.modelo.PontoDeArticulacao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

@Transactional
@Controller
public class SinalController {

	@Autowired 
	protected ServletContext servletContext;
	
	@Autowired
	ISinalDao dao;

	@Autowired
	IConfiguracaoDeMaoDao configuracaoDeMaoDao;

	@Autowired
	IPontoDeArticulacaoDao pontoDeArticulacaoDao;

	@Autowired
	IMovimentoDao movimentoDao;

	@Autowired
	IExpressaoFacialDao expressaoFacialDao;

	@RequestMapping("listaSinais")
	public String lista(Model model) {
		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();

		List<String> categorias = dao.listaCategorias();

		for (String categoria : categorias) {
			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
			sinaisPorCategoria.put(categoria, sinais);
		}

		model.addAttribute("categorias", sinaisPorCategoria);
		return "glossario";
	}

	@RequestMapping("listaSinaisExercicios")
	public String listaSinaisExercicios(Model model) {
		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();

		List<String> categorias = dao.listaCategorias();

		for (String categoria : categorias) {
			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
			sinaisPorCategoria.put(categoria, sinais);
		}

		model.addAttribute("categorias", sinaisPorCategoria);
		return "exercicios";
	}

	@RequestMapping("listaSinaisAvaliar")
	public String listaSinaisAvaliar(Model model) {
		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();

		List<String> categorias = dao.listaCategorias();

		for (String categoria : categorias) {
			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
			sinaisPorCategoria.put(categoria, sinais);
		}

		model.addAttribute("categorias", sinaisPorCategoria);
		return "avaliar";
	}

	@RequestMapping("mostraSinal")
	public String mostra(Long id, Model model) throws ClassNotFoundException {
		model.addAttribute("sinal", dao.buscaPorId(id));
		return "sinal-interprete";
	}

	@Transactional
	@RequestMapping("calculaNota")
	public String calculaNota(Long id, Model model, HttpServletRequest request) {
		System.out.println("Entrou no calcula nota");
		Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");
		System.out.println("usuario: " + usuarioLogado.getUsuario() + " / " + usuarioLogado.getIdUsuario());
		float nota = dao.notaSinalPorUsuario(usuarioLogado.getIdUsuario(), id);
		System.out.println("nota: " + nota);
		model.addAttribute("nota", nota);
		return "nota-sinal";
	}

	@RequestMapping("executarSinal")
	public String executarSinal(Long id, Model model) {
		model.addAttribute("sinal", dao.buscaPorId(id));
		return "executar-sinal";
	}

	@RequestMapping("avaliacoes")
	public String avaliacoes(Model model, HttpSession session) {
		System.out.println("%%%  SinalController > avaliacoes ");
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		List<Sinal> melhoresAvaliacoes = dao.listaSinaisMelhoresAvaliacoes(usuario);
		model.addAttribute("melhoresAvaliacoes", melhoresAvaliacoes);

		List<Sinal> pioresAvaliacoes = dao.listaSinaisPioresAvaliacoes(usuario);
		model.addAttribute("pioresAvaliacoes", pioresAvaliacoes);

		return "index";

	}

	@RequestMapping("calculaNotaUsuarios")
	public String calculaNotaUsuarios(Long idSinal, Long idUsuario, Model model, HttpServletRequest request) {
		float nota = dao.notaSinalPorUsuario(idUsuario, idSinal);
		model.addAttribute("nota", nota);
		return "nota-sinal";
	}

	@RequestMapping("gravaSinalSessao")
	@ResponseBody
	public String gravaSinalSessao(Long idSinal, Model model, HttpSession session) {
		Sinal sinal = dao.buscaPorId(idSinal);
		session.setAttribute("sinalContexto", sinal);
		return "";
	}

	@RequestMapping("cadastrarSinalAntes")
	public String cadastrarSinalAntes(Model model) {
		List<ConfiguracaoDeMao> condifuracoesDeMao = configuracaoDeMaoDao.lista();
		model.addAttribute("condifuracoesDeMao", condifuracoesDeMao);

		List<PontoDeArticulacao> pontosDeArticulacao = pontoDeArticulacaoDao.lista();
		model.addAttribute("pontosDeArticulacao", pontosDeArticulacao);

		List<Movimento> movimentos = movimentoDao.lista();
		model.addAttribute("movimentos", movimentos);

		List<ExpressaoFacial> expressoesFaciais = expressaoFacialDao.lista();
		model.addAttribute("expressoesFaciais", expressoesFaciais);

		return "cadastrar-sinal";
	}

	@RequestMapping("cadastrarSinal")
	public String cadastrarSinal(Sinal sinal, Model model, HttpServletRequest request){
		
		Enumeration en=request.getParameterNames();
		 
		while(en.hasMoreElements())
		{
			Object objOri=en.nextElement();
			String param=(String)objOri;
			String value=request.getParameter(param);
			System.out.println("Parameter Name is '"+param+"' and Parameter Value is '"+value+"'");
		}
		
		System.out.println("--------------------------------------------------------");
		System.out.println("Nome: "+request.getParameter("nome"));
		System.out.println("Categoria: "+request.getParameter("categoria"));
		System.out.println("Orientacao: "+request.getParameter("orientacao"));
		System.out.println("Dificuldade: "+request.getParameter("dificuldade"));
		
		sinal.setNome(request.getParameter("nome"));
		sinal.setCategoria(request.getParameter("categoria"));
		sinal.setDificuldade(request.getParameter("dificuldade"));
		sinal.setOrientacao(request.getParameter("orientacao"));

		// Configurações de mão
		List<ConfiguracaoDeMao> configuracoesDeMao = new ArrayList<>();
		ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao
				.buscaPorId(Long.parseLong(request.getParameter("configuracaoDeMao")));
		configuracoesDeMao.add(configuracaoDeMao);
		if (request.getParameter("configuracaoDeMao2") != null && request.getParameter("configuracaoDeMao2") != "") {
			ConfiguracaoDeMao configuracaoDeMao2 = configuracaoDeMaoDao
					.buscaPorId(Long.parseLong(request.getParameter("configuracaoDeMao2")));
			configuracoesDeMao.add(configuracaoDeMao2);
		}

		// Pontos de articulação
		List<PontoDeArticulacao> pontosDeArticulacao = new ArrayList<>();
		PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao
				.buscaPorId(Long.parseLong(request.getParameter("pontoDeArticulacao")));
		pontosDeArticulacao.add(pontoDeArticulacao);
		if (request.getParameter("pontoDeArticulacao2") != null && request.getParameter("pontoDeArticulacao2") != "") {
			PontoDeArticulacao pontoDeArticulacao2 = pontoDeArticulacaoDao
					.buscaPorId(Long.parseLong(request.getParameter("pontoDeArticulacao2")));
			pontosDeArticulacao.add(pontoDeArticulacao2);
		}

		// Movimentos
		List<Movimento> movimentos = new ArrayList<>();
		Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(request.getParameter("movimento")));
		movimentos.add(movimento);
		if (request.getParameter("movimento2") != null && request.getParameter("movimento2") != "") {
			Movimento movimento2 = movimentoDao.buscaPorId(Long.parseLong(request.getParameter("movimento2")));
			movimentos.add(movimento2);
		}

		List<FileItem> items;
		try {
			items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			
			for (FileItem item : items) {
				if (!item.isFormField()) {
					String nomeArquivo = sinal.getNome() + "." + item.getName().substring(item.getName().length()-4, item.getName().length()-1);
					if (item.getFieldName().equals("foto")) {
						// salvarFoto
						//String nomeArquivo = sinal.getNome() + item.getName().substring(item.getName().length()-3, item.getName().length()-1);
						System.out.println("nomeArquivo: "+nomeArquivo);
						item.setFieldName(nomeArquivo);
						this.inserirImagemDiretorio(item,"imagens");
						sinal.setFoto(item.getName());
					} else {
						// salvarVideo
						item.setFieldName(nomeArquivo);
						this.inserirImagemDiretorio(item,"videos");
						sinal.setVideo(item.getName());
					}
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

		return "redirect:index";

	}

	private void inserirImagemDiretorio(FileItem item, String pasta){
		String caminho = servletContext.getRealPath("/resources/"+pasta) + "/";
		// String caminho = "D:\\videosTreineLibras\\";

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
		FileOutputStream output;
		try {
			output = new FileOutputStream(file);
			
			InputStream is = item.getInputStream();
			byte[] buffer = new byte[2048];
			int nLidos;

			while ((nLidos = is.read(buffer)) >= 0) {
				output.write(buffer, 0, nLidos);
			}
			output.flush();
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}