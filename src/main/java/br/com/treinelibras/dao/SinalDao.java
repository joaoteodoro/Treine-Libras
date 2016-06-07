package br.com.treinelibras.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.ExpressaoFacial;
import br.com.treinelibras.modelo.PontoDeArticulacao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

@Repository
public class SinalDao implements ISinalDao {
	
	@PersistenceContext
	EntityManager manager;

	public Sinal buscaPorId(Long id) {
		return manager.find(Sinal.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Sinal> lista() {
		return manager.createQuery("select s from Sinal s").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<String> listaCategorias() {
		return manager.createQuery("select distinct s.categoria from Sinal s").getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Sinal> listaSinalPorCategoria(String categoria){
		Query query = manager.createQuery("select s from Sinal s where s.categoria = :paramCategoria");
		query.setParameter("paramCategoria", categoria);
		
		return query.getResultList();
	}
	
	public float notaSinalPorUsuario(Long idUsuario, Long idSinal){
		System.out.println("Query notaSinalPorUsuario");
		System.out.println("$$idUsuario: "+idUsuario);
		System.out.println("$$idSinal: "+idSinal);
		
		Query query = manager.createQuery("select avg(a.notaMedia) "
										+ "from Sinal s "
											+ " join s.gravacoes g	"
											+ " join g.usuario u "
											+ " join g.avaliacoes a "
										+ "where s.idSinal = :paramSinal "
											+ "and u.idUsuario = :paramUsuario");
		query.setParameter("paramSinal", idSinal);
		query.setParameter("paramUsuario", idUsuario);
		System.out.println("depois dos parametros: ");
		Object o = query.getSingleResult();
		Float media = Float.parseFloat(o.toString());
		return media;
	}

	public List<Sinal> listaSinaisMelhoresAvaliacoes(Usuario u) {
		System.out.println("%%% SinaDao > listaSinaisMelhoresAvaliacoes > idUsuario: "+u.getIdUsuario());
		Query query = manager.createQuery("select avg(a.notaMedia), s "
								+ "from Sinal s "
								+ "join s.gravacoes g "
								+ "join g.usuario u "
								+ "join g.avaliacoes a "
								+ "where u.idUsuario = :paramUsuario "
								+ "group by s.idSinal "
								+ "order by 1 desc ");
		query.setParameter("paramUsuario", u.getIdUsuario());
		
		List<Sinal> sinais = new ArrayList<>();
		
		List<Object> objetos = (List<Object>)query.getResultList();
		for (Object object : objetos) {
			Object[] o = (Object[]) object;
			Sinal sinal = (Sinal) o[1];
			
			sinais.add(sinal);	
		}
		
		return sinais;
	}

	public List<Sinal> listaSinaisPioresAvaliacoes(Usuario u) {
		Query query = manager.createQuery("select avg(a.notaMedia), s "
				+ "from Sinal s "
				+ "join s.gravacoes g "
				+ "join g.usuario u "
				+ "join g.avaliacoes a "
				+ "where u.idUsuario = :paramUsuario "
				+ "group by s.idSinal "
				+ "order by 1");
		query.setParameter("paramUsuario", u.getIdUsuario());
		
		List<Sinal> sinais = new ArrayList<>();
		
		List<Object> objetos = (List<Object>)query.getResultList();
		for (Object object : objetos) {
			Object[] o = (Object[]) object;
			Sinal sinal = (Sinal) o[1];
			
			sinais.add(sinal);	
		}
		
		return sinais;
	}

}
