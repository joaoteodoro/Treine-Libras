package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.AvaliacaoFuzzy;
import br.com.treinelibras.modelo.Usuario;

public interface IAvaliacaoFuzzyDao {
	
	public void adiciona(AvaliacaoFuzzy avaliacaoFuzzy);
	
	public AvaliacaoFuzzy buscaPorAvaliadorAvaliadoSinal(Long idAlunoAvaliador, Long idAlunoAvaliado, Long idSinal);
	
	public void altera(AvaliacaoFuzzy avaliacaoFuzzy);
	
	public int buscaQuantidadeAvaliacoesPorMatriz(Long idMatrizAvaliacao);
	
	public int buscaQuantidadeAvaliacoesJaAvaliadasPorMatriz(Long idMatrizAvaliacao);
	
	public List<Usuario> buscaAlunosAvaliadosPorMatrizAvaliacao(Long idMatrizAvaliacao);
}
