package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.ExpressaoFacial;

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
	
}
