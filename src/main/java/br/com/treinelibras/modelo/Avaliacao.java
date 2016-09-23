package br.com.treinelibras.modelo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Avaliacao")
public class Avaliacao {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idAvaliacao")
	private Long idAvaliacao;

	private float notaConfiguracaoMao;
	private float notaPontoArticulacao;
	private float notaMovimento;
	private float notaOrientacao;
	private float notaExpressaoFacial;
	private Date data;
	private float notaMedia;
	
	private float notaFinal;

	@ManyToOne
	private Gravacao gravacao;

	@ManyToOne
	private Usuario usuario;

	public Long getIdAvaliacao() {
		return idAvaliacao;
	}

	public void setIdAvaliacao(Long idAvaliacao) {
		this.idAvaliacao = idAvaliacao;
	}

	public float getNotaConfiguracaoMao() {
		return notaConfiguracaoMao;
	}

	public void setNotaConfiguracaoMao(float notaConfiguracaoMao) {
		this.notaConfiguracaoMao = notaConfiguracaoMao;
	}

	public float getNotaPontoArticulacao() {
		return notaPontoArticulacao;
	}

	public void setNotaPontoArticulacao(float notaPontoArticulacao) {
		this.notaPontoArticulacao = notaPontoArticulacao;
	}

	public float getNotaMovimento() {
		return notaMovimento;
	}

	public void setNotaMovimento(float notaMovimento) {
		this.notaMovimento = notaMovimento;
	}

	public float getNotaOrientacao() {
		return notaOrientacao;
	}

	public void setNotaOrientacao(float notaOrientacao) {
		this.notaOrientacao = notaOrientacao;
	}

	public float getNotaExpressaoFacial() {
		return notaExpressaoFacial;
	}

	public void setNotaExpressaoFacial(float notaExpressaoFacial) {
		this.notaExpressaoFacial = notaExpressaoFacial;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public float getNotaMedia() {
		return notaMedia;
	}

	public void setNotaMedia(float notaMedia) {
		this.notaMedia = notaMedia;
	}

	public Gravacao getGravacao() {
		return gravacao;
	}

	public void setGravacao(Gravacao gravacao) {
		this.gravacao = gravacao;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public float getNotaFinal() {
		return notaFinal;
	}

	public void setNotaFinal(float notaFinal) {
		this.notaFinal = notaFinal;
	}

	@Override
	public String toString() {
		return "\n idAvaliacao: "+this.idAvaliacao +
				"\n notaConfiguracaoMao: "+this.notaConfiguracaoMao +
				"\n notaPontoArticulacao: "+this.notaPontoArticulacao +
				"\n notaMovimento: "+this.notaMovimento +
				"\n notaOrientacao"+this.notaOrientacao +
				"\n notaExpressaoFacial"+this.notaExpressaoFacial + 
				"\n data: "+this.data +
				"\n notaMedia: "+this.notaMedia;
	}
}
