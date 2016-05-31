package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.Gravacao;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

public interface IGravacaoDao {
	public List<Gravacao> litaGravacoesPorSinal(Sinal s);
	
	public Gravacao gravacaoPorUsuarioSinal(Long idUsuario, Long idSinal);
	
	public List<Gravacao> gravacoesPorSinalSemUsuarioLogado(Long idSinal, Long idUsuario);
	
	public Gravacao buscaPorId(Long id);
	
	public void adiciona(Gravacao gravacao);
	
	public String videoPorSinalUsuario(Long idSinal, Long idUsuario);
}
