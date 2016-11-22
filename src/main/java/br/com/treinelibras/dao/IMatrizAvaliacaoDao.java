package br.com.treinelibras.dao;

import br.com.treinelibras.modelo.MatrizAvaliacaoFuzzy;

public interface IMatrizAvaliacaoDao {
	
	public void adiciona(MatrizAvaliacaoFuzzy matrizAvaliacaoFuzzy);
	
	public void altera(MatrizAvaliacaoFuzzy matrizAvaliacaoFuzzy);
}
