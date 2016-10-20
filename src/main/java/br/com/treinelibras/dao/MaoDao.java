package br.com.treinelibras.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.Mao;
import br.com.treinelibras.modelo.Sinal;

@Repository
public class MaoDao implements IMaoDao{
	
	@PersistenceContext
	EntityManager manager;
	
	public void adiciona(Mao mao){
		manager.persist(mao);
	}
	
	public Mao buscaPorId(Long id){
		return manager.find(Mao.class, id);
	}
	
	public void altera(Mao mao){
		manager.merge(mao);
	}
	
	public void remove(Long idMao) {
		Mao mao = manager.find(Mao.class, idMao);
		manager.remove(mao);
	}
}
