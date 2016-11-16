package br.com.treinelibras.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.AvaliacaoFuzzy;

@Repository
public class AvaliacaoFuzzyDao implements IAvaliacaoFuzzyDao{

	@PersistenceContext
	EntityManager manager;
	
	public void adiciona(AvaliacaoFuzzy avaliacaoFuzzy){
		manager.persist(avaliacaoFuzzy);
	}
	
}
