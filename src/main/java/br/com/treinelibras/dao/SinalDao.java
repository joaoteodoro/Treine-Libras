package br.com.treinelibras.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.swing.plaf.synth.SynthSeparatorUI;

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
		
		Query query = manager.createQuery("select avg(a.notaFinal) "
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
		
		Float media;
		if(o != null){
			media = Float.parseFloat(o.toString());
		}else{
			media = 0f;
		}
		 
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
	
	public void adiciona(Sinal sinal){
		manager.persist(sinal);
	}
	
	@Override
	public void remove(Long idSinal) {
		System.out.println("SinalDao.remove.idSinal: "+idSinal);
		Sinal sinal = manager.find(Sinal.class, idSinal);
		System.out.println("SinalDao.sinal.nome: "+sinal.getNome());
		manager.remove(sinal);
		System.out.println("Removeu!");
	}
	
	@Override
	public Sinal buscaPorNome(String nomeSinal) {
		Query query = manager.createQuery("select s from Sinal s where s.nome = :paramNome");
		query.setParameter("paramNome", nomeSinal);
		
		return (Sinal)query.getSingleResult();
	}
	
	@Override
	public void altera(Sinal sinal) {
		manager.merge(sinal);
	}
	
	@SuppressWarnings("unchecked")
	public List<Sinal> buscaSinalQueDefinePesoInicial(){
		Query query = manager.createQuery("select s from Sinal s where s.sinalDefinePesoInicial = 1 and"
				+ " s.unidade.unidadeAtual = 1");
		query.setMaxResults(5);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Sinal> buscaSinaisPorUnidade(Long unidade){
		Query quey = manager.createQuery("select s from Sinal s where s.unidade = :paramUnidade");
		quey.setParameter("paramUnidade", unidade);
		return quey.getResultList();
	}
	

	@SuppressWarnings("unchecked")
	public List<Sinal> buscaSinaisUnidadeAtual(){
		Query query = manager.createQuery("select s from Sinal s where s.unidade.unidadeAtual = 1");
		return query.getResultList();
	}
}