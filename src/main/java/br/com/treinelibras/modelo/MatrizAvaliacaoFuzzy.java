package br.com.treinelibras.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="MatrizAvaliacaoFuzzy")
public class MatrizAvaliacaoFuzzy {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	private int quantidadeAlunos;
	private boolean avaliacaoCompleta = false;
	
	@ManyToOne
	private Sinal sinal;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getQuantidadeAlunos() {
		return quantidadeAlunos;
	}
	public void setQuantidadeAlunos(int quantidadeAlunos) {
		this.quantidadeAlunos = quantidadeAlunos;
	}
	public boolean isAvaliacaoCompleta() {
		return avaliacaoCompleta;
	}
	public void setAvaliacaoCompleta(boolean avaliacaoCompleta) {
		this.avaliacaoCompleta = avaliacaoCompleta;
	}
	public Sinal getSinal() {
		return sinal;
	}
	public void setSinal(Sinal sinal) {
		this.sinal = sinal;
	}
}
