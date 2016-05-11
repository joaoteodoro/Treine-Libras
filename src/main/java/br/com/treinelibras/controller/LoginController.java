package br.com.treinelibras.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.IUsuarioDao;
import br.com.treinelibras.modelo.Usuario;

@Controller
public class LoginController {
	
	@Autowired
	IUsuarioDao dao;
	
	@RequestMapping("loginForm")
	public String loginForm(){
		return "login";
	}
	
	@RequestMapping("index")
	public String index(){
		return "index";
	}
	
	@Transactional
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session) throws ClassNotFoundException{
		System.out.println("Teste Validacao Usuario: "+usuario.getUsuario()+ " "+usuario.getSenha());
		if(dao.existeUsuario(usuario)){
			session.setAttribute("usuarioLogado", usuario);
			return "index";
		}
		return "redirect:loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:loginForm";
	}
}
