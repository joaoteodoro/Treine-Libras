package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.ExpressaoFacial;
import br.com.treinelibras.modelo.Movimento;
import br.com.treinelibras.modelo.Sinal;

@Repository
public class ExpressaoFacialDao implements IExpressaoFacialDao {
	
	@PersistenceContext
	EntityManager manager;

	@Override
	public List<ExpressaoFacial> lista() {
		return manager.createQuery("select e from ExpressaoFacial e").getResultList();
	}

	@Override
	public ExpressaoFacial buscaPorId(Long idExpressaoFacial) {
		return manager.find(ExpressaoFacial.class, idExpressaoFacial);
	}
	
	public List<Sinal> buscaSinaisAssociados(Long idExpressaoFacial){
		Query query = manager.createQuery("select s from Sinal s join s.expressaoFacial e where e.idExpressaoFacial = :idExpressaoFacial");
		query.setParameter("idExpressaoFacial", idExpressaoFacial);
		return query.getResultList();
	}
	
	public Long buscaUltimoId() {
		Query query = manager.createQuery("select max(e.idExpressaoFacial) from ExpressaoFacial e");
		return (Long)query.getSingleResult();
	}
	
	@Override
	public void adiciona(ExpressaoFacial expressaoFacial) {
		manager.persist(expressaoFacial);
	}
	
	@Override
	public void altera(ExpressaoFacial expressaoFacial) {
		manager.merge(expressaoFacial);
	}

	@Override
	public void remove(Long id) {
		ExpressaoFacial expressaoFacial = buscaPorId(id);
		manager.remove(expressaoFacial);
	}
	
}
