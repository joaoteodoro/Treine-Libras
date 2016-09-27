package br.com.treinelibras.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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
import org.apache.log4j.Logger;
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
import br.com.treinelibras.dao.IUsuarioDao;
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
	
	@Autowired
	IUsuarioDao usuarioDao;

	private static final Logger logger = Logger.getLogger(SinalController.class);

	@RequestMapping("listaSinais")
	public String lista(Model model) {
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO SinalController.lista()");
		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();

		List<String> categorias = dao.listaCategorias();

		for (String categoria : categorias) {
			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
			sinaisPorCategoria.put(categoria, sinais);
		}
		
		System.out.println("Quantidade de categorias: "+sinaisPorCategoria.size());
		
		model.addAttribute("categorias", sinaisPorCategoria);
		
		System.out.println("======================================== FIM SinalController.lista()");
		return "glossario";
	}

	@RequestMapping("listaSinaisExercicios")
	public String listaSinaisExercicios(Model model) {
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO SinalController.listaSinaisExercicios()");
		
		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();

		List<String> categorias = dao.listaCategorias();

		for (String categoria : categorias) {
			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
			sinaisPorCategoria.put(categoria, sinais);
		}
		
		System.out.println("Quantidade de categorias: "+sinaisPorCategoria.size());

		model.addAttribute("categorias", sinaisPorCategoria);
		
		System.out.println("======================================== FIM SinalController.listaSinaisExercicios()");
		return "exercicios";
	}

	@RequestMapping("listaSinaisAvaliar")
	public String listaSinaisAvaliar(Model model) {
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO SinalController.listaSinaisAvaliar()");
		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();

		List<String> categorias = dao.listaCategorias();

		for (String categoria : categorias) {
			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
			sinaisPorCategoria.put(categoria, sinais);
		}

		System.out.println("Quantidade de categorias: "+sinaisPorCategoria.size());
		
		model.addAttribute("categorias", sinaisPorCategoria);
		
		System.out.println("======================================== FIM SinalController.listaSinaisAvaliar()");
		return "avaliar";
	}

	@RequestMapping("mostraSinal")
	public String mostra(Long id, Model model) throws ClassNotFoundException {
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO SinalController.mostra()");
		
		Sinal sinal = dao.buscaPorId(id);
		model.addAttribute("sinal", sinal);
		
		System.out.println("sinal.toString: " + sinal.toString());
		System.out.println("======================================== FIM SinalController.mostra()");
		return "sinal-interprete";
	}

	@Transactional
	@RequestMapping("calculaNota")
	public String calculaNota(Long id, Model model, HttpServletRequest request) {
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO SinalController.calculaNota()");
		
		Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");
		System.out.println("usuario: " + usuarioLogado.getUsuario() + " / " + usuarioLogado.getIdUsuario());
		float nota = dao.notaSinalPorUsuario(usuarioLogado.getIdUsuario(), id);
		System.out.println("nota: " + nota);
		model.addAttribute("nota", nota);
		
		System.out.println("======================================== FIM SinalController.calculaNota()");
		return "nota-sinal";
	}

	@Transactional
	@RequestMapping("executarSinal")
	public String executarSinal(Long id, Model model) {
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO SinalController.executarSinal()");

		Sinal sinal = dao.buscaPorId(id);
		model.addAttribute("sinal", sinal);
		System.out.println("sinal.toString: " + sinal.toString());

		System.out.println("======================================== FIM SinalController.executarSinal()");
		
		return "executar-sinal";
	}

	@RequestMapping("avaliacoes")
	public String avaliacoes(Model model, HttpSession session) {
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO SinalController.avaliacoes()");
		
		System.out.println("%%%  SinalController > avaliacoes ");
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		List<Sinal> melhoresAvaliacoes = dao.listaSinaisMelhoresAvaliacoes(usuario);
		model.addAttribute("melhoresAvaliacoes", melhoresAvaliacoes);

		List<Sinal> pioresAvaliacoes = dao.listaSinaisPioresAvaliacoes(usuario);
		model.addAttribute("pioresAvaliacoes", pioresAvaliacoes);

		System.out.println("======================================== FIM SinalController.avaliacoes()");
		return "index";
	}

	@RequestMapping("calculaNotaUsuarios")
	public String calculaNotaUsuarios(Long idSinal, Long idUsuario, Model model, HttpServletRequest request) {
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO SinalController.calculaNotaUsuarios()");
		
		
		float nota = dao.notaSinalPorUsuario(idUsuario, idSinal);
		model.addAttribute("nota", nota);
		
		System.out.println("======================================== FIM SinalController.calculaNotaUsuarios()");
		return "nota-sinal";
	}

	@RequestMapping("gravaSinalSessao")
	@ResponseBody
	public String gravaSinalSessao(Long idSinal, Model model, HttpSession session) {
		Sinal sinal = dao.buscaPorId(idSinal);
		session.setAttribute("sinalContexto", sinal);
		return "";
	}

	@RequestMapping("listarSinais")
	public String listarSinais(Model model) {
		logger.info("exibindo tabela com os sinais cadastrados");
		
		List<Sinal> sinais = dao.lista();
		model.addAttribute("sinais", sinais);
		return "lista-sinais";
	}
	
	@RequestMapping("listarUnidades")
	public String listarUnidades(Model model){
		List<Long> unidades = dao.buscaUnidades();
		model.addAttribute("unidades",unidades);
		return "unidades";
	}

	@RequestMapping("removerSinal")
	@Transactional
	public String removerSinal(Long idSinal, Model model) {
		System.out.println("Entrou removerSinal idSinal=" + idSinal);
		dao.remove(idSinal);
		System.out.println("Depois de remover");
		return "redirect:listarSinais";
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
	
	@RequestMapping("cadastrarSinalUnidadeAntes")
	public String cadastrarSinalUnidadeAntes(Model model, Long unidade) {
		List<ConfiguracaoDeMao> configuracoesDeMao = configuracaoDeMaoDao.lista();
		model.addAttribute("configuracoesDeMao", configuracoesDeMao);

		List<PontoDeArticulacao> pontosDeArticulacao = pontoDeArticulacaoDao.lista();
		model.addAttribute("pontosDeArticulacao", pontosDeArticulacao);

		List<Movimento> movimentos = movimentoDao.lista();
		model.addAttribute("movimentos", movimentos);

		List<ExpressaoFacial> expressoesFaciais = expressaoFacialDao.lista();
		model.addAttribute("expressoesFaciais", expressoesFaciais);
		
		model.addAttribute("unidade",unidade);

		return "cadastrar-sinal";
	}
	
	

	@RequestMapping("cadastrarSinal")
	@Transactional
	public String cadastrarSinal(Model model, HttpServletRequest request) {
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO cadastrarSinal()");

		Sinal sinal = new Sinal();

		boolean isMultiPart = FileUpload.isMultipartContent(request);

		if (isMultiPart) {
			System.out.println("Entrou");
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			String formulario = "";

			List<ConfiguracaoDeMao> configuracoesDeMao = new ArrayList<ConfiguracaoDeMao>();
			List<PontoDeArticulacao> pontosDeArticulacao = new ArrayList<PontoDeArticulacao>();
			List<Movimento> movimentos = new ArrayList<Movimento>();

			try {
				List items = upload.parseRequest(request);
				Iterator iter = items.iterator();

				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();

					if (item.getFieldName().equals("tipoForm")) {
						formulario = item.getString();
						System.out.println("Formulario: " + formulario);
					}

					if (!item.isFormField()) {
						String nomeArquivo = StringUtils.removerAcentos(sinal.getNome()) + "."
								+ item.getName().substring(item.getName().length() - 3, item.getName().length());
						if (item.getFieldName().equals("foto")) {
							// salvarFoto
							System.out.println("nomeArquivo: " + nomeArquivo);
							item.setFieldName(nomeArquivo);
							this.inserirImagemDiretorio(item, "img");
							sinal.setFoto(item.getFieldName());
						} else {
							// salvarVideo
							item.setFieldName(nomeArquivo);
							this.inserirImagemDiretorio(item, "videos");
							sinal.setVideo(item.getFieldName());
						}
					} else {
						if ("nome".equals(item.getFieldName())) {
							sinal.setNome(item.getString());
						} else if("unidade".equals(item.getFieldName())){
							sinal.setUnidade(Long.parseLong(item.getString()));
						}else if ("categoria".equals(item.getFieldName())) {
							sinal.setCategoria(item.getString());
						} else if ("orientacao".equals(item.getFieldName())) {
							sinal.setOrientacao(item.getString());
						} else if ("dificuldade".equals(item.getFieldName())) {
							sinal.setDificuldade(item.getString());
						} else if (item.getFieldName().startsWith("configuracaoDeMao") && item.getString() != null
								&& !"".equals(item.getString())) {
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao
									.buscaPorId(Long.parseLong(item.getString()));
							configuracoesDeMao.add(configuracaoDeMao);
						} else if (item.getFieldName().startsWith("pontoDeArticulacao") && item.getString() != null
								&& !"".equals(item.getString())) {
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao
									.buscaPorId(Long.parseLong(item.getString()));
							pontosDeArticulacao.add(pontoDeArticulacao);
						} else if (item.getFieldName().startsWith("movimento") && item.getString() != null
								&& !"".equals(item.getString())) {
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							movimentos.add(movimento);
						} else if ("expressao".equals(item.getFieldName())) {
							ExpressaoFacial expressaoFacial = expressaoFacialDao
									.buscaPorId(Long.parseLong(item.getString()));
							sinal.setExpressaoFacial(expressaoFacial);
							System.out.println("Expressao Facial nome: " + expressaoFacial.getNome());
						}
						System.out.println("Parametro de entrada (nome,valor): " + item.getFieldName() + "   /   "
								+ item.getString());
					}
				}
				sinal.setConfiguracoesDeMao(configuracoesDeMao);
				sinal.setPontosDeArticulacao(pontosDeArticulacao);
				sinal.setMovimentos(movimentos);
				dao.adiciona(sinal);
				System.out.println("Tamanho lista configuracoes de mao: " + sinal.getConfiguracoesDeMao().size());
				System.out.println("Tamanho lista pontos de articulacao: " + sinal.getPontosDeArticulacao().size());
				System.out.println("Tamanho lista movimento: " + sinal.getMovimentos().size());
			} catch (FileUploadException ex) {
				ex.printStackTrace();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		System.out.println("======================================== FIM cadastrarSinal()");
		return "redirect:listarSinais";

	}

	@RequestMapping("alterarSinalAntes")
	@Transactional
	public String alterarSinalAntes(Long idSinal, Model model) {

		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO alterarSinalAntes()");

		List<ConfiguracaoDeMao> configuracoesDeMao = configuracaoDeMaoDao.lista();
		model.addAttribute("configuracoesDeMao", configuracoesDeMao);

		List<PontoDeArticulacao> pontosDeArticulacao = pontoDeArticulacaoDao.lista();
		model.addAttribute("pontosDeArticulacao", pontosDeArticulacao);

		List<Movimento> movimentos = movimentoDao.lista();
		model.addAttribute("movimentos", movimentos);

		List<ExpressaoFacial> expressoesFaciais = expressaoFacialDao.lista();
		model.addAttribute("expressoesFaciais", expressoesFaciais);

		Sinal sinal = dao.buscaPorId(idSinal);
		model.addAttribute("sinal", sinal);

		System.out.println("Tamanho lista configMao sinal: " + sinal.getConfiguracoesDeMao().size());
		System.out.println("Tamanho lista pontoArticulacao sinal: " + sinal.getPontosDeArticulacao().size());
		System.out.println("Tamanho lista movimento sinal: " + sinal.getMovimentos().size());

		System.out.println("======================================== FIM alterarSinalAntes()");

		return "altera-sinal";
	}

	@RequestMapping("alterarSinal")
	@Transactional
	public String alterarSinal(Model model, HttpServletRequest request) {

		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO alterarSinal()");

		boolean isMultiPart = FileUpload.isMultipartContent(request);

		Sinal sinal = null;

		if (isMultiPart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);

			try {
				List items = upload.parseRequest(request);
				Iterator iter = items.iterator();

				List<ConfiguracaoDeMao> configuracoesDeMao = new ArrayList<ConfiguracaoDeMao>();
				List<PontoDeArticulacao> pontosDeArticulacao = new ArrayList<PontoDeArticulacao>();
				List<Movimento> movimentos = new ArrayList<Movimento>();

				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();

					if (!item.isFormField() && item != null && !"".equals(item.getName())) {
						String nomeArquivo = StringUtils.removerAcentos(sinal.getNome()) + "."
								+ item.getName().substring(item.getName().length() - 3, item.getName().length());
						if (item.getFieldName().equals("foto") && item != null) {
							// salvarFoto
							System.out.println("Arquivo de Entrada ->" + item.getFieldName() + ": " + nomeArquivo);
							item.setFieldName(nomeArquivo);
							this.inserirImagemDiretorio(item, "img");
							sinal.setFoto(item.getFieldName());
						} else if (item.getFieldName().equals("video") && item != null) {
							// salvarVideo
							System.out.println("Arquivo de Entrada ->" + item.getFieldName() + ": " + nomeArquivo);
							item.setFieldName(nomeArquivo);
							this.inserirImagemDiretorio(item, "videos");
							sinal.setVideo(item.getFieldName());
						}
					} else {
						if ("idSinal".equals(item.getFieldName())) {
							sinal = dao.buscaPorId(Long.parseLong(item.getString()));
							// sinal.setConfiguracoesDeMao(new
							// ArrayList<ConfiguracaoDeMao>());
							// System.out.println("Tamanho lista configuracoes
							// de mao: "+sinal.getConfiguracoesDeMao().size());
							// sinal.setPontosDeArticulacao(new
							// ArrayList<PontoDeArticulacao>());
							// System.out.println("Tamanho lista pontos de
							// articulacao:
							// "+sinal.getPontosDeArticulacao().size());
							// sinal.setMovimentos(new ArrayList<Movimento>());
							// System.out.println("Tamanho lista movimento:
							// "+sinal.getMovimentos().size());
						} else if ("nome".equals(item.getFieldName())) {
							System.out.println("Nome: " + item.getString());
							sinal.setNome(item.getString());
						} else if("unidade".equals(item.getFieldName())){
							sinal.setUnidade(Long.parseLong(item.getString()));
						}else if ("categoria".equals(item.getFieldName())
								&& !item.getString().equals(sinal.getCategoria())) {
							sinal.setCategoria(item.getString());
						} else if ("orientacao".equals(item.getFieldName())
								&& !item.getString().equals(sinal.getOrientacao())) {
							sinal.setOrientacao(item.getString());
						} else if ("dificuldade".equals(item.getFieldName())
								&& !item.getString().equals(sinal.getDificuldade())) {
							sinal.setDificuldade(item.getString());
						} else if (item.getFieldName().startsWith("configuracaoDeMao") && item.getString() != null
								&& !"".equals(item.getString())) {
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao
									.buscaPorId(Long.parseLong(item.getString()));
							// sinal.getConfiguracoesDeMao().add(configuracaoDeMao);
							configuracoesDeMao.add(configuracaoDeMao);
						} else if (item.getFieldName().startsWith("pontoDeArticulacao") && item.getString() != null
								&& !"".equals(item.getString())) {
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao
									.buscaPorId(Long.parseLong(item.getString()));
							// sinal.getPontosDeArticulacao().add(pontoDeArticulacao);
							pontosDeArticulacao.add(pontoDeArticulacao);
						} else if (item.getFieldName().startsWith("movimento") && item.getString() != null
								&& !"".equals(item.getString())) {
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							// sinal.getMovimentos().add(movimento);
							movimentos.add(movimento);
						} else if ("expressao".equals(item.getFieldName())) {
							ExpressaoFacial expressaoFacial = expressaoFacialDao
									.buscaPorId(Long.parseLong(item.getString()));
							if (!expressaoFacial.equals(sinal.getExpressaoFacial())) {
								sinal.setExpressaoFacial(expressaoFacial);
							}
						}
						System.out.println("Parametro de entrada -> " + item.getFieldName() + ": " + item.getString());
					}
				}
				sinal.setConfiguracoesDeMao(configuracoesDeMao);
				sinal.setPontosDeArticulacao(pontosDeArticulacao);
				sinal.setMovimentos(movimentos);
				dao.altera(sinal);
			} catch (FileUploadException ex) {
				ex.printStackTrace();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		System.out.println("======================================== FIM alterarSinal()");
		return "redirect:listarSinais";
	}

	private void inserirImagemDiretorio(FileItem item, String pasta) {
		String caminho = servletContext.getRealPath("/resources/" + pasta) + "/";
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
	
	@RequestMapping("listaSinaisPorUnidade")
	public String listaSinaisPorUnidade(Model model, Long unidade){
		List<Sinal> sinaisUnidade = dao.buscaSinaisPorUnidade(unidade);
		model.addAttribute("sinaisUnidade",sinaisUnidade);
		model.addAttribute("unidade",unidade);
		return "lista-sinais-unidade";
	}

}