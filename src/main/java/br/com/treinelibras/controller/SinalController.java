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
	@Transactional
	public String cadastrarSinal(Model model, HttpServletRequest request){
		Sinal sinal = new Sinal();
		sinal.setNome("Livro");
		sinal.setCategoria("Objetos");
		sinal.setFoto("livro.png");
		sinal.setVideo("livro.mp4");
		sinal.setDificuldade("facil");
		
		//List<ConfiguracaoDeMao> configuracoesDeMao = new ArrayList<ConfiguracaoDeMao>();
		ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(56L);
		sinal.setConfiguracoesDeMao(Arrays.asList(configuracaoDeMao));
		//configuracoesDeMao.add(configuracaoDeMao);
		//sinal.setConfiguracoesDeMao(configuracoesDeMao);
		
		//List<PontoDeArticulacao> pontosDeArticulacao = new ArrayList<PontoDeArticulacao>();
		PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(1L);
		sinal.setPontosDeArticulacao(Arrays.asList(pontoDeArticulacao));
		//sinal.setPontosDeArticulacao(pontosDeArticulacao);
		
		//List<Movimento> movimentos = new ArrayList<Movimento>();
		Movimento movimento = movimentoDao.buscaPorId(1L);
		sinal.setMovimentos(Arrays.asList(movimento));
		//movimentos.add(movimento);
		
		sinal.setOrientacao("para cima");
		
		ExpressaoFacial expressaoFacial = expressaoFacialDao.buscaPorId(1L);
		sinal.setExpressaoFacial(expressaoFacial);
		
		dao.adiciona(sinal);
		
		/*
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
							sinal.setFoto(item.getName());
						} else {
							// salvarVideo
							item.setFieldName(nomeArquivo);
							this.inserirImagemDiretorio(item,"videos");
							sinal.setVideo(item.getName());
						}
					}else{
						if("nome".equals(item.getFieldName())){
							sinal.setNome(item.getString());
						}else if("categoria".equals(item.getFieldName())){
							sinal.setCategoria(item.getString());
						}else if("oritentacao".equals(item.getFieldName())){
							sinal.setOrientacao(item.getString());
						}else if("dificuldade".equals(item.getFieldName())){
							sinal.setDificuldade(item.getString());
						}else if("configuracaoDeMao".equals(item.getFieldName())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							configuracoesDeMao.add(configuracaoDeMao);
							System.out.println("Configuracao de mao nome: "+configuracaoDeMao.getNome());
						}else if("configuracaoDeMao2".equals(item.getFieldName()) &&
								item.getString() != null && item.getString() != "" && StringUtils.isNumeric(item.getString())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							configuracoesDeMao.add(configuracaoDeMao);
						}else if("ponoDeArticulacao".equals(item.getFieldName())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							pontosDeArticulacao.add(pontoDeArticulacao);
							System.out.println("Ponto de articulacao nome: "+pontoDeArticulacao.getNome());
						}else if("pontoDeArticulacao2".equals(item.getFieldName()) &&
								item.getString() != null && item.getString() != "" && StringUtils.isNumeric(item.getString())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							pontosDeArticulacao.add(pontoDeArticulacao);
						}else if("movimento".equals(item.getFieldName())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							movimentos.add(movimento);
							System.out.println("Movimento nome "+movimento.getNome());
						}else if("movimento2".equals(item.getFieldName()) &&
								item.getString() != null && item.getString() != "" && StringUtils.isNumeric(item.getString())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							movimentos.add(movimento);
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
		}*/
		/*


		List<FileItem> items;
		try {
			items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			
			for (FileItem item : items) {
				System.out.println("item: "+item.getName());
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
		}*/

		

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