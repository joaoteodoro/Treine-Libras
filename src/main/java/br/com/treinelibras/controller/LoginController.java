package br.com.treinelibras.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.treinelibras.dao.IUsuarioDao;
import br.com.treinelibras.modelo.Usuario;

@Controller
public class LoginController {
	
	@Autowired
	IUsuarioDao dao;
	
	@RequestMapping("validaLogin")
	@ResponseBody
	public String validaLogin(String usuario, String senha){
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Entrou validaLogin");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Usuario: "+usuario);
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Senha: "+senha);
		Usuario u = new Usuario();
		u.setUsuario(usuario);
		u.setSenha(senha);
		if(!dao.existeUsuario(u)){
			return "Usuário ou senha inválidos! Tente novamente.";
		}
		return "";
	}
	
	@RequestMapping("loginForm")
	public String loginForm(HttpSession session){
		if(session.getAttribute("usuarioLogado")!=null){
			return "redirect:index";
		}
		return "login";
	}
	
	@RequestMapping("index")
	public String index(){
		return "redirect:avaliacoes";
	}
	
	@Transactional
	@RequestMapping("efetuaLogin")
	public String efetuaLogin(Usuario usuario, HttpSession session) throws ClassNotFoundException{
		System.out.println("Teste Validacao Usuario: "+usuario.getUsuario()+ " "+usuario.getSenha());
		if(dao.existeUsuario(usuario)){
			usuario = dao.buscarPorUsuario(usuario.getUsuario());
			System.out.println("Usuario no momento de logar: "+usuario.getUsuario());
			session.setAttribute("usuarioLogado", usuario);
			return "redirect:avaliacoes";
		}
		return "redirect:loginForm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:loginForm";
	}
}
