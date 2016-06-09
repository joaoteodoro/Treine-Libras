package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.Movimento;

@Repository
public class MovimentoDao implements IMovimentoDao {
	
	@PersistenceContext
	EntityManager manager;

	@Override
	public List<Movimento> lista() {
		return manager.createQuery("select m from Movimento m").getResultList();
	}

}
