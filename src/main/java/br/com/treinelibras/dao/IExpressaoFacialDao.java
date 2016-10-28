package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.ExpressaoFacial;
import br.com.treinelibras.modelo.Sinal;

public interface IExpressaoFacialDao {
	public List<ExpressaoFacial> lista();
	
	public ExpressaoFacial buscaPorId(Long idExpressaoFacial);
	
	public List<Sinal> buscaSinaisAssociados(Long idExpressaoFacial);
	
	public Long buscaUltimoId();
	
	public void adiciona(ExpressaoFacial expressaoFacial);
	
	public void altera(ExpressaoFacial expressaoFacial);
	
	public void remove(Long id);
}
