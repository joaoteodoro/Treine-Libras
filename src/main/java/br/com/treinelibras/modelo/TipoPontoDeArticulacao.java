package br.com.treinelibras.modelo;

public enum TipoPontoDeArticulacao {
	TOCAR_NO_CORPO("Tocar no corpo"),
	ESPACO_NEUTRO("Espaço neutro");
	
	private String descricao;
	
	TipoPontoDeArticulacao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao(){
		return descricao;
	}

}
