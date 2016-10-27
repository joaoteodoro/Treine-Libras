package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.Mao;
import br.com.treinelibras.modelo.PontoDeArticulacao;

@Repository
public class PontoDeArticulacaoDao implements IPontoDeArticulacaoDao {

	@PersistenceContext
	EntityManager manager;
	
	@Override
	public List<PontoDeArticulacao> lista() {
		return manager.createQuery("select p from PontoDeArticulacao p").getResultList();
	}
	
	@Override
	public PontoDeArticulacao buscaPorId(Long idPontoDeArticulacao) {
		return manager.find(PontoDeArticulacao.class, idPontoDeArticulacao);
	}
	
	public List<Mao> buscaMaosAssociadas(Long idPontoDeArticulacao){
		Query query = manager.createQuery("select m from Mao m join m.pontoDeArticulacao p where p.idPontoDeArticulacao = :idPontoDeArticulacao");
		query.setParameter("idPontoDeArticulacao", idPontoDeArticulacao);
		return query.getResultList();	
	}
	
	@Override
	public Long buscaUltimoId() {
		Query query = manager.createQuery("select max(p.idPontoDeArticulacao) from PontoDeArticulacao p");
		return (Long)query.getSingleResult();
	}
	
	@Override
	public void adiciona(PontoDeArticulacao pontoDeArticulacao) {
		manager.persist(pontoDeArticulacao);
	}
	
	@Override
	public void altera(PontoDeArticulacao pontoDeArticulacao) {
		manager.merge(pontoDeArticulacao);
	}

	@Override
	public void remove(Long id) {
		PontoDeArticulacao pontoDeArticulacao = buscaPorId(id);
		manager.remove(pontoDeArticulacao);
	}

}
