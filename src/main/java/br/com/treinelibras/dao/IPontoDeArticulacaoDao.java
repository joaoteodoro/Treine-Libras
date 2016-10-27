package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.Mao;
import br.com.treinelibras.modelo.PontoDeArticulacao;

public interface IPontoDeArticulacaoDao {
	public List<PontoDeArticulacao> lista();
	
	public PontoDeArticulacao buscaPorId(Long idPontoDeArticulacao);
	
	public List<Mao> buscaMaosAssociadas(Long idPontoDeArticulacao);
	
	public Long buscaUltimoId();
	
	public void adiciona(PontoDeArticulacao pontoDeArticulacao);
	
	public void altera(PontoDeArticulacao pontoDeArticulacao);
	
	public void remove(Long id);
}
