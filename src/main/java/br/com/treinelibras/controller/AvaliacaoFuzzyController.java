package br.com.treinelibras.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import br.com.treinelibras.dao.IAvaliacaoFuzzyDao;
import br.com.treinelibras.dao.IMatrizAvaliacaoDao;
import br.com.treinelibras.dao.IUsuarioDao;
import br.com.treinelibras.modelo.AvaliacaoFuzzy;
import br.com.treinelibras.modelo.MatrizAvaliacaoFuzzy;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;

@Transactional
@Controller
public class AvaliacaoFuzzyController {

	@Autowired
	protected ServletContext servletContext;

	@Autowired
	IAvaliacaoFuzzyDao avaliacaoFuzzyDao;
	
	@Autowired
	IUsuarioDao usuarioDao;
	
	@Autowired
	IMatrizAvaliacaoDao matrizAvaliacaoDao;
	
	@SuppressWarnings("unchecked")
	public void definirAvaliacoes(Sinal sinal){
		MatrizAvaliacaoFuzzy matrizAvaliacaoFuzzy = new MatrizAvaliacaoFuzzy();
		List<AvaliacaoFuzzy> avaliacoesFuzzy = new ArrayList<>();
		List<Usuario> alunos = usuarioDao.buscaPorPerfil("aluno");
		Collections.shuffle(alunos);
		alunos = alunos.size() >= 30 ? alunos.subList(0, 30) : alunos;
		matrizAvaliacaoFuzzy.setAvaliacaoCompleta(false);
		matrizAvaliacaoFuzzy.setQuantidadeAlunos(alunos.size());
		matrizAvaliacaoFuzzy.setSinal(sinal);
		
		matrizAvaliacaoDao.adiciona(matrizAvaliacaoFuzzy);
		
		int n = alunos.size()+1;
		int m = Double.valueOf(Math.floor(n/2)).intValue();
		
		int[][] matriz = new int[n][n];
		
		for (int i = 1; i < n; i++) {
			for (int j = 1; j < m; j++) {
				matriz[((i+j-1)%(n-1))+1][i] = 1;
			}
		}
		
		for (int i = 1; i < matriz.length; i++) {
			for (int j = 1; j < matriz.length; j++) {
				if(matriz[i][j] == 1){
					AvaliacaoFuzzy avaliacaoFuzzy = new AvaliacaoFuzzy();
					avaliacaoFuzzy.setAlunoAvaliador(alunos.get(i-1));
					avaliacaoFuzzy.setAlunoAvaliado(alunos.get(j-1));
					avaliacaoFuzzy.setJaAvaliou(false);
					avaliacaoFuzzy.setNotaFuzzy(0);
					avaliacaoFuzzy.setMatrizAvaliacaoFuzzy(matrizAvaliacaoFuzzy);
					avaliacoesFuzzy.add(avaliacaoFuzzy);
				}				
			}
		}
		
		for (AvaliacaoFuzzy avaliacao : avaliacoesFuzzy) {
			avaliacaoFuzzyDao.adiciona(avaliacao);
		}
	}
}