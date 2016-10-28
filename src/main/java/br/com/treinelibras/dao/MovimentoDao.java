package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.Mao;
import br.com.treinelibras.modelo.Movimento;

@Repository
public class MovimentoDao implements IMovimentoDao {
	
	@PersistenceContext
	EntityManager manager;

	@Override
	public List<Movimento> lista() {
		return manager.createQuery("select m from Movimento m").getResultList();
	}
	
	@Override
	public Movimento buscaPorId(Long idMovimento) {
		return manager.find(Movimento.class, idMovimento);
	}
	
	public List<Mao> buscaMaosAssociadas(Long idMovimento){
		Query query = manager.createQuery("select m from Mao m join m.movimento mo where mo.idMovimento = :idMovimento");
		query.setParameter("idMovimento", idMovimento);
		return query.getResultList();
	}
	
	public Long buscaUltimoId() {
		Query query = manager.createQuery("select max(m.idMovimento) from Movimento m");
		return (Long)query.getSingleResult();
	}
	
	@Override
	public void adiciona(Movimento movimento) {
		manager.persist(movimento);
	}
	
	@Override
	public void altera(Movimento movimento) {
		manager.merge(movimento);
	}

	@Override
	public void remove(Long id) {
		Movimento movimento  = buscaPorId(id);
		manager.remove(movimento);
	}
}
