package br.com.treinelibras.dao;

import java.util.List;
import java.util.Map;

import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

public interface ISinalDao {
	public Sinal buscaPorId(Long id);
	
	public List<Sinal> lista();
	
	public List<String> listaCategorias();
	
	public List<Sinal> listaSinalPorCategoria(String categoria);
	
	public List<Sinal> listaSinaisMelhoresAvaliacoes(Usuario u);
	
	public float notaSinalPorUsuario(Long idUsuario, Long idSinal);
	
	public List<Sinal> listaSinaisPioresAvaliacoes(Usuario u);
}