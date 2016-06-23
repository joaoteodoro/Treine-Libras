package br.com.treinelibras.dao;

import java.util.List;

import br.com.treinelibras.modelo.ExpressaoFacial;

public interface IExpressaoFacialDao {
	public List<ExpressaoFacial> lista();
	
	public ExpressaoFacial buscaPorId(Long idExpressaoFacial);
}
