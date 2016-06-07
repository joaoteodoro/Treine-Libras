package br.com.treinelibras.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.treinelibras.dao.ISinalDao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

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
		return "glossario";
	}
	
	@RequestMapping("listaSinaisExercicios")
	public String listaSinaisExercicios(Model model){
		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();
		
		List<String> categorias = dao.listaCategorias();
		
		for (String categoria : categorias) {
			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
			sinaisPorCategoria.put(categoria, sinais);
		}
		
		model.addAttribute("categorias", sinaisPorCategoria);
		return "exercicios";
	}
	
	@RequestMapping("listaSinaisAvaliar")
	public String listaSinaisAvaliar(Model model){
		HashMap<String, List<Sinal>> sinaisPorCategoria = new HashMap<String, List<Sinal>>();
		
		List<String> categorias = dao.listaCategorias();
		
		for (String categoria : categorias) {
			List<Sinal> sinais = dao.listaSinalPorCategoria(categoria);
			sinaisPorCategoria.put(categoria, sinais);
		}
		
		model.addAttribute("categorias", sinaisPorCategoria);
		return "avaliar";
	}
	
	@RequestMapping("mostraSinal")
	public String mostra(Long id, Model model) throws ClassNotFoundException {
		model.addAttribute("sinal", dao.buscaPorId(id));
		return "sinal-interprete";
	}
	
	@Transactional
	@RequestMapping("calculaNota")
	public String calculaNota(Long id, Model model, HttpServletRequest request){
		System.out.println("Entrou no calcula nota");
		Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");
		System.out.println("usuario: "+usuarioLogado.getUsuario()+" / "+usuarioLogado.getIdUsuario());
		float nota = dao.notaSinalPorUsuario(usuarioLogado.getIdUsuario(), id);
		System.out.println("nota: "+nota);
		model.addAttribute("nota", nota);
		return "nota-sinal";
	}
	
	@RequestMapping("executarSinal")
	public String executarSinal(Long id, Model model){
		model.addAttribute("sinal", dao.buscaPorId(id));
		return "executar-sinal";
	}
	
	@RequestMapping("avaliacoes")
	public String avaliacoes(Model model, HttpSession session){
		System.out.println("%%%  SinalController > avaliacoes ");
		Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
		List<Sinal> melhoresAvaliacoes = dao.listaSinaisMelhoresAvaliacoes(usuario);
		model.addAttribute("melhoresAvaliacoes",melhoresAvaliacoes);
		
		List<Sinal> pioresAvaliacoes = dao.listaSinaisPioresAvaliacoes(usuario);
		model.addAttribute("pioresAvaliacoes",pioresAvaliacoes);
		
		return "index";
		
	}
	
	@RequestMapping("calculaNotaUsuarios")
	public String calculaNotaUsuarios(Long idSinal, Long idUsuario, Model model, HttpServletRequest request){
		float nota = dao.notaSinalPorUsuario(idUsuario, idSinal);
		model.addAttribute("nota", nota);
		return "nota-sinal";
	}
	
	
	@RequestMapping("gravaSinalSessao")
	@ResponseBody
	public String gravaSinalSessao(Long idSinal, Model model, HttpSession session){
		Sinal sinal = dao.buscaPorId(idSinal);
		session.setAttribute("sinalContexto", sinal);
		return "";
	}
}