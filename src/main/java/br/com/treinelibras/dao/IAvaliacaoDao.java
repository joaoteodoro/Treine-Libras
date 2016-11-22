package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.Avaliacao;

public interface IAvaliacaoDao {
	public void adicionaAvaliacao(Avaliacao avaliacao);
	
	public Avaliacao existeAvaliacaoGravada(Long idUsuario, Long idGravacao);
	
	public void alteraAvaliacao(Avaliacao avaliacao);
	
	public void apagaAvaliacoes(Long idGravacao);
	
	public int buscaQuantidadeAvaliacoesPorGravacao(Long idGravacao);
	
	public List<Avaliacao> buscaAvaliacoesPorAlunoSinal(Long idAlunoAvaliado, Long idSinal);
}
