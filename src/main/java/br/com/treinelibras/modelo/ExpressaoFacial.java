package br.com.treinelibras.modelo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="ExpressaoFacial")
public class ExpressaoFacial {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idExpressaoFacial")
	private Long idExpressaoFacial;
	
	private String nome;
	private String imagem;
	
	@OneToMany(mappedBy="expressaoFacial")
	private List<Sinal> sinais;
	
	@Transient
	private transient boolean podeExcluir = true;

	public Long getIdExpressaoFacial() {
		return idExpressaoFacial;
	}

	public void setIdExpressaoFacial(Long idExpressaoFacial) {
		this.idExpressaoFacial = idExpressaoFacial;
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

	public List<Sinal> getSinais() {
		return sinais;
	}

	public void setSinais(List<Sinal> sinais) {
		this.sinais = sinais;
	}

	public boolean isPodeExcluir() {
		return podeExcluir;
	}

	public void setPodeExcluir(boolean podeExcluir) {
		this.podeExcluir = podeExcluir;
	}

}
