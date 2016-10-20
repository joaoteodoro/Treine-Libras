package br.com.treinelibras.modelo;

public enum UtilizacaoDasMaos {
	SOMENTE_UMA_MAO("Utiliza somente uma m�o"),
	DUAS_MAOS_PARAMETROS_IGUAIS("Utiliza duas m�os com par�metros iguais"),
	DUAS_MAOS_PARAMETROS_DIFERENTES("Utiliza duas m�os com par�metros diferentes");
	
	private String descricao;
	
	UtilizacaoDasMaos(String descricao){
		this.descricao = descricao;
	}
	
	public String getDescricao(){
		return descricao;
	}
}
