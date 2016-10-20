package br.com.treinelibras.modelo;

public enum Orientacao {
	PARA_CIMA("Para cima"), 
	PARA_BAIXO("Para baixo"), 
	PARA_DENTRO("Para dentro"), 
	PARA_FORA("Para fora"), 
	PARA_LADO_ESQERDO("Para o lado esquerdo"), 
	PARA_LADO_DIREITO("Para o lado direito");
	
	private String descricao;
	
//	private Orientacao(String descricao){
//		this.descricao = descricao;
//	}
	
	Orientacao(String descricao){
		this.descricao = descricao;
	}
	
	public String getDescricao(){
		return descricao;
	}
}
