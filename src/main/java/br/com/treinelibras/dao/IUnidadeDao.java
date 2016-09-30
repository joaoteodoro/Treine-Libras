package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.Unidade;

public interface IUnidadeDao {
	public Unidade buscaPorId(Long id);
	
	public List<Unidade> lista();
}
