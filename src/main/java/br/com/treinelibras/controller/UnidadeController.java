package br.com.treinelibras.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.treinelibras.dao.IUnidadeDao;
import br.com.treinelibras.modelo.Avaliacao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Unidade;
import br.com.treinelibras.modelo.Usuario;

@Transactional
@Controller
public class UnidadeController {

	@Autowired
	IUnidadeDao unidadeDao;

	@RequestMapping("glossario")
	public String glossario(Model model) {
		return recuperaTodasUninades(model, "glossario");
	}

	@RequestMapping("exercicios")
	public String exercicios(Model model) {
		return recuperaTodasUninades(model, "exercicios");
	}

	@RequestMapping("avaliar")
	public String avaliar(Model model) {
		return recuperaTodasUninades(model, "avaliar");
	}

	@RequestMapping("unidades")
	public String unidades(Model model) {
		return recuperaTodasUninades(model, "unidades");
	}

	@RequestMapping("alterarUnidadeAntes")
	public String alterarUnidadeAntes(Model model, Long id) {
		Unidade unidade = unidadeDao.buscaPorId(id);
		model.addAttribute("unidade", unidade);
		return "altera-unidade";
	}

	@RequestMapping("cadastrarUnidadeAntes")
	public String cadastrarUnidadeAntes(Model model) {
		return "cadastro-unidade";
	}

	@RequestMapping("cadastrarUnidade")
	public String cadastrarUnidade(@Valid Unidade unidade) {
		unidadeDao.adiciona(unidade);
		return "redirect:unidades";
	}
	
	@RequestMapping("removerUnidade")
	public String removerUnidade(Long id, Model model){
		unidadeDao.remove(id);
		return "redirect:unidades";
	}
	
	@RequestMapping("listarSinaisPorUnidade")
	public String listarSinaisPorUnidade(Model model, Long id) {
		Unidade unidade = unidadeDao.buscaPorId(id);
		for (Sinal sinal : unidade.getSinais()) {
			System.out.println(sinal.toString());
		}
		model.addAttribute("unidade",unidade);
		return "lista-sinais-unidade";
	}

	public String recuperaTodasUninades(Model model, String paginaRetorno) {
		List<Unidade> unidades = unidadeDao.lista();
		for (Unidade unidade : unidades) {
			if (unidade.getSinais() != null) {
				for (Sinal sinal : unidade.getSinais()) {
					System.out.println(sinal.toString());
				}
			}
		}
		model.addAttribute("unidades", unidades);
		return paginaRetorno;
	}
}
