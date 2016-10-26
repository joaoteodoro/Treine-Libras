package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.ConfiguracaoDeMao;

@Repository
public class ConfiguracaoDeMaoDao implements IConfiguracaoDeMaoDao {
	
	@PersistenceContext
	EntityManager manager;

	@SuppressWarnings("unchecked")
	@Override
	public List<ConfiguracaoDeMao> lista() {
		return manager.createQuery("select c from ConfiguracaoDeMao c").getResultList();
	}
	
	@Override
	public ConfiguracaoDeMao buscaPorId(Long id) {
		return manager.find(ConfiguracaoDeMao.class, id);
	}

	@Override
	public Long buscaUltimoId() {
		Query query = manager.createQuery("select max(c.idConfiguracaoDeMao) from ConfiguracaoDeMao c");
		return (Long)query.getSingleResult();
	}

	@Override
	public void adiciona(ConfiguracaoDeMao configuracaoDeMao) {
		manager.persist(configuracaoDeMao);
	}

	@Override
	public void altera(ConfiguracaoDeMao configuracaoDeMao) {
		manager.merge(configuracaoDeMao);
	}

	@Override
	public void remove(Long id) {
		ConfiguracaoDeMao configuracaoDeMao = buscaPorId(id);
		try {
			manager.remove(configuracaoDeMao);
		} catch (Exception e) {
		}
		
	}
}
