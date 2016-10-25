package br.com.treinelibras.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.IConfiguracaoDeMaoDao;
import br.com.treinelibras.modelo.ConfiguracaoDeMao;

@Controller
@Transactional
public class ConfiguracaoDeMaoController {
	
	@Autowired
	IConfiguracaoDeMaoDao configuracaoDeMaoDao;
	
	@RequestMapping("configuracoesDeMao")
	public String configuracoesDeMao(Model model){
		List<ConfiguracaoDeMao> configuracoesDeMao = configuracaoDeMaoDao.lista();
		model.addAttribute("configuracoeDeMao",configuracoesDeMao);
		return "configuracoesdemao";
	}
	
}
