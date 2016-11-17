package br.com.treinelibras.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="AvaliacaoFuzzy")
public class AvaliacaoFuzzy {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@ManyToOne
	private Usuario alunoAvaliador;
	
	@ManyToOne
	private Usuario alunoAvaliado;
	
	private boolean jaAvaliou = false;
	private float notaFuzzy;
	private float pesoNoMomentoDaAvaliacao;
	
	@ManyToOne
	private MatrizAvaliacaoFuzzy matrizAvaliacaoFuzzy;
	
	public MatrizAvaliacaoFuzzy getMatrizAvaliacaoFuzzy() {
		return matrizAvaliacaoFuzzy;
	}
	public void setMatrizAvaliacaoFuzzy(MatrizAvaliacaoFuzzy matrizAvaliacaoFuzzy) {
		this.matrizAvaliacaoFuzzy = matrizAvaliacaoFuzzy;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Usuario getAlunoAvaliador() {
		return alunoAvaliador;
	}
	public void setAlunoAvaliador(Usuario alunoAvaliador) {
		this.alunoAvaliador = alunoAvaliador;
	}
	public Usuario getAlunoAvaliado() {
		return alunoAvaliado;
	}
	public void setAlunoAvaliado(Usuario alunoAvaliado) {
		this.alunoAvaliado = alunoAvaliado;
	}
	public boolean isJaAvaliou() {
		return jaAvaliou;
	}
	public void setJaAvaliou(boolean jaAvaliou) {
		this.jaAvaliou = jaAvaliou;
	}
	public float getNotaFuzzy() {
		return notaFuzzy;
	}
	public void setNotaFuzzy(float notaFuzzy) {
		this.notaFuzzy = notaFuzzy;
	}
	public float getPesoNoMomentoDaAvaliacao() {
		return pesoNoMomentoDaAvaliacao;
	}
	public void setPesoNoMomentoDaAvaliacao(float pesoNoMomentoDaAvaliacao) {
		this.pesoNoMomentoDaAvaliacao = pesoNoMomentoDaAvaliacao;
	}	
}
