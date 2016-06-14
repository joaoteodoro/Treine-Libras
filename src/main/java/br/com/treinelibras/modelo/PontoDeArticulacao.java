package br.com.treinelibras.modelo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PontodeArticulacao")
public class PontoDeArticulacao {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idPontoDeArticulacao")
	private Long idPontoDeArticulacao;
	
	private String nome;
	private String imagem;
	
	@ManyToMany
	private List<Sinal> sinais;
	
	public List<Sinal> getSinais() {
		return sinais;
	}
	public void setSinais(List<Sinal> sinais) {
		this.sinais = sinais;
	}
	public Long getIdPontoDeArticulacao() {
		return idPontoDeArticulacao;
	}
	public void setIdPontoDeArticulacao(Long idPontoDeArticulacao) {
		this.idPontoDeArticulacao = idPontoDeArticulacao;
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
	
}