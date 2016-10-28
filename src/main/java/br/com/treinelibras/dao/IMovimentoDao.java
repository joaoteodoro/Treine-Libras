package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.Mao;
import br.com.treinelibras.modelo.Movimento;

public interface IMovimentoDao {
	public List<Movimento> lista();
	
	public Movimento buscaPorId(Long idMovimento);
	
	public List<Mao> buscaMaosAssociadas(Long idMovimento);
	
	public Long buscaUltimoId();
	
	public void adiciona(Movimento movimento);
	
	public void altera(Movimento movimento);
	
	public void remove(Long id);
}
