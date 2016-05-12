package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

@Repository
public class SinalDao implements ISinalDao {
	
	@PersistenceContext
	EntityManager manager;

	public Sinal buscaPorId(Long id) {
		return manager.find(Sinal.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Sinal> lista() {
		return manager.createQuery("select s from Sinal s").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<String> listaCategorias() {
		return manager.createQuery("select distinct s.categoria from Sinal s").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Sinal> listaSinalPorCategoria(String categoria){
		Query query = manager.createQuery("select s from Sinal s where s.categoria = :paramCategoria");
		query.setParameter("paramCategoria", categoria);
		
		return query.getResultList();
	}

	public List<Sinal> listaSinaisMelhoresAvaliacoes(Usuario u) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Sinal> listaSinaisPioresAvaliacoes(Usuario u) {
		// TODO Auto-generated method stub
		return null;
	}

}
