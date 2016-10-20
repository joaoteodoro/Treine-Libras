package br.com.treinelibras.dao;

import br.com.treinelibras.modelo.Mao;

public interface IMaoDao {
	
	public void adiciona(Mao mao);
	
	public Mao buscaPorId(Long id);
	
	public void altera(Mao mao);
	
	public void remove(Long idMao);

}
