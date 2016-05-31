package br.com.treinelibras.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.treinelibras.modelo.Usuario;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		if (uri.endsWith("loginForm") || uri.endsWith("efetuaLogin") || uri.contains("resources")) {
			return true;
		} 

		if (request.getSession().getAttribute("usuarioLogado") != null) {
//			System.out.println("### usuario logado != null");
//			Usuario usuario = (Usuario)request.getSession().getAttribute("usuarioLogado");
//			System.out.println("### nome usuario: "+usuario.getUsuario());
			return true;
		}

		response.sendRedirect("loginForm");
		return false;

	}

}
