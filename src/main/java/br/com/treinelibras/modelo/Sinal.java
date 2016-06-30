package br.com.treinelibras.modelo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Sinal")
public class Sinal {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idSinal")
	private Long idSinal;
	
	private String nome;
	private String foto;
	private String categoria;
	private String dificuldade;
	private String video;
	private String orientacao;

	@OneToMany(mappedBy="sinal", cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Gravacao> gravacoes;
	
	@ManyToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinTable(name="pontodearticulacao_sinal",
		joinColumns= @JoinColumn(name="sinais_idSinal"),
		inverseJoinColumns = @JoinColumn(name="pontosDeArticulacao_idPontoDeArticulacao"))
	private List<PontoDeArticulacao> pontosDeArticulacao;
	
	@ManyToOne
	private ExpressaoFacial expressaoFacial;

	@ManyToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinTable(name="configuracaodemao_sinal",
			joinColumns= @JoinColumn(name="sinais_idSinal"),
			inverseJoinColumns = @JoinColumn(name="configuracoesDeMao_idConfiguracaoDeMao"))
	private List<ConfiguracaoDeMao> configuracoesDeMao;
	
	@ManyToMany(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinTable(name="movimento_sinal",
		joinColumns= @JoinColumn(name="sinais_idSinal"),
		inverseJoinColumns = @JoinColumn(name="movimentos_idMovimento"))
	private List<Movimento> movimentos;
	
	public List<Gravacao> getGravacoes() {
		return gravacoes;
	}

	public void setGravacoes(List<Gravacao> gravacoes) {
		this.gravacoes = gravacoes;
	}

	public ExpressaoFacial getExpressaoFacial() {
		return expressaoFacial;
	}

	public void setExpressaoFacial(ExpressaoFacial expressaoFacial) {
		this.expressaoFacial = expressaoFacial;
	}	
	
	public List<Movimento> getMovimentos() {
		return movimentos;
	}

	public void setMovimentos(List<Movimento> movimentos) {
		this.movimentos = movimentos;
	}

	public List<ConfiguracaoDeMao> getConfiguracoesDeMao() {
		return configuracoesDeMao;
	}

	public void setConfiguracoesDeMao(List<ConfiguracaoDeMao> configuracoesDeMao) {
		this.configuracoesDeMao = configuracoesDeMao;
	}

	public Long getIdSinal() {
		return idSinal;
	}

	public void setIdSinal(Long idSinal) {
		this.idSinal = idSinal;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getDificuldade() {
		return dificuldade;
	}

	public void setDificuldade(String dificuldade) {
		this.dificuldade = dificuldade;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getOrientacao() {
		return orientacao;
	}

	public void setOrientacao(String orientacao) {
		this.orientacao = orientacao;
	}
	
	public List<PontoDeArticulacao> getPontosDeArticulacao() {
		return pontosDeArticulacao;
	}

	public void setPontosDeArticulacao(List<PontoDeArticulacao> pontosDeArticulacao) {
		this.pontosDeArticulacao = pontosDeArticulacao;
	}

	@Override
	public String toString() {
		return "\n idSinal: "+this.idSinal +
				"\n nome: "+this.nome +
				"\n foto: "+this.foto +
				"\n categoria: "+this.categoria +
				"\n dificuldade"+this.dificuldade +
				"\n video"+this.video + 
				"\n orientacao: "+this.orientacao /*+
				"\n pontoDeArticulacao: "+this.pontoDeArticulacao.getNome() +
				"\n expressaoFacial: "+this.expressaoFacial.getNome() +
				"\n configuracoesDeMao size: "+this.configuracoesDeMao.size() +
				"\n movimentos size: "+this.movimentos.size()*/;
	}

}
