package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.Movimento;

public interface IMovimentoDao {
	public List<Movimento> lista();
	
	public Movimento buscaPorId(Long idMovimento);
}
