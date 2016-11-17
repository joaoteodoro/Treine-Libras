package br.com.treinelibras.dao;

import br.com.treinelibras.modelo.AvaliacaoFuzzy;

public interface IAvaliacaoFuzzyDao {
	
	public void adiciona(AvaliacaoFuzzy avaliacaoFuzzy);
	
	public AvaliacaoFuzzy buscaPorAvaliadorAvaliadoSinal(Long idAlunoAvaliador, Long idAlunoAvaliado, Long idSinal);
}
