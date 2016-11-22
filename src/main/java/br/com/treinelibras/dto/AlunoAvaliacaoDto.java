package br.com.treinelibras.dto;

import br.com.treinelibras.modelo.Usuario;

public class AlunoAvaliacaoDto implements Comparable<AlunoAvaliacaoDto> {
	
	private Usuario aluno;
	private float nota;
	
	public Usuario getAluno() {
		return aluno;
	}

	public void setAluno(Usuario aluno) {
		this.aluno = aluno;
	}

	public float getNota() {
		return nota;
	}

	public void setNota(float nota) {
		this.nota = nota;
	}

	@Override
	public int compareTo(AlunoAvaliacaoDto outro) {
		if(this.nota < outro.nota){
			return -1;
		}else if(this.nota > outro.nota){
			return 1;
		}
		return 0;
	}

}
