package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

public interface ISinalDao {
	Sinal buscaPorId(Long id);
	
	List<Sinal> lista();
	
	List<Sinal> listaSinaisMelhoresAvaliacoes(Usuario u);
	
	List<Sinal> listaSinaisPioresAvaliacoes(Usuario u);
}