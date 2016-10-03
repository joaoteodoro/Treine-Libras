package br.com.treinelibras.modelo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Unidade")
public class Unidade {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String nome;
	private Long numero;
	private boolean unidadeAtual = false;
	
	@OneToMany(mappedBy="unidade", cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Sinal> sinais;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Long getNumero() {
		return numero;
	}

	public void setNumero(Long numero) {
		this.numero = numero;
	}

	public List<Sinal> getSinais() {
		return sinais;
	}

	public void setSinais(List<Sinal> sinais) {
		this.sinais = sinais;
	}

	public boolean isUnidadeAtual() {
		return unidadeAtual;
	}

	public void setUnidadeAtual(boolean unidadeAtual) {
		this.unidadeAtual = unidadeAtual;
	}	
}
