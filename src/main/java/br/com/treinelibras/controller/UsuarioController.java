package br.com.treinelibras.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.IUsuarioDao;
import br.com.treinelibras.modelo.Usuario;

@Transactional
@Controller
public class UsuarioController {
	
	@Autowired
	IUsuarioDao dao;
	
	@RequestMapping("novoUsuario")
	public String form(){
		return "cadastro-usuario";
	}
	
	@RequestMapping("adicionaUsuario")
	public String adicionaUsuario(@Valid Usuario usuario, HttpSession session){
		dao.adiciona(usuario);
		Usuario user = (Usuario)session.getAttribute("usuarioLogado");
		if(user != null){
			if("aluno".equals(usuario.getPerfil())){
				return "redirect:alunos";
			}else if("professor".equals(usuario.getPerfil())){
				return "redirect:professores";
			}
		}
		return "login";
	}
	
	@RequestMapping("homeAdmin")
	public String homeAdmin(){
		return "home-admin";
	}
	
	@RequestMapping("alunos")
	public String alunos(Model model){
		List<Usuario> alunos = dao.buscaPorPerfil("aluno");
		model.addAttribute("alunos",alunos);
		return "alunos";
	}
	
	@RequestMapping("cadastrarAlunoAntes")
	public String cadastrarAlunoAntes(){
		return "cadastrar-aluno";
	}
	
	@RequestMapping("alterarSenhaAntes")
	public String alterarSenhaAntes(Model model, Long id){
		Usuario usuario = dao.buscaPorId(id);
		model.addAttribute("usuario",usuario);
		return "alterar-senha";
	}
	
	@RequestMapping("removerUsuario")
	public String removerUsuario(Long id){
		Usuario usuario = dao.buscaPorId(id);
		String retorno = usuario.getPerfil().equals("professor") ? "professores" : "alunos";
		dao.remove(id);
		return retorno;
	}
	
	@RequestMapping("alterarSenhaUsuario")
	public String alterarSenhaUsuario(@Valid Usuario usuario){
		dao.altera(usuario);
		if("aluno".equals(usuario.getPerfil())){
			return "redirect:alunos";
		}else if("professor".equals(usuario.getPerfil())){
			return "redirect:professores";
		}
		return "redirect:alunos";
	}
	
	@RequestMapping("professores")
	public String professores(Model model){
		List<Usuario> professores = dao.buscaPorPerfil("professor");
		model.addAttribute("professores",professores);
		return "professores";
	}
	
	@RequestMapping("cadastrarProfessorAntes")
	public String cadastrarProfessorAntes(){
		return "cadastrar-professor";
	}
}