package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.Usuario;

public interface IUsuarioDao {
	Usuario buscaPorId(Long id);
	
	List<Usuario> lista();
	
	void adiciona(Usuario u);
	
	void altera(Usuario u);
	
	void remove(Usuario u);
	
	boolean existeUsuario(Usuario u);
	
	public Usuario buscarPorUsuario(String usuario);
}