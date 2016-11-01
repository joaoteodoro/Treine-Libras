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
import br.com.treinelibras.dao.IUsuarioDao;
import br.com.treinelibras.modelo.Avaliacao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Unidade;
import br.com.treinelibras.modelo.Usuario;

@Transactional
@Controller
public class UnidadeController {

	@Autowired
	IUnidadeDao unidadeDao;

	@Autowired
	IUsuarioDao usuarioDao;

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
		model.addAttribute("ehAlteracao", "sim");
		return "cadastro-unidade";
	}

	@RequestMapping("alterarUnidade")
	public String alterarUnidade(@Valid Unidade unidade) {
		Unidade unidadeReal = unidadeDao.buscaPorId(unidade.getId());
		unidadeReal.setNome(unidade.getNome());
		unidadeReal.setNumero(unidade.getNumero());
		unidadeDao.altera(unidadeReal);
		return "redirect:unidades";
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
	public String removerUnidade(Long id, Model model) {
		unidadeDao.remove(id);
		return "redirect:unidades";
	}

	@RequestMapping("listarSinaisPorUnidade")
	public String listarSinaisPorUnidade(Model model, Long id) {
		Unidade unidade = unidadeDao.buscaPorId(id);
		for (Sinal sinal : unidade.getSinais()) {
			System.out.println(sinal.toString());
		}
		model.addAttribute("unidade", unidade);
		return "lista-sinais-unidade";
	}

	@RequestMapping("alterarUnidadeAtual")
	public String alterarUnidadeAtual(Long idUnidade) {
		List<Unidade> unidades = unidadeDao.lista();
		for (Unidade unidade : unidades) {
			if (unidade.getId() == idUnidade) {
				unidade.setUnidadeAtual(true);
			} else {
				unidade.setUnidadeAtual(false);
			}
			unidadeDao.altera(unidade);
		}
		usuarioDao.restaPrimeiroAcesso();
		return "redirect:unidades";
	}

	@RequestMapping("homeProfessor")
	public String homeProfessor() {
		return "home-professor";
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
