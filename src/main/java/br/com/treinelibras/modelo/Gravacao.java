package br.com.treinelibras.modelo;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Gravacao")
public class Gravacao {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idGravacao")
	private Long idGravacao;
	
	private String video;
	private Date data;
	
	@ManyToOne
	private Usuario usuario;
	
	@ManyToOne
	private Sinal sinal;
	
	@OneToMany(mappedBy="gravacao", cascade = CascadeType.REMOVE)
	private List<Avaliacao> avaliacoes;
	
	public List<Avaliacao> getAvaliacoes() {
		return avaliacoes;
	}
	public void setAvaliacoes(List<Avaliacao> avaliacoes) {
		this.avaliacoes = avaliacoes;
	}
	public Long getIdGravacao() {
		return idGravacao;
	}
	public void setIdGravacao(Long idGravacao) {
		this.idGravacao = idGravacao;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Sinal getSinal() {
		return sinal;
	}
	public void setSinal(Sinal sinal) {
		this.sinal = sinal;
	}
}
