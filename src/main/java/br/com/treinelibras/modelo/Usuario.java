package br.com.treinelibras.modelo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "Usuario")
public class Usuario {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idUsuario")
	private Long idUsuario;

	private String nome;
	private String email;
	private String usuario;
	private String senha;
	private String perfil;
	
	@Column(name = "primeiroAcesso", columnDefinition="boolean default true")
	private boolean primeiroAcesso;
	
	private float pesoAvaliacao = 1;
	
	public boolean isPrimeiroAcesso() {
		return primeiroAcesso;
	}

	public void setPrimeiroAcesso(boolean primeiroAcesso) {
		this.primeiroAcesso = primeiroAcesso;
	}

	@OneToMany(mappedBy = "usuario")
	private List<Avaliacao> avaliacoes;

	@OneToMany(mappedBy = "usuario")
	private List<Gravacao> gravacoes;
	

	public float getPesoAvaliacao() {
		return pesoAvaliacao;
	}

	public void setPesoAvaliacao(float pesoAvaliacao) {
		this.pesoAvaliacao = pesoAvaliacao;
	}

	public List<Gravacao> getGravacoes() {
		return gravacoes;
	}

	public void setGravacoes(List<Gravacao> gravacoes) {
		this.gravacoes = gravacoes;
	}

	public List<Avaliacao> getAvaliacoes() {
		return avaliacoes;
	}

	public void setAvaliacoes(List<Avaliacao> avaliacoes) {
		this.avaliacoes = avaliacoes;
	}

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

}
