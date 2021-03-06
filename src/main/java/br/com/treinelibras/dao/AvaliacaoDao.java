package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.Avaliacao;

@Repository
public class AvaliacaoDao implements IAvaliacaoDao{

	@PersistenceContext
	EntityManager manager;
	
	public void adicionaAvaliacao(Avaliacao avaliacao) {
		manager.persist(avaliacao);
	}

	@Override
	public Avaliacao existeAvaliacaoGravada(Long idUsuario, Long idGravacao) {
		Query query = manager.createQuery("select a "
										+ "from Avaliacao a "
										+ "join a.gravacao g "
										+ "join a.usuario u "
										+ "where u.idUsuario = :paramUsuario "
										+ "and g.idGravacao = :paramGravacao");
		query.setParameter("paramUsuario", idUsuario);
		query.setParameter("paramGravacao", idGravacao);
		
		if(query.getResultList().isEmpty()){
			return null;
		}else{
			return (Avaliacao)query.getSingleResult();
		}
		
		/*Avaliacao avaliacao = 
		if(avaliacao != null){
			return avaliacao;
		}else{
			return null;
		}*/
	}
	
	@Override
	public void alteraAvaliacao(Avaliacao avaliacao) {
		manager.merge(avaliacao);
	}
	
	@Override
	public void apagaAvaliacoes(Long idGravacao) {
		System.out.println("���������������������������������������������ntrou no apagaAvaliacoes");
		System.out.println("��������������������������������������������idGravacao: "+idGravacao);
		Query query = manager.createQuery("delete from Avaliacao where gravacao.idGravacao = :paramGravacao");
		query.setParameter("paramGravacao", idGravacao);
		query.executeUpdate();
	}
	
	public int buscaQuantidadeAvaliacoesPorGravacao(Long idGravacao){
		Query query = manager.createQuery("select count(*) from Avaliacao a where a.gravacao.idGravacao = :paramGravacao");
		query.setParameter("paramGravacao", idGravacao);
		
		return query.getFirstResult();
	}
	
	public List<Avaliacao> buscaAvaliacoesPorAlunoSinal(Long idAlunoAvaliado, Long idSinal){
		Query query = manager.createQuery("select a "
				+ "from Avaliacao a"
				+ "where a.gravacao.usuario.idUsuario = :idAlunoAvaliado "
				+ "and a.gravacao.sinal.idSinal = :idSinal");
		query.setParameter("idAlunoAvaliado", idAlunoAvaliado);
		query.setParameter("idSinal", idSinal);
		
		return query.getResultList();
	}
}
