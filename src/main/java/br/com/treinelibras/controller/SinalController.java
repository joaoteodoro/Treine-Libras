package br.com.treinelibras.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.ISinalDao;

@Transactional
@Controller
public class SinalController {
	
	@Autowired
	ISinalDao dao;
	
	@RequestMapping("listaSinais")
	public String lista(Model model){
		model.addAttribute("sinais", dao.lista());
		return "glosario";
	}
	
	@RequestMapping("mostraSinal")
	public String mostra(Long id, Model model) throws ClassNotFoundException {
		model.addAttribute("sinal", dao.buscaPorId(id));
		return "sinal-interprete";
	}
}