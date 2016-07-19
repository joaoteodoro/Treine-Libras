package br.com.treinelibras.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
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
import br.com.treinelibras.util.StringUtils;

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
		List<ConfiguracaoDeMao> configuracoesDeMao = configuracaoDeMaoDao.lista();
		model.addAttribute("configuracoesDeMao", configuracoesDeMao);

		List<PontoDeArticulacao> pontosDeArticulacao = pontoDeArticulacaoDao.lista();
		model.addAttribute("pontosDeArticulacao", pontosDeArticulacao);

		List<Movimento> movimentos = movimentoDao.lista();
		model.addAttribute("movimentos", movimentos);

		List<ExpressaoFacial> expressoesFaciais = expressaoFacialDao.lista();
		model.addAttribute("expressoesFaciais", expressoesFaciais);

		return "cadastrar-sinal";
	}
	
	@RequestMapping("listarSinais")
	public String listarSinais(Model model){
		List<Sinal> sinais = dao.lista();
		model.addAttribute("sinais",sinais);
		return "lista-sinais";
	}
	
	@RequestMapping("removerSinal")
	@Transactional
	public String removerSinal(Long idSinal, Model model){
		System.out.println("Entrou removerSinal idSinal="+idSinal);
		dao.remove(idSinal);
		System.out.println("Depois de remover");
		return "redirect:listarSinais";
	}
	
	@RequestMapping("alterarSinalAntes")
	@Transactional
	public String mostraSinal(Long idSinal, Model model){
		System.out.println("Antes condifuracoesDeMao");
		List<ConfiguracaoDeMao> configuracoesDeMao = configuracaoDeMaoDao.lista();
		model.addAttribute("configuracoesDeMao", configuracoesDeMao);

		System.out.println("Antes pontosDeArticulacao");
		List<PontoDeArticulacao> pontosDeArticulacao = pontoDeArticulacaoDao.lista();
		model.addAttribute("pontosDeArticulacao", pontosDeArticulacao);

		System.out.println("Antes movimentos");
		List<Movimento> movimentos = movimentoDao.lista();
		model.addAttribute("movimentos", movimentos);

		System.out.println("Antes expressoesFaciais");
		List<ExpressaoFacial> expressoesFaciais = expressaoFacialDao.lista();
		model.addAttribute("expressoesFaciais", expressoesFaciais);
		
		System.out.println("Antes Sinal");
		Sinal sinal = dao.buscaPorId(idSinal);
		model.addAttribute("sinal",sinal);
		
		System.out.println("sinal.orientacao: "+sinal.getOrientacao());
		return "altera-sinal";
	}

	@RequestMapping("cadastrarSinal")
	@Transactional
	public String cadastrarSinal(Model model, HttpServletRequest request){
		
		boolean isMultiPart = FileUpload.isMultipartContent(request);

		Sinal sinal = new Sinal();
		
		if (isMultiPart) {
			System.out.println("Entrou");
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			String formulario = "";
			
			List<ConfiguracaoDeMao> configuracoesDeMao = new ArrayList<>();
			List<PontoDeArticulacao> pontosDeArticulacao = new ArrayList<>();
			List<Movimento> movimentos = new ArrayList<>();
			
			try {
				List items = upload.parseRequest(request);
				Iterator iter = items.iterator();
				
				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();
					
					if (item.getFieldName().equals("tipoForm")) {
						formulario = item.getString();
						System.out.println("Formulario: "+formulario);
					}
					
					if (!item.isFormField()) {
						String nomeArquivo = sinal.getNome() + "." + item.getName().substring(item.getName().length()-3, item.getName().length());
						if (item.getFieldName().equals("foto")) {
							// salvarFoto
							//String nomeArquivo = sinal.getNome() + item.getName().substring(item.getName().length()-3, item.getName().length()-1);
							System.out.println("nomeArquivo: "+nomeArquivo);
							item.setFieldName(nomeArquivo);
							this.inserirImagemDiretorio(item,"img");
							sinal.setFoto(item.getFieldName());
						} else {
							// salvarVideo
							item.setFieldName(nomeArquivo);
							this.inserirImagemDiretorio(item,"videos");
							sinal.setVideo(item.getFieldName());
						}
					}else{
						if("nome".equals(item.getFieldName())){
							sinal.setNome(item.getString());
						}else if("categoria".equals(item.getFieldName())){
							sinal.setCategoria(item.getString());
						}else if("orientacao".equals(item.getFieldName())){
							sinal.setOrientacao(item.getString());
						}else if("dificuldade".equals(item.getFieldName())){
							sinal.setDificuldade(item.getString());
						}else if("configuracaoDeMao".equals(item.getFieldName())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							configuracoesDeMao.add(0,configuracaoDeMao);
							System.out.println("Configuracao de mao nome: "+configuracaoDeMao.getNome());
						}else if("configuracaoDeMao2".equals(item.getFieldName()) &&
								item.getString() != null && item.getString() != "" && StringUtils.isNumeric(item.getString())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							configuracoesDeMao.add(1,configuracaoDeMao);
						}else if("pontoDeArticulacao".equals(item.getFieldName())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							System.out.println("Ponto de articulação: "+pontoDeArticulacao.getNome());
							pontosDeArticulacao.add(0,pontoDeArticulacao);
							System.out.println("Ponto de articulacao nome: "+pontoDeArticulacao.getNome());
						}else if("pontoDeArticulacao2".equals(item.getFieldName()) &&
								item.getString() != null && item.getString() != "" && StringUtils.isNumeric(item.getString())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							pontosDeArticulacao.add(1,pontoDeArticulacao);
						}else if("movimento".equals(item.getFieldName())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							movimentos.add(0,movimento);
							System.out.println("Movimento nome "+movimento.getNome());
						}else if("movimento2".equals(item.getFieldName()) &&
								item.getString() != null && item.getString() != "" && StringUtils.isNumeric(item.getString())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							movimentos.add(1,movimento);
						}else if("expressao".equals(item.getFieldName())){
							ExpressaoFacial expressaoFacial = expressaoFacialDao.buscaPorId(Long.parseLong(item.getString()));
							sinal.setExpressaoFacial(expressaoFacial);
							System.out.println("Expressao Facial nome: "+expressaoFacial.getNome());
						}
						System.out.println("isFormField: "+item.getString());
					}
				}
				sinal.setConfiguracoesDeMao(configuracoesDeMao);
				sinal.setPontosDeArticulacao(pontosDeArticulacao);
				sinal.setMovimentos(movimentos);
				dao.adiciona(sinal);
			}
			catch (FileUploadException ex) {
				ex.printStackTrace();
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return "redirect:listarSinais";

	}
	
	@RequestMapping("alterarSinal")
	@Transactional
	public String alterarSinal(Model model, HttpServletRequest request){
		boolean isMultiPart = FileUpload.isMultipartContent(request);

		Sinal sinal = null;
		
		if (isMultiPart) {
			System.out.println("Entrou");
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			String formulario = "";
			
			/*List<ConfiguracaoDeMao> configuracoesDeMao = new ArrayList<>();
			List<PontoDeArticulacao> pontosDeArticulacao = new ArrayList<>();
			List<Movimento> movimentos = new ArrayList<>();*/
			
			try {
				List items = upload.parseRequest(request);
				Iterator iter = items.iterator();
				
				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();
					
					if (item.getFieldName().equals("tipoForm")) {
						formulario = item.getString();
						System.out.println("Formulario: "+formulario);
					}
					
					if (!item.isFormField() && item != null && !"".equals(item.getName())) {
						String nomeArquivo = sinal.getNome() + "." + item.getName().substring(item.getName().length()-3, item.getName().length());
						if (item.getFieldName().equals("foto") && item != null) {
							// salvarFoto
							System.out.println("nomeArquivo: "+nomeArquivo);
							item.setFieldName(nomeArquivo);
							this.inserirImagemDiretorio(item,"img");
							sinal.setFoto(item.getFieldName());
						} else if (item.getFieldName().equals("video") && item != null){
							// salvarVideo
							item.setFieldName(nomeArquivo);
							this.inserirImagemDiretorio(item,"videos");
							sinal.setVideo(item.getFieldName());
						}
					}else{
						if("idSinal".equals(item.getFieldName())){
							sinal = dao.buscaPorId(Long.parseLong(item.getString()));
						}else if("nome".equals(item.getFieldName())){
							System.out.println("Nome: "+item.getString());
							sinal.setNome(item.getString());
						}else if("categoria".equals(item.getFieldName()) && !item.getString().equals(sinal.getCategoria())){
							sinal.setCategoria(item.getString());
						}else if("orientacao".equals(item.getFieldName()) && !item.getString().equals(sinal.getOrientacao())){
							sinal.setOrientacao(item.getString());
						}else if("dificuldade".equals(item.getFieldName()) && !item.getString().equals(sinal.getDificuldade())){
							sinal.setDificuldade(item.getString());
						}else if("configuracaoDeMao".equals(item.getFieldName())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							if(!sinal.getConfiguracoesDeMao().get(0).equals(configuracaoDeMao)){
								sinal.getConfiguracoesDeMao().set(0, configuracaoDeMao);
							}
							System.out.println("Configuracao de mao nome: "+configuracaoDeMao.getNome());
						}else if("configuracaoDeMao2".equals(item.getFieldName()) &&
								item.getString() != null && item.getString() != "" && StringUtils.isNumeric(item.getString())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							if(sinal.getConfiguracoesDeMao().get(1) != null && !sinal.getConfiguracoesDeMao().get(1).equals(configuracaoDeMao)){
								sinal.getConfiguracoesDeMao().set(1, configuracaoDeMao);
							}else if(sinal.getConfiguracoesDeMao().get(1) == null){
								sinal.getConfiguracoesDeMao().add(1, configuracaoDeMao);
							}
						}else if("pontoDeArticulacao".equals(item.getFieldName())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							if(!sinal.getPontosDeArticulacao().get(0).equals(pontoDeArticulacao)){
								sinal.getPontosDeArticulacao().set(0, pontoDeArticulacao);
							}
							System.out.println("Ponto de articulacao nome: "+pontoDeArticulacao.getNome());
						}else if("pontoDeArticulacao2".equals(item.getFieldName()) &&
								item.getString() != null && item.getString() != "" && StringUtils.isNumeric(item.getString())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							if(sinal.getPontosDeArticulacao().size() > 1){
								sinal.getPontosDeArticulacao().set(1, pontoDeArticulacao);
							}else{
								sinal.getPontosDeArticulacao().add(1, pontoDeArticulacao);
							}
						}else if("movimento".equals(item.getFieldName())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							if(!sinal.getMovimentos().get(0).equals(movimento)){
								sinal.getMovimentos().set(0, movimento);
							}
							System.out.println("Movimento nome "+movimento.getNome());
						}else if("movimento2".equals(item.getFieldName()) &&
								item.getString() != null && item.getString() != "" && StringUtils.isNumeric(item.getString())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							if(sinal.getMovimentos().get(1) != null && sinal.getMovimentos().get(1).equals(movimento)){
								sinal.getMovimentos().set(1, movimento);
							}else if(sinal.getMovimentos().get(1) == null){
								sinal.getMovimentos().set(1, movimento);
							}
						}else if("expressao".equals(item.getFieldName())){
							ExpressaoFacial expressaoFacial = expressaoFacialDao.buscaPorId(Long.parseLong(item.getString()));
							if(!expressaoFacial.equals(sinal.getExpressaoFacial())){
								sinal.setExpressaoFacial(expressaoFacial);
							}
							System.out.println("Expressao Facial nome: "+expressaoFacial.getNome());
						}
						System.out.println("isFormField: "+item.getString());
					}
				}
				dao.altera(sinal);
			}
			catch (FileUploadException ex) {
				ex.printStackTrace();
			}
			catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return "redirect:listarSinais";
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