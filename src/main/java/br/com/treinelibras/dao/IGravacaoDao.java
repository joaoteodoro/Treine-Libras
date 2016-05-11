package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.Gravacao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

public interface IGravacaoDao {
	List<Gravacao> litaGravacoesPorSinal(Sinal s);
	
	Gravacao gravacaoPorUsuarioSinal(Usuario u, Sinal s);
	
	Gravacao buscaPorId(Long id);
}
