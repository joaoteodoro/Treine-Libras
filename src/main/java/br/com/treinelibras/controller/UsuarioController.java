package br.com.treinelibras.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
	public String adiciona(@Valid Usuario usuario){
		dao.adiciona(usuario);
		return "login";
	}
}
