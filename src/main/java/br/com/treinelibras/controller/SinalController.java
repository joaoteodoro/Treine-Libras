package br.com.treinelibras.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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

import br.com.treinelibras.dao.IArquivoDao;
import br.com.treinelibras.dao.IConfiguracaoDeMaoDao;
import br.com.treinelibras.dao.IExpressaoFacialDao;
import br.com.treinelibras.dao.IMaoDao;
import br.com.treinelibras.dao.IMovimentoDao;
import br.com.treinelibras.dao.IPontoDeArticulacaoDao;
import br.com.treinelibras.dao.ISinalDao;
import br.com.treinelibras.dao.IUnidadeDao;
import br.com.treinelibras.dao.IUsuarioDao;
import br.com.treinelibras.modelo.ConfiguracaoDeMao;
import br.com.treinelibras.modelo.ExpressaoFacial;
import br.com.treinelibras.modelo.Mao;
import br.com.treinelibras.modelo.Movimento;
import br.com.treinelibras.modelo.Orientacao;
import br.com.treinelibras.modelo.PontoDeArticulacao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Unidade;
import br.com.treinelibras.modelo.Usuario;
import br.com.treinelibras.modelo.UtilizacaoDasMaos;
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
	
	@Autowired
	IUnidadeDao unidadeDao;
	
	@Autowired
	IMaoDao maoDao;
	
	@Autowired
	IArquivoDao arquivoDao;

	private static final Logger logger = Logger.getLogger(SinalController.class);

//	@RequestMapping("listaSinais")
//	public String lista(Model model) {
//		System.out.println();
//		System.out.println();
//		System.out.println("======================================== INICIO SinalController.lista()");
//		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();
//
//		List<String> categorias = dao.listaCategorias();
//
//		for (String categoria : categorias) {
//			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
//			sinaisPorCategoria.put(categoria, sinais);
//		}
//
//		System.out.println("Quantidade de categorias: " + sinaisPorCategoria.size());
//
//		model.addAttribute("categorias", sinaisPorCategoria);
//
//		// listagem de sinais por unidades
//
//		HashMap<Long, List<Sinal>> sinaisPorUnidade = new HashMap<Long, List<Sinal>>();
//		List<Long> unidades = dao.buscaUnidades();
//
//		for (Long unidade : unidades) {
//			List<Sinal> sinais = dao.buscaSinaisPorUnidade(unidade);
//			sinaisPorUnidade.put(unidade, sinais);
//		}
//
//		model.addAttribute("unidades", sinaisPorUnidade);
//
//		System.out.println("======================================== FIM SinalController.lista()");
//		return "glossario";
//	}
//
//	@RequestMapping("listaSinaisExercicios")
//	public String listaSinaisExercicios(Model model) {
//		System.out.println();
//		System.out.println();
//		System.out.println("======================================== INICIO SinalController.listaSinaisExercicios()");
//
//		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();
//
//		List<String> categorias = dao.listaCategorias();
//
//		for (String categoria : categorias) {
//			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
//			sinaisPorCategoria.put(categoria, sinais);
//		}
//
//		System.out.println("Quantidade de categorias: " + sinaisPorCategoria.size());
//
//		model.addAttribute("categorias", sinaisPorCategoria);
//
//		// listagem de sinais por unidades
//
//		HashMap<Long, List<Sinal>> sinaisPorUnidade = new HashMap<Long, List<Sinal>>();
//		List<Long> unidades = dao.buscaUnidades();
//
//		for (Long unidade : unidades) {
//			List<Sinal> sinais = dao.buscaSinaisPorUnidade(unidade);
//			sinaisPorUnidade.put(unidade, sinais);
//		}
//
//		model.addAttribute("unidades", sinaisPorUnidade);
//
//		System.out.println("======================================== FIM SinalController.listaSinaisExercicios()");
//		return "exercicios";
//	}
//
//	@RequestMapping("listaSinaisAvaliar")
//	public String listaSinaisAvaliar(Model model) {
//		System.out.println();
//		System.out.println();
//		System.out.println("======================================== INICIO SinalController.listaSinaisAvaliar()");
//		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();
//
//		List<String> categorias = dao.listaCategorias();
//
//		for (String categoria : categorias) {
//			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
//			sinaisPorCategoria.put(categoria, sinais);
//		}
//
//		System.out.println("Quantidade de categorias: " + sinaisPorCategoria.size());
//
//		model.addAttribute("categorias", sinaisPorCategoria);
//
//		// listagem de sinais por unidades
//
//		HashMap<Long, List<Sinal>> sinaisPorUnidade = new HashMap<Long, List<Sinal>>();
//		List<Unidade> unidades = unidadeDao.lista();
//
//		for (Unidade unidade : unidades) {
//			List<Sinal> sinais = dao.buscaSinaisPorUnidade(unidade);
//			sinaisPorUnidade.put(unidade, sinais);
//		}
//
//		model.addAttribute("unidades", sinaisPorUnidade);
//
//		System.out.println("======================================== FIM SinalController.listaSinaisAvaliar()");
//		return "avaliar";
//	}

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

