package br.com.treinelibras.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

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

	public void remove(Usuario usuario) {
		Usuario u = buscaPorId(usuario.getIdUsuario());
	}

	public boolean existeUsuario(Usuario usuario) {
		Query query = manager.createQuery("select u from Usuario u where u.usuario = :paramLogin and u.senha = :paramSenha");
		query.setParameter("paramLogin", usuario.getUsuario());
		query.setParameter("paramSenha", usuario.getSenha());
		
		Usuario u = (Usuario)query.getSingleResult();
		if(u == null){
			return false;
		}
		return true;
	}
	
	public Usuario buscarPorUsuario(String usuario) {
		Query query = manager.createQuery("select u from Usuario u where u.usuario = :paramUsuario");
		query.setParameter("paramUsuario", usuario);
		return (Usuario)query.getSingleResult();
	}

}
