package br.com.treinelibras.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.IAvaliacaoDao;
import br.com.treinelibras.dao.IGravacaoDao;
import br.com.treinelibras.dao.ISinalDao;
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
	
	@Autowired
	ISinalDao sinalDao;
	
	@RequestMapping("adicionaAvaliacao")
	public String adicionaAvaliacao(Avaliacao avaliacao, Model model, HttpServletRequest request){
		System.out.println("Teste: "+request.getParameter("teste"));
		Long idGravacao = Long.parseLong(request.getParameter("idGravacao"));
		System.out.println("iDGravacao (request): "+idGravacao);
		Gravacao gravacao = gravacaoDao.buscaPorId(idGravacao);
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuarioLogado");
		System.out.println("Usuario id: "+usuario.getIdUsuario());
		
		
		Avaliacao a = dao.existeAvaliacaoGravada(usuario.getIdUsuario(), idGravacao);
		avaliacao.setUsuario(usuario);
		avaliacao.setNotaFinal(calcularNotaFinal(avaliacao.getNotaMedia(), usuario.getPesoAvaliacao()));
		
		if(a != null){
			avaliacao.setIdAvaliacao(a.getIdAvaliacao());
			avaliacao.setGravacao(a.getGravacao());
			//avaliacao.setUsuario(a.getUsuario());
			dao.alteraAvaliacao(avaliacao);
		}else{
			avaliacao.setGravacao(gravacao);
			//avaliacao.setUsuario(usuario);
			dao.adicionaAvaliacao(avaliacao);
		}
		
		return "redirect:avaliar";
	}
	
	public float calcularNotaFinal(float notaMedia, float pesoAvaliacao){
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO AvaliacaoController.calcularNotaFinal()");
		
		float notaFinal;
		//nota ruim
		if(notaMedia >= 0 && notaMedia <= 1.5){
			System.out.println("Nota Ruim");
			notaFinal = (notaMedia - ((notaMedia * pesoAvaliacao) - notaMedia));
		}else if(notaMedia >= 3.5 && notaMedia <=5){//nota boa
			System.out.println("Nota boa");
			notaFinal = notaMedia * pesoAvaliacao;
		}else{
			System.out.println("Nota Normal");
			notaFinal = notaMedia;
		}
		
		System.out.println("notaFinal: "+notaFinal);
		
		System.out.println("======================================== FIM AvaliacaoController.calculaNotaFinal()");
		
		return notaFinal;
	}
	
}
