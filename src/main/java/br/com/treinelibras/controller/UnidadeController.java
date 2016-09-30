package br.com.treinelibras.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.IUnidadeDao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Unidade;

@Transactional
@Controller
public class UnidadeController {
	
	@Autowired
	IUnidadeDao unidadeDao;
	
	@RequestMapping("glossario")
	public String glossario(Model model){
		return recuperaTodasUninades(model, "glossario");
	}
	
	@RequestMapping("exercicios")
	public String exercicios(Model model){
		return recuperaTodasUninades(model, "exercicios");
	}
	
	@RequestMapping("avaliar")
	public String avaliar(Model model){
		return recuperaTodasUninades(model, "avaliar");
	}
	
	@RequestMapping("unidades")
	public String unidades(Model model){
		return recuperaTodasUninades(model, "unidades");
	}
	
	@RequestMapping("alterarUnidadeAntes")
	public String alterarUnidadeAntes(Model model, Long id){
		Unidade unidade = unidadeDao.buscaPorId(id);
		model.addAttribute("unidade",unidade);
		return "altera-unidade";
	}
	
	@RequestMapping("cadastrarUnidadeAntes")
	public String cadastrarUnidadeAntes(Model model){
		return "cadastro-unidade";
	}
	
	public String recuperaTodasUninades(Model model, String paginaRetorno){
		List<Unidade> unidades = unidadeDao.lista();
		for (Unidade unidade : unidades) {
			for (Sinal sinal : unidade.getSinais()) {
				System.out.println(sinal.toString());
			}
		}
		model.addAttribute("unidades",unidades);
		return paginaRetorno;
	}
}