//	@RequestMapping("listarUnidades")
//	public String listarUnidades(Model model) {
//		List<Long> unidades = dao.buscaUnidades();
//		model.addAttribute("unidades", unidades);
//		return "unidades";
//	}

	@RequestMapping("removerSinal")
	@Transactional
	public String removerSinal(Long idSinal, Model model) {
		System.out.println("Entrou removerSinal idSinal=" + idSinal);
		dao.remove(idSinal);
		System.out.println("Depois de remover");
		return "redirect:listarSinais";
	}

	@RequestMapping("alteraSinaisTeste")
	public String alteraSinaisTeste(String sinaisTeste) {
		String[] sinaisValor = sinaisTeste.split(",");
		for (String sinal : sinaisValor) {
			String[] sinalValor = sinal.split(":");
			Long idSinal = Long.parseLong(sinalValor[0]);
			boolean sinalTeste = false;
			if ("1".equals(sinalValor[1])) {
				sinalTeste = true;
			}
			System.out.println("idSinal: " + idSinal + " / " + "sinalTeste: " + sinalTeste);
			Sinal sinalAtualizar = dao.buscaPorId(idSinal);
			sinalAtualizar.setSinalDefinePesoInicial(sinalTeste);
			dao.altera(sinalAtualizar);
		}
		return "";
	}

	@RequestMapping("cadastrarSinalAntes")
	public String cadastrarSinalAntes(Model model, Long id) {
		List<ConfiguracaoDeMao> configuracoesDeMao = configuracaoDeMaoDao.lista();
		model.addAttribute("configuracoesDeMao", configuracoesDeMao);

		List<PontoDeArticulacao> pontosDeArticulacao = pontoDeArticulacaoDao.lista();
		model.addAttribute("pontosDeArticulacao", pontosDeArticulacao);

		List<Movimento> movimentos = movimentoDao.lista();
		model.addAttribute("movimentos", movimentos);

		List<ExpressaoFacial> expressoesFaciais = expressaoFacialDao.lista();
		model.addAttribute("expressoesFaciais", expressoesFaciais);
		
		model.addAttribute("orientacoes",Orientacao.values());
		
		model.addAttribute("utilizacoesDasMaos",UtilizacaoDasMaos.values());
		
		List<Unidade> unidades = unidadeDao.lista();
		model.addAttribute("unidades",unidades);
		
		if(id != null){
			Movimento movimento = movimentoDao.buscaPorId(id);
			model.addAttribute("movimento",movimento);
			model.addAttribute("logica",new String[] {"Alterar","a alteração"});
		}else{
			model.addAttribute("logica",new String[] {"Cadastrar","o cadastro"});
		}

		return "cadastrar-sinal";
	}

	@RequestMapping("cadastrarSinalUnidadeAntes")
	public String cadastrarSinalUnidadeAntes(Model model, Long idUnidade, Long id) {
		List<ConfiguracaoDeMao> configuracoesDeMao = configuracaoDeMaoDao.lista();
		model.addAttribute("configuracoesDeMao", configuracoesDeMao);

		List<PontoDeArticulacao> pontosDeArticulacao = pontoDeArticulacaoDao.lista();
		model.addAttribute("pontosDeArticulacao", pontosDeArticulacao);

		List<Movimento> movimentos = movimentoDao.lista();
		model.addAttribute("movimentos", movimentos);

		List<ExpressaoFacial> expressoesFaciais = expressaoFacialDao.lista();
		model.addAttribute("expressoesFaciais", expressoesFaciais);
		
		model.addAttribute("orientacoes",Orientacao.values());
		model.addAttribute("utilizacoesDasMaos",UtilizacaoDasMaos.values());

		if(idUnidade != null){
			Unidade unidade = unidadeDao.buscaPorId(idUnidade);
			model.addAttribute("unidadePrevia", unidade.getNumero());
		}
		
		List<Unidade> unidades = unidadeDao.lista();
		model.addAttribute("unidades",unidades);
		
		if(id != null){
			Movimento movimento = movimentoDao.buscaPorId(id);
			model.addAttribute("movimento",movimento);
			model.addAttribute("logica",new String[] {"Alterar","a alteração"});
			return "altera-sinal";
		}else{
			model.addAttribute("logica",new String[] {"Cadastrar","o cadastro"});
			return "cadastrar-sinal";
		}
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
			
			Mao maoPrincipal = new Mao();
			Mao maoSecundaria = new Mao();

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
							//this.inserirImagemDiretorio(item, "img");
							arquivoDao.inserirImagemDiretorio(item, "img");
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
						} else if ("categoria".equals(item.getFieldName())) {
							sinal.setCategoria(item.getString());
						} else if("utilizacaoDasMaos".equals(item.getFieldName())){
							sinal.setUtilizacaoDasMaos(UtilizacaoDasMaos.valueOf(item.getString()));
						}
						
						// parametros para mao principal
						else if("configuracaoDeMao1".equals(item.getFieldName())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							maoPrincipal.setConfiguracaoDeMao(configuracaoDeMao);
						}else if("pontoDeArticulacao1".equals(item.getFieldName())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							maoPrincipal.setPontoDeArticulacao(pontoDeArticulacao);
						}else if("movimento1".equals(item.getFieldName())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							maoPrincipal.setMovimento(movimento);
						}else if("orientacao1".equals(item.getFieldName())){
							maoPrincipal.setOrientacao(Orientacao.valueOf(item.getString()));
						}
						
						//parametros para mao secundaria
						else if("configuracaoDeMao2".equals(item.getFieldName()) && !"".equals(item.getString())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							maoSecundaria.setConfiguracaoDeMao(configuracaoDeMao);
						}else if("pontoDeArticulacao2".equals(item.getFieldName()) && !"".equals(item.getString())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							maoSecundaria.setPontoDeArticulacao(pontoDeArticulacao);
						}else if("movimento2".equals(item.getFieldName()) && !"".equals(item.getString())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							maoSecundaria.setMovimento(movimento);
						}else if("orientacao2".equals(item.getFieldName()) && !"".equals(item.getString())){
							maoSecundaria.setOrientacao(Orientacao.valueOf(item.getString()));
						}
						
