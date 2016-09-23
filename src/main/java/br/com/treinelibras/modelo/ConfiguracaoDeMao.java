package br.com.treinelibras.modelo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="ConfiguracaoDeMao")
public class ConfiguracaoDeMao {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idConfiguracaoDeMao")
	private Long idConfiguracaoDeMao;
	private String nome;
	private String imagem;
	
	/*@ManyToMany(fetch = FetchType.EAGER)
	private List<Sinal> sinais;
	
	public List<Sinal> getSinais() {
		return sinais;
	}
	public void setSinais(List<Sinal> sinais) {
		this.sinais = sinais;
	}*/
	public Long getIdConfiguracaoDeMao() {
		return idConfiguracaoDeMao;
	}
	public void setIdConfiguracaoDeMao(Long idConfiguracaoDeMao) {
		this.idConfiguracaoDeMao = idConfiguracaoDeMao;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getImagem() {
		return imagem;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}
	
	@Override
	public String toString() {
		StringBuilder configuracaoDeMao = new StringBuilder();
		configuracaoDeMao.append("\n idConfiguracaoDeMao: "+this.idConfiguracaoDeMao);
		configuracaoDeMao.append("\n nome: "+this.nome);
		configuracaoDeMao.append("\n imagem: "+this.imagem);
		
		return configuracaoDeMao.toString();
	}
	
}
