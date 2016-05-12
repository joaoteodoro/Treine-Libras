package br.com.treinelibras.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.ISinalDao;
import br.com.treinelibras.modelo.Sinal;

@Transactional
@Controller
public class SinalController {
	
	@Autowired
	ISinalDao dao;
	
	@RequestMapping("listaSinais")
	public String lista(Model model){
		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();
		
		List<String> categorias = dao.listaCategorias();
		
		for (String categoria : categorias) {
			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
			sinaisPorCategoria.put(categoria, sinais);
		}
		
		model.addAttribute("categorias", sinaisPorCategoria);
		return "glosario";
	}
	
	@RequestMapping("mostraSinal")
	public String mostra(Long id, Model model) throws ClassNotFoundException {
		model.addAttribute("sinal", dao.buscaPorId(id));
		return "sinal-interprete";
	}
}