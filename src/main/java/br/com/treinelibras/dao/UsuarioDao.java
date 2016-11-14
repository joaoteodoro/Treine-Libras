package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

@Repository
public class UsuarioDao implements IUsuarioDao {

	@PersistenceContext
	EntityManager manager;
	
	public Usuario buscaPorId(Long id) {
		return manager.find(Usuario.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Usuario> lista() {
		return manager.createQuery("select u from Usuario u").getResultList();
	}

	public void adiciona(Usuario u) {
		manager.persist(u);
	}

	public void altera(Usuario u) {
		manager.merge(u);
	}

	public void remove(Long id) {
		Usuario usuario = manager.find(Usuario.class, id);
		manager.remove(usuario);
	}

	public boolean existeUsuario(Usuario usuario) {
		Query query = manager.createQuery("select u from Usuario u where u.usuario = :paramLogin and u.senha = :paramSenha");
		query.setParameter("paramLogin", usuario.getUsuario());
		query.setParameter("paramSenha", usuario.getSenha());
		
		if(query.getResultList().isEmpty()){
			return false;
		}else{
			return true;
		}
		/*
		Usuario u = (Usuario)query.getSingleResult();
		if(u == null){
			return false;
		}
		return true;*/
	}
	
	public Usuario buscarPorUsuario(String usuario) {
		Query query = manager.createQuery("select u from Usuario u where u.usuario = :paramUsuario");
		query.setParameter("paramUsuario", usuario);
		return (Usuario)query.getSingleResult();
	}
	
	public void restaPrimeiroAcesso(){
		List<Usuario> usuarios = lista();
		for (Usuario usuario : usuarios) {
			if(!usuario.getPerfil().equals("admin")){
				usuario.setPrimeiroAcesso(true);
				usuario.setPesoAvaliacao(1L);
			}
			altera(usuario);
		}
//		Query query = manager.createQuery("update Usuario set primeiroAcesso = 1 where perfil <> 'admin' ");
//		query.executeUpdate();
	}
	
	public List buscaAlunos(){
		Query query = manager.createQuery("select u from Usuario u where u.perfil = 'aluno'");
		return (List<Usuario>)query.getResultList(); 
	}

}
