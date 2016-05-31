package br.com.treinelibras.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.IAvaliacaoDao;
import br.com.treinelibras.dao.IGravacaoDao;
import br.com.treinelibras.modelo.Avaliacao;
import br.com.treinelibras.modelo.Gravacao;
import br.com.treinelibras.modelo.Usuario;

@Transactional
@Controller
public class AvaliacaoController {

	@Autowired
	IAvaliacaoDao dao;
	
	@Autowired
	IGravacaoDao gravacaoDao;
	
	@RequestMapping("adicionaAvaliacao")
	public String adicionaAvaliacao(Avaliacao avaliacao, Model model, HttpServletRequest request){
		Long idGravacao = Long.parseLong(request.getParameter("idGravacao"));
		System.out.println("iDGravacao (request): "+idGravacao);
		Gravacao gravacao = gravacaoDao.buscaPorId(idGravacao);
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		System.out.println("Usuario id: "+usuario.getIdUsuario());
		
		
		Avaliacao a = dao.existeAvaliacaoGravada(usuario.getIdUsuario(), idGravacao);
		if(a != null){
			avaliacao.setIdAvaliacao(a.getIdAvaliacao());
			avaliacao.setGravacao(a.getGravacao());
			avaliacao.setUsuario(a.getUsuario());
			dao.alteraAvaliacao(avaliacao);
		}else{
			avaliacao.setGravacao(gravacao);
			avaliacao.setUsuario(usuario);
			dao.adicionaAvaliacao(avaliacao);
		}
		
		return "redirect:listaSinaisAvaliar";
	}
	
	
}
