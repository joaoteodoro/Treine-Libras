package br.com.treinelibras.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.AvaliacaoFuzzy;

@Repository
public class AvaliacaoFuzzyDao implements IAvaliacaoFuzzyDao{

	@PersistenceContext
	EntityManager manager;
	
	public void adiciona(AvaliacaoFuzzy avaliacaoFuzzy){
		manager.persist(avaliacaoFuzzy);
	}
	
	public AvaliacaoFuzzy buscaPorAvaliadorAvaliadoSinal(Long idAlunoAvaliador, Long idAlunoAvaliado, Long idSinal){
		Query query = manager.createQuery("select a "
				+ "from AvaliacaoFuzzy a"
				+ "where a.alunoAvaliador.idUsuario = :idAlunoAvaliador "
				+ "and a.alunoAvaliado.idUsuario = :idAlunoAvaliado "
				+ "and a.sinal.idSinal = :idSinal");
		query.setParameter("idAlunoAvaliador", idAlunoAvaliador);
		query.setParameter("idAlunoAvaliado", idAlunoAvaliado);
		query.setParameter("idSinal", idSinal);
		
		return (AvaliacaoFuzzy)query.getSingleResult();
	}
	
}
