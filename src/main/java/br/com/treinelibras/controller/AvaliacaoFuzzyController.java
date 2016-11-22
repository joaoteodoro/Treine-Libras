package br.com.treinelibras.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import br.com.treinelibras.dao.IAvaliacaoDao;
import br.com.treinelibras.dao.IAvaliacaoFuzzyDao;
import br.com.treinelibras.dao.IMatrizAvaliacaoDao;
import br.com.treinelibras.dao.IUsuarioDao;
import br.com.treinelibras.dto.AlunoAvaliacaoDto;
import br.com.treinelibras.modelo.Avaliacao;
import br.com.treinelibras.modelo.AvaliacaoFuzzy;
import br.com.treinelibras.modelo.MatrizAvaliacaoFuzzy;
import br.com.treinelibras.modelo.Sinal;
import br.com.treinelibras.modelo.Usuario;
import br.com.treinelibras.util.NumberUtils;

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
	
	@Autowired
	IAvaliacaoDao avaliacaoDao;
	
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
					//avaliacaoFuzzy.setNotaFuzzy(0);
					avaliacaoFuzzy.setMatrizAvaliacaoFuzzy(matrizAvaliacaoFuzzy);
					avaliacoesFuzzy.add(avaliacaoFuzzy);
				}				
			}
		}
		
		for (AvaliacaoFuzzy avaliacao : avaliacoesFuzzy) {
			avaliacaoFuzzyDao.adiciona(avaliacao);
		}
	}
	
	
	public void atualizarMatrizAvaliacaoSinal(Avaliacao avaliacao){
		Usuario alunoAvaliador = avaliacao.getUsuario();
		Usuario alunoAvaliado = avaliacao.getGravacao().getUsuario();
		Sinal sinal = avaliacao.getGravacao().getSinal();
		AvaliacaoFuzzy avaliacaoFuzzy =  avaliacaoFuzzyDao.buscaPorAvaliadorAvaliadoSinal(alunoAvaliador.getIdUsuario(),alunoAvaliado.getIdUsuario(),sinal.getIdSinal());
		//avaliacaoFuzzy.setNotaFuzzy(avaliacao.getNotaMedia() * alunoAvaliador.getPesoAvaliacao());
		//avaliacaoFuzzy.setPesoNoMomentoDaAvaliacao(alunoAvaliador.getPesoAvaliacao());
		avaliacaoFuzzy.setJaAvaliou(true);
		avaliacaoFuzzy.setAvaliacao(avaliacao);
		avaliacaoFuzzyDao.altera(avaliacaoFuzzy);
		
		MatrizAvaliacaoFuzzy matrizAvaliacaoFuzzy = avaliacaoFuzzy.getMatrizAvaliacaoFuzzy();
		
		int qtdAvaliacoesMatriz = avaliacaoFuzzyDao.buscaQuantidadeAvaliacoesPorMatriz(avaliacaoFuzzy.getMatrizAvaliacaoFuzzy().getId());
		int qtdAvaliacoesMatrizJaAvaliadas = avaliacaoFuzzyDao.buscaQuantidadeAvaliacoesJaAvaliadasPorMatriz(avaliacaoFuzzy.getMatrizAvaliacaoFuzzy().getId());
		
		if(qtdAvaliacoesMatriz == qtdAvaliacoesMatrizJaAvaliadas){
			matrizAvaliacaoFuzzy.setAvaliacaoCompleta(true);
			matrizAvaliacaoDao.altera(matrizAvaliacaoFuzzy);
			executarAvaliacaoPorParesOrdinal(matrizAvaliacaoFuzzy);
		}
		
		
		
		//buscar objeto avaliacaoFuzzy relacionado a esta avaliacao
		//atualizar nota com base no campo notaMedia do objeto avaliacao
		//verificar se a matriz ja foi completada. Se sim, executar o algoritmo final
		
	}
	
	public void executarAvaliacaoPorParesOrdinal(MatrizAvaliacaoFuzzy matrizAvaliacaoFuzzy){
		List<Usuario> alunosAvaliados = avaliacaoFuzzyDao.buscaAlunosAvaliadosPorMatrizAvaliacao(matrizAvaliacaoFuzzy.getId());
		
		List<AlunoAvaliacaoDto> rankingAlunos = new ArrayList<>();
		for (Usuario alunoAvaliado : alunosAvaliados) {
			AlunoAvaliacaoDto alunoAvaliacaoDto = new AlunoAvaliacaoDto();
			alunoAvaliacaoDto.setAluno(alunoAvaliado);
			List<Avaliacao> avaliacoesRecebidasAlunoAvaliado = avaliacaoDao.buscaAvaliacoesPorAlunoSinal(alunoAvaliado.getIdUsuario(),matrizAvaliacaoFuzzy.getSinal().getIdSinal());
			float somatorioNota = 0;
			float somatorioPeso = 0;
			for (Avaliacao avaliacao : avaliacoesRecebidasAlunoAvaliado) {
				somatorioNota += (avaliacao.getNotaMedia() * avaliacao.getPesoAvaliacao());
				somatorioPeso += avaliacao.getPesoAvaliacao();
			}
			alunoAvaliacaoDto.setNota(NumberUtils.arredondamentoQuatroCasas(somatorioNota/somatorioPeso));
			rankingAlunos.add(alunoAvaliacaoDto);
		}
		
		Collections.sort(rankingAlunos);
		Collections.reverse(rankingAlunos);
		
		int pa = Double.valueOf(Math.floor(alunosAvaliados.size()/2)).intValue();
		float diferencaEntrePosicoes = NumberUtils.arredondamentoQuatroCasas(0.05f/pa);
		
		int i = 1;
		for (AlunoAvaliacaoDto alunoAvaliacaoDto : rankingAlunos) {
			Usuario aluno = alunoAvaliacaoDto.getAluno();
			if(i>pa){
				break;
			}else if(i == 1){
				aluno.setPesoAvaliacao(aluno.getPesoAvaliacao() + 0.05f);
				//pesos[avaliacaoFuzzy.getI()] += 0.05;
			}else{
				aluno.setPesoAvaliacao(aluno.getPesoAvaliacao() + (0.05f - (diferencaEntrePosicoes * (i-1))));
				//pesos[avaliacaoFuzzy.getI()] += 0.05 - (diferencaEntrePosicoes * (i-1));
			}
			aluno.setPesoAvaliacao(NumberUtils.arredondamentoQuatroCasas(aluno.getPesoAvaliacao()));
			//pesos[avaliacaoFuzzy.getI()] = arredondamentoQuartoCasas(pesos[avaliacaoFuzzy.getI()]);
			i++;
		}
		
		Collections.reverse(rankingAlunos);
		i = 1;
		for (AlunoAvaliacaoDto alunoAvaliacaoDto : rankingAlunos) {
			Usuario aluno = alunoAvaliacaoDto.getAluno();
			if(i==pa){
				break;
			}else if(i == 1){
				aluno.setPesoAvaliacao(aluno.getPesoAvaliacao() - 0.05f);
				//pesos[avaliacaoFuzzy.getI()] -= 0.05;
			}else{
				aluno.setPesoAvaliacao(aluno.getPesoAvaliacao() - (0.05f - (diferencaEntrePosicoes * (i-1))));
				//pesos[avaliacaoFuzzy.getI()] -= 0.05 - (diferencaEntrePosicoes * (i-1));
			}
			aluno.setPesoAvaliacao(NumberUtils.arredondamentoQuatroCasas(aluno.getPesoAvaliacao()));
			//pesos[avaliacaoFuzzy.getI()] = arredondamentoQuartoCasas(pesos[avaliacaoFuzzy.getI()]);
			i++;
		}
		
		//atualizando o peso de avaliavao dos alunos
		for (AlunoAvaliacaoDto alunoAvaliacaoDto : rankingAlunos) {
			usuarioDao.altera(alunoAvaliacaoDto.getAluno());
		}
	}
}