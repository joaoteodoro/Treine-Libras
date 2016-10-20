package br.com.treinelibras.modelo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Mao")
public class Mao {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;

	@ManyToOne
	private ConfiguracaoDeMao configuracaoDeMao;
	
	@ManyToOne
	private PontoDeArticulacao pontoDeArticulacao;
	
	@ManyToOne
	private Movimento movimento;
	
	@Enumerated(EnumType.STRING)
	private Orientacao orientacao;

	@OneToMany(mappedBy="maoPrincipal")
	private List<Sinal> sinaisMaoPrincipal;
	
	@OneToMany(mappedBy="maoSecundaria")
	private List<Sinal> sinaisMaoSecundaria;
	
	public ConfiguracaoDeMao getConfiguracaoDeMao() {
		return configuracaoDeMao;
	}

	public void setConfiguracaoDeMao(ConfiguracaoDeMao configuracaoDeMao) {
		this.configuracaoDeMao = configuracaoDeMao;
	}

	public PontoDeArticulacao getPontoDeArticulacao() {
		return pontoDeArticulacao;
	}

	public void setPontoDeArticulacao(PontoDeArticulacao pontoDeArticulacao) {
		this.pontoDeArticulacao = pontoDeArticulacao;
	}

	public Movimento getMovimento() {
		return movimento;
	}

	public void setMovimento(Movimento movimento) {
		this.movimento = movimento;
	}

	public Orientacao getOrientacao() {
		return orientacao;
	}

	public void setOrientacao(Orientacao orientacao) {
		this.orientacao = orientacao;
	}

	public List<Sinal> getSinaisMaoPrincipal() {
		return sinaisMaoPrincipal;
	}

	public void setSinaisMaoPrincipal(List<Sinal> sinaisMaoPrincipal) {
		this.sinaisMaoPrincipal = sinaisMaoPrincipal;
	}

	public List<Sinal> getSinaisMaoSecundaria() {
		return sinaisMaoSecundaria;
	}

	public void setSinaisMaoSecundaria(List<Sinal> sinaisMaoSecundaria) {
		this.sinaisMaoSecundaria = sinaisMaoSecundaria;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
}
