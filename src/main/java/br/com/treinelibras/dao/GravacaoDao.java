package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.Gravacao;
import br.com.treinelibras.modelo.Sinal;

@Repository
public class GravacaoDao implements IGravacaoDao {
	
	@PersistenceContext
	EntityManager manager;
	
	public void adiciona(Gravacao gravacao){
		System.out.println("Gravacao:");
		System.out.println("Nome sinal: "+gravacao.getSinal().getNome());
		System.out.println("Video: "+gravacao.getVideo());
		System.out.println("Nome usuario: "+gravacao.getUsuario().getNome());
		manager.persist(gravacao);
	}

	public List<Gravacao> litaGravacoesPorSinal(Sinal s) {
		return null;
	}

	public Gravacao gravacaoPorUsuarioSinal(Long idUsuario, Long idSinal) {
		Query query = manager.createQuery("select "
										+ "g from Gravacao g "
										+ "join g.sinal s "
										+ "join g.usuario u "
										+ "where u.idUsuario = :paramUsuario "
										+ "and s.idSinal = :paramSinal");
		query.setParameter("paramUsuario", idUsuario);
		query.setParameter("paramSinal", idSinal);
		
		Gravacao gravacao;
		try {
			gravacao = (Gravacao) query.getSingleResult();
			return gravacao;
		} catch (Exception e) {
			gravacao = null;
			return gravacao;
		}
	}

	public Gravacao buscaPorId(Long id) {
		return manager.find(Gravacao.class, id);
	}

	public String videoPorSinalUsuario(Long idSinal, Long idUsuario) {
		Query query = manager.createQuery("select g.video "
										+ "from Gravacao g "
											+ " join g.sinal s "
											+ " join g.usuario u "
											+ "where u.idUsuario = :paramUsuario "
											+ "and s.idSinal = :paramSinal");
		
		query.setParameter("paramUsuario", idUsuario);
		query.setParameter("paramSinal", idSinal);
		System.out.println("paramUsuario: "+idUsuario);
		System.out.println("paramSinal: "+idSinal);
		
		String nomeVideo = (String) query.getSingleResult();
		System.out.println("nomeVideo: "+nomeVideo);
		
		return nomeVideo;
	}
	
	public List<Gravacao> gravacoesPorSinalSemUsuarioLogado(Long idSinal, Long idUsuario) {
		Query query = manager.createQuery("select g "
										+ "from Gravacao g "
											+ "join g.sinal s "
											+ "join g.usuario u "
											+ "where s.idSinal = :paramSinal "
											+ "and u.idUsuario <> :paramUsuario");
		query.setParameter("paramSinal", idSinal);
		query.setParameter("paramUsuario", idUsuario);
		
		return query.getResultList();
	}
	
//	select *
//	from gravacao g,
//	usuario u,
//	sinal s,
//	matrizAvaliacaoFuzzy m,
//	avaliacaoFuzzy av	
//	where g.sinal_idSinal = s.idSinal
//	and g.usuario_idUsuario = u.idUsuario
//	and m.id = av.matrizAvaliacaoFuzzy_id
//	and av.alunoAvaliador_idUsuario = 2
//	and av.alunoAvaliado_idUsuario = u.idUsuario

}
