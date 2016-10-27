package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.ConfiguracaoDeMao;
import br.com.treinelibras.modelo.Mao;
import br.com.treinelibras.modelo.Sinal;

public interface IConfiguracaoDeMaoDao {
	public List<ConfiguracaoDeMao> lista();
	
	public ConfiguracaoDeMao buscaPorId(Long id);
	
	public Long buscaUltimoId();
	
	public void adiciona(ConfiguracaoDeMao configuracaoDeMao);
	
	public void altera(ConfiguracaoDeMao configuracaoDeMao);
	
	public void remove(Long id);
	
	public List<Mao> buscaMaosAssociadas(Long idConfiguracaoDeMao);	
}
