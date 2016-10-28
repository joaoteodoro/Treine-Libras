package br.com.treinelibras.modelo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="Movimento")
public class Movimento {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idMovimento")
	private Long idMovimento;
	
	private String nome;
	private String imagem;
	
	@Transient
	private transient boolean podeExcluir = true;
	
	/*@ManyToMany
	private List<Sinal> sinais;
	
	public List<Sinal> getSinais() {
		return sinais;
	}
	public void setSinais(List<Sinal> sinais) {
		this.sinais = sinais;
	}*/
	public Long getIdMovimento() {
		return idMovimento;
	}
	public void setIdMovimento(Long idMovimento) {
		this.idMovimento = idMovimento;
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

	public boolean isPodeExcluir() {
		return podeExcluir;
	}
	public void setPodeExcluir(boolean podeExcluir) {
		this.podeExcluir = podeExcluir;
	}
	@Override
	public String toString() {
		StringBuilder movimento = new StringBuilder();
		movimento.append("\n idMovimento: "+this.idMovimento);
		movimento.append("\n nome: "+this.nome);
		movimento.append("\n imagem: "+this.imagem);
		
		return movimento.toString();
	}

}
