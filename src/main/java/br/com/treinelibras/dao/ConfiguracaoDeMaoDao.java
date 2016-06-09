package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.ConfiguracaoDeMao;

@Repository
public class ConfiguracaoDeMaoDao implements IConfiguracaoDeMaoDao {
	
	@PersistenceContext
	EntityManager manager;

	@Override
	public List<ConfiguracaoDeMao> lista() {
		return manager.createQuery("select c from ConfiguracaoDeMao c").getResultList();
	}

}