//						
//						else if ("orientacao".equals(item.getFieldName())) {
//							sinal.setOrientacao(Orientacao.valueOf(item.getString()));
						 else if ("dificuldade".equals(item.getFieldName())) {
							sinal.setDificuldade(item.getString());
						 }
//						} else if (item.getFieldName().startsWith("configuracaoDeMao") && item.getString() != null
//								&& !"".equals(item.getString())) {
//							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao
//									.buscaPorId(Long.parseLong(item.getString()));
//							configuracoesDeMao.add(configuracaoDeMao);
//						} else if (item.getFieldName().startsWith("pontoDeArticulacao") && item.getString() != null
//								&& !"".equals(item.getString())) {
//							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao
//									.buscaPorId(Long.parseLong(item.getString()));
//							pontosDeArticulacao.add(pontoDeArticulacao);
//						} else if (item.getFieldName().startsWith("movimento") && item.getString() != null
//								&& !"".equals(item.getString())) {
//							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
//							movimentos.add(movimento);
						
						//expressao facial do sinal
						else if ("expressao".equals(item.getFieldName())) {
							ExpressaoFacial expressaoFacial = expressaoFacialDao
									.buscaPorId(Long.parseLong(item.getString()));
							sinal.setExpressaoFacial(expressaoFacial);
							System.out.println("Expressao Facial nome: " + expressaoFacial.getNome());
						}else if("unidade".equals(item.getFieldName())){
							Unidade unidade = unidadeDao.buscaPorId(Long.parseLong(item.getString()));
							sinal.setUnidade(unidade);
							System.out.println("Unidade nome: " + unidade.getNome());
						}
						System.out.println("Parametro de entrada (nome,valor): " + item.getFieldName() + "   /   "
								+ item.getString());
					}
				}
				maoDao.adiciona(maoPrincipal);
				sinal.setMaoPrincipal(maoPrincipal);
				if(UtilizacaoDasMaos.SOMENTE_UMA_MAO.equals(sinal.getUtilizacaoDasMaos())){
					sinal.setMaoSecundaria(null);
				}else if(UtilizacaoDasMaos.DUAS_MAOS_PARAMETROS_IGUAIS.equals(sinal.getUtilizacaoDasMaos())){
					sinal.setMaoSecundaria(maoPrincipal);
				}else{
					maoDao.adiciona(maoSecundaria);
					sinal.setMaoSecundaria(maoSecundaria);
				}
