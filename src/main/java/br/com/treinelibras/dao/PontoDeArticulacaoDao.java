package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

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

}
