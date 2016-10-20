package br.com.treinelibras.modelo;

public enum UtilizacaoDasMaos {
	SOMENTE_UMA_MAO("Utiliza somente uma mão"),
	DUAS_MAOS_PARAMETROS_IGUAIS("Utiliza duas mãos com parâmetros iguais"),
	DUAS_MAOS_PARAMETROS_DIFERENTES("Utiliza duas mãos com parâmetros diferentes");
	
	private String descricao;
	
	UtilizacaoDasMaos(String descricao){
		this.descricao = descricao;
	}
	
	public String getDescricao(){
		return descricao;
	}
}