//				sinal.setConfiguracoesDeMao(configuracoesDeMao);
//				sinal.setPontosDeArticulacao(pontosDeArticulacao);
//				sinal.setMovimentos(movimentos);
				dao.adiciona(sinal);
//				System.out.println("Tamanho lista configuracoes de mao: " + sinal.getConfiguracoesDeMao().size());
//				System.out.println("Tamanho lista pontos de articulacao: " + sinal.getPontosDeArticulacao().size());
//				System.out.println("Tamanho lista movimento: " + sinal.getMovimentos().size());
			} catch (FileUploadException ex) {
				ex.printStackTrace();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		System.out.println("======================================== FIM cadastrarSinal()");
		//return "redirect:listarSinais";
		//return listaSinaisPorUnidade(model, sinal.getUnidade());
		return "redirect:listarSinaisPorUnidade?id="+sinal.getUnidade().getId();

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
		
		model.addAttribute("orientacoes",Orientacao.values());
		model.addAttribute("utilizacoesDasMaos",UtilizacaoDasMaos.values());
		
		Sinal sinal = dao.buscaPorId(idSinal);
		model.addAttribute("sinal", sinal);
		
		List<Unidade> unidades = unidadeDao.lista();
		model.addAttribute("unidades",unidades);

//		System.out.println("Tamanho lista configMao sinal: " + sinal.getConfiguracoesDeMao().size());
//		System.out.println("Tamanho lista pontoArticulacao sinal: " + sinal.getPontosDeArticulacao().size());
//		System.out.println("Tamanho lista movimento sinal: " + sinal.getMovimentos().size());

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

				Mao maoPrincipal = null;
				Mao maoSecundaria = null;
				
				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();

					if (!item.isFormField() && item != null && !"".equals(item.getName())) {
						String nomeArquivo = StringUtils.removerAcentos(sinal.getNome()) + "."
								+ item.getName().substring(item.getName().length() - 3, item.getName().length());
						if (item.getFieldName().equals("foto") && item != null) {
							// salvarFoto
							System.out.println("Arquivo de Entrada ->" + item.getFieldName() + ": " + nomeArquivo);
							item.setFieldName(nomeArquivo);
							//this.inserirImagemDiretorio(item, "img");
							arquivoDao.inserirImagemDiretorio(item, "img");
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
							maoPrincipal = maoDao.buscaPorId(sinal.getMaoPrincipal().getId());
							if(sinal.getMaoSecundaria() != null){
								maoSecundaria = maoDao.buscaPorId(sinal.getMaoSecundaria().getId());
							}else{
								maoSecundaria = new Mao();
							}
						} else if ("nome".equals(item.getFieldName())) {
							System.out.println("Nome: " + item.getString());
							sinal.setNome(item.getString());
						} else if ("categoria".equals(item.getFieldName())
								&& !item.getString().equals(sinal.getCategoria())) {
							sinal.setCategoria(item.getString());
//						} else if ("orientacao".equals(item.getFieldName())
//								&& !item.getString().equals(sinal.getOrientacao().toString())) {
//							sinal.setOrientacao(Orientacao.valueOf(item.getString()));
						} else if ("dificuldade".equals(item.getFieldName())
								&& !item.getString().equals(sinal.getDificuldade())) {
							sinal.setDificuldade(item.getString());
						} else if("utilizacaoDasMaos".equals(item.getFieldName())){
							sinal.setUtilizacaoDasMaos(UtilizacaoDasMaos.valueOf(item.getString()));
						}
						
						// parametros para mao principal
						else if("configuracaoDeMao1".equals(item.getFieldName())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							maoPrincipal.setConfiguracaoDeMao(configuracaoDeMao);
						}else if("pontoDeArticulacao1".equals(item.getFieldName())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							maoPrincipal.setPontoDeArticulacao(pontoDeArticulacao);
						}else if("movimento1".equals(item.getFieldName())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							maoPrincipal.setMovimento(movimento);
						}else if("orientacao1".equals(item.getFieldName())){
							maoPrincipal.setOrientacao(Orientacao.valueOf(item.getString()));
						}
						
						//parametros para mao secundaria
						else if("configuracaoDeMao2".equals(item.getFieldName()) && !"".equals(item.getString())){
							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
							maoSecundaria.setConfiguracaoDeMao(configuracaoDeMao);
						}else if("pontoDeArticulacao2".equals(item.getFieldName()) && !"".equals(item.getString())){
							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
							maoSecundaria.setPontoDeArticulacao(pontoDeArticulacao);
						}else if("movimento2".equals(item.getFieldName()) && !"".equals(item.getString())){
							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
							maoSecundaria.setMovimento(movimento);
						}else if("orientacao2".equals(item.getFieldName()) && !"".equals(item.getString())){
							maoSecundaria.setOrientacao(Orientacao.valueOf(item.getString()));
						}
						
//						else if (item.getFieldName().startsWith("configuracaoDeMao") && item.getString() != null
//								&& !"".equals(item.getString())) {
//							ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao
//									.buscaPorId(Long.parseLong(item.getString()));
//							// sinal.getConfiguracoesDeMao().add(configuracaoDeMao);
//							configuracoesDeMao.add(configuracaoDeMao);
//						} else if (item.getFieldName().startsWith("pontoDeArticulacao") && item.getString() != null
//								&& !"".equals(item.getString())) {
//							PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao
//									.buscaPorId(Long.parseLong(item.getString()));
//							// sinal.getPontosDeArticulacao().add(pontoDeArticulacao);
//							pontosDeArticulacao.add(pontoDeArticulacao);
//						} else if (item.getFieldName().startsWith("movimento") && item.getString() != null
//								&& !"".equals(item.getString())) {
//							Movimento movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
//							// sinal.getMovimentos().add(movimento);
//							movimentos.add(movimento);
						
						else if ("expressao".equals(item.getFieldName())) {
							ExpressaoFacial expressaoFacial = expressaoFacialDao
									.buscaPorId(Long.parseLong(item.getString()));
							if (!expressaoFacial.equals(sinal.getExpressaoFacial())) {
								sinal.setExpressaoFacial(expressaoFacial);
							}
						}else if("unidade".equals(item.getFieldName())){
							Unidade unidade = unidadeDao.buscaPorId(Long.parseLong(item.getString()));
							if(!unidade.equals(sinal.getUnidade())){
								sinal.setUnidade(unidade);
							}
						}
						System.out.println("Parametro de entrada -> " + item.getFieldName() + ": " + item.getString());
					}
				}
				maoDao.altera(maoPrincipal);
				sinal.setMaoPrincipal(maoPrincipal);
				if(UtilizacaoDasMaos.SOMENTE_UMA_MAO.equals(sinal.getUtilizacaoDasMaos())){
					sinal.setMaoSecundaria(null);
					if(maoSecundaria.getId() != null){
						maoDao.remove(maoSecundaria.getId());
					}
				}else if(UtilizacaoDasMaos.DUAS_MAOS_PARAMETROS_IGUAIS.equals(sinal.getUtilizacaoDasMaos())){
					sinal.setMaoSecundaria(maoPrincipal);
				}else{
					if(sinal.getMaoSecundaria() == null){
						maoDao.adiciona(maoSecundaria);
					}else{
						maoDao.altera(maoSecundaria);
					}
					sinal.setMaoSecundaria(maoSecundaria);
				}
//				sinal.setConfiguracoesDeMao(configuracoesDeMao);
//				sinal.setPontosDeArticulacao(pontosDeArticulacao);
//				sinal.setMovimentos(movimentos);
				dao.altera(sinal);
			} catch (FileUploadException ex) {
				ex.printStackTrace();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		System.out.println("======================================== FIM alterarSinal()");
		//return "redirect:listarSinais";
		return "redirect:listarSinaisPorUnidade?id="+sinal.getUnidade().getId();
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
}