package br.com.treinelibras.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.MatrizAvaliacaoFuzzy;

@Repository
public class MatrizAvaliacaoDao implements IMatrizAvaliacaoDao{

	@PersistenceContext
	EntityManager manager;
	
	@Override
	public void adiciona(MatrizAvaliacaoFuzzy matrizAvaliacaoFuzzy) {
		manager.persist(matrizAvaliacaoFuzzy);
	}
	
	public void altera(MatrizAvaliacaoFuzzy matrizAvaliacaoFuzzy){
		manager.merge(matrizAvaliacaoFuzzy);
	}
	
}
