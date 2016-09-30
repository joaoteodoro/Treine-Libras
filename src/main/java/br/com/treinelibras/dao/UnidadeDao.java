package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;


import br.com.treinelibras.modelo.Unidade;

@Repository
public class UnidadeDao implements IUnidadeDao{
	
	@PersistenceContext
	EntityManager manager;
	
	@Override
	public Unidade buscaPorId(Long id) {
		return manager.find(Unidade.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Unidade> lista() {
		return manager.createQuery("select u from Unidade u").getResultList();
	}
}
