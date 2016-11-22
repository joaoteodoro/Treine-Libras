package br.com.treinelibras.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.treinelibras.modelo.Usuario;
import br.com.treinelibras.util.StringUtils;


public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioLogado");
		String uri = request.getRequestURI();
		String [] partesUri = uri.split("/");
		String requestMapping = partesUri[partesUri.length-1];
		
		String[] paginasImpedidasPorAluno = {"homeAdministrador",	"homeProfessor",	"configuracoesDeMao",
				"cadastrarConfiguracaoDeMaoAntes",			"removerConfigMao",	
				"pontosDeArticulacao",						"cadastrarPontoDeArticulacaoAntes",
				"removerPontoDeArticulacao",				"movimentos",
				"cadastrarMovimentoAntes",					"removerMovimento",
				"expressoesFaciais",						"cadastrarExpressaoFacialAntes",
				"removerExpressaoFacial",					"unidades",
				"cadastrarUnidadeAntes",					"alterarUnidadeAntes",
				"removerUnidade",							"listarSinaisPorUnidade",
				"cadastrarSinalUnidadeAntes",				"cadastrarSinalAntes",
				"removerSinal",								"professores",
				"cadastrarProfessorAntes",					"removerUsuario",
				"alunos",									"avaliacoesRecebidasPorAluno"};
		
		String[] paginasImpedidasPorProfessor = {"homeAdministrador","professores","cadastrarProfessorAntes"};
		
		//paginas que podem ser acessadas sem necessidade de usuario logado
		if (uri.endsWith("adicionaUsuario") || uri.endsWith("novoUsuario") || uri.endsWith("loginForm")
				|| uri.endsWith("efetuaLogin") || uri.contains("resources") || uri.endsWith("validaLogin")) {
			return true;
		}
		
		if (request.getSession().getAttribute("usuarioLogado") != null) {
			if(usuario.getPerfil().equals("aluno") && !StringUtils.contemEmVetor(requestMapping, paginasImpedidasPorAluno)){
				return true;
			}
			
			if(usuario.getPerfil().equals("professor") && !StringUtils.contemEmVetor(requestMapping, paginasImpedidasPorProfessor)){
				return true;
			}
			
			if(usuario.getPerfil().equals("admin")){
				return true;
			}
		}

		response.sendRedirect("loginForm");
		return false;

	}
	
	/**
	 * Paginas que nao podem ser acessadas pelo perfil professor
	 * -homeAdministrador
	 * -homeProfessor
	 * -configuracoesDeMao
	 * 		-cadastrarConfiguracaoDeMaoAntes
	 * 		-removerConfigMao
	 * -pontosDeArticulacao
	 * 		-cadastrarPontoDeArticulacaoAntes
	 * 		-removerPontoDeArticulacao
	 * -movimentos
	 * 		-cadastrarMovimentoAntes
	 * 		-removerMovimento
	 * -expressoesFaciais
	 * 		-cadastrarExpressaoFacialAntes
	 * 		-removerExpressaoFacial
	 * -unidades
	 * 		-cadastrarUnidadeAntes
	 * 		-alterarUnidadeAntes
	 * 		-removerUnidade
	 * -listarSinaisPorUnidade
	 * 		-cadastrarSinalUnidadeAntes
	 * 		-cadastrarSinalAntes
	 * 		-removerSinal
	 * -alunos
	 * 		-removerUsuario
	 * 		-avaliacoesRecebidasPorAluno
	 */

}
