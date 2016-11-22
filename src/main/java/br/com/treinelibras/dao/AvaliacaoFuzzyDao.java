package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.AvaliacaoFuzzy;
import br.com.treinelibras.modelo.Usuario;

@Repository
public class AvaliacaoFuzzyDao implements IAvaliacaoFuzzyDao{

	@PersistenceContext
	EntityManager manager;
	
	public void adiciona(AvaliacaoFuzzy avaliacaoFuzzy){
		manager.persist(avaliacaoFuzzy);
	}
	
	public AvaliacaoFuzzy buscaPorAvaliadorAvaliadoSinal(Long idAlunoAvaliador, Long idAlunoAvaliado, Long idSinal){
		Query query = manager.createQuery("select a "
				+ "from AvaliacaoFuzzy a "
				+ "where a.alunoAvaliador.idUsuario = :idAlunoAvaliador "
				+ "and a.alunoAvaliado.idUsuario = :idAlunoAvaliado "
				+ "and a.sinal.idSinal = :idSinal");
		query.setParameter("idAlunoAvaliador", idAlunoAvaliador);
		query.setParameter("idAlunoAvaliado", idAlunoAvaliado);
		query.setParameter("idSinal", idSinal);
		
		return (AvaliacaoFuzzy)query.getSingleResult();
	}
	
	public void altera(AvaliacaoFuzzy avaliacaoFuzzy){
		manager.merge(avaliacaoFuzzy);
	}
	
	public int buscaQuantidadeAvaliacoesPorMatriz(Long idMatrizAvaliacao){
		Query query = manager.createQuery("select count(*) "
				+ "from AvaliacaoFuzzy a "
				+ "where a.matrizAvaliacaoFuzzy.id = :idMatrizAvaliacao ");
		query.setParameter("idMatrizAvaliacao", idMatrizAvaliacao);
		
		return (int)query.getSingleResult();
	}
	
	public int buscaQuantidadeAvaliacoesJaAvaliadasPorMatriz(Long idMatrizAvaliacao){
		Query query = manager.createQuery("select count(*) "
				+ "from AvaliacaoFuzzy a "
				+ "where a.matrizAvaliacaoFuzzy.id = :idMatrizAvaliacao "
				+ "and jaAvaliou = 1");
		query.setParameter("idMatrizAvaliacao", idMatrizAvaliacao);
		
		return (int)query.getSingleResult();
	}
	
	public List<Usuario> buscaAlunosAvaliadosPorMatrizAvaliacao(Long idMatrizAvaliacao){
		Query query = manager.createQuery("select distinct a.alunoAvaliado "
				+ "from AvaliacaoFuzzy a "
				+ "where a.matrizAvaliacaoFuzzy.id = :idMatrizAvaliacao");
		query.setParameter("idMatrizAvaliacao", idMatrizAvaliacao);
		
		return query.getResultList();
	}
	
}
