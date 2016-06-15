package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.PontoDeArticulacao;

public interface IPontoDeArticulacaoDao {
	public List<PontoDeArticulacao> lista();
	
	public PontoDeArticulacao buscaPorId(Long idPontoDeArticulacao);
}
