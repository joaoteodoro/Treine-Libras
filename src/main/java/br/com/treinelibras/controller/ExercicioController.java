package br.com.treinelibras.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.ISinalDao;
import br.com.treinelibras.dao.IUsuarioDao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

@Controller
public class ExercicioController {

	@Autowired
	ISinalDao sinalDao;
	
	@Autowired
	IUsuarioDao usuarioDao;

	@RequestMapping("definirPesoInicialDeAvaliacao")
	public String definirPesoInicialDeAvaliacao(Model model) {
		List<Sinal> sinais = sinalDao.buscaSinalQueDefinePesoInicial();
		model.addAttribute("sinais", sinais);

		HashMap<Sinal, List<Sinal>> sinaisParaTeste = new HashMap<Sinal, List<Sinal>>();

		for (Sinal sinal : sinais) {
			List<Sinal> nomesSinais = recuperaNomesSinais(sinal);
			sinaisParaTeste.put(sinal, nomesSinais);
		}

		model.addAttribute("sinaisIniciais", sinaisParaTeste);

		return "exercicios-iniciais";
	}
	
	@RequestMapping("resultadoAvaliacao")
	@Transactional
	public String resultadoAvaliacao(Model model, HttpSession session, int pontuacao){
		System.out.println();
		System.out.println();
		System.out.println("======================================== INICIO resultadoAvaliacao()");
		
		System.out.println("Pontuacao: "+pontuacao);
		Usuario usuario = (Usuario)session.getAttribute("usuarioLogado");
		usuario.setPrimeiroAcesso(false);
		usuario.setPesoAvaliacao(usuario.getPesoAvaliacao() + (pontuacao * 0.05f));
		usuarioDao.altera(usuario);
		
		session.setAttribute("usuarioLogado", usuario);
		
		System.out.println("======================================== FIM resultadoAvaliacao()");
		return "redirect:avaliacoes";
	}

	public List<Sinal> recuperaNomesSinais(Sinal sinalParametro) {
		List<Sinal> sinais = sinalDao.buscaSinaisUnidadeAtual();
		
		List<Sinal> retorno = new ArrayList<Sinal>();

		// embaralhando elementos da lista de nomes de sinais
		Collections.shuffle(sinais);

		retorno.add(sinalParametro);
		for (Sinal sinalIteracao : sinais) {
			if (!sinalIteracao.getNome().equals(sinalParametro.getNome())) {
				retorno.add(sinalIteracao);
			}
			if (retorno.size() == 3) {
				break;
			}
		}
		
		Collections.shuffle(retorno);
		return retorno;
	}
}