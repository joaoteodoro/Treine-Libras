package br.com.treinelibras.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.treinelibras.dao.IArquivoDao;
import br.com.treinelibras.dao.IPontoDeArticulacaoDao;
import br.com.treinelibras.modelo.ConfiguracaoDeMao;
import br.com.treinelibras.modelo.PontoDeArticulacao;
import br.com.treinelibras.util.StringUtils;

@Controller
@Transactional
public class PontoDeArticulacaoController {
	
	@Autowired
	IPontoDeArticulacaoDao pontoDeArticulacaoDao;
	
	@Autowired
	IArquivoDao arquivoDao;
	
	@RequestMapping("pontosDeArticulacao")
	public String pontosDeArticulacao(Model model){
		List<PontoDeArticulacao> pontosDeArticulacao = pontoDeArticulacaoDao.lista();
		for (PontoDeArticulacao pontoDeArticulacao : pontosDeArticulacao) {
			List listaMaos = pontoDeArticulacaoDao.buscaMaosAssociadas(pontoDeArticulacao.getIdPontoDeArticulacao()); 
			if(listaMaos != null && !listaMaos.isEmpty()){
				pontoDeArticulacao.setPodeExcluir(false);
			}
		}
		model.addAttribute("pontosDeArticulacao",pontosDeArticulacao);
		return "pontosdearticulacao";
	}
	
	@RequestMapping("cadastrarPontoDeArticulacaoAntes")
	public String cadastrarPontoDeArticulacaoAntes(Model model, Long id){
		//alteracao
		if(id != null){
			PontoDeArticulacao pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(id);
			model.addAttribute("pontoDeArticulacao",pontoDeArticulacao);
			model.addAttribute("logica",new String[] {"Alterar","a alteração"});
		}else{
			model.addAttribute("logica",new String[] {"Cadastrar","o cadastro"});
		}
		return "cadastrar-pontodearticulacao";
	}
	
	@RequestMapping("cadastrarPontoDeArticulacao")
	public String cadastrarPontoDeArticulacao(Model model, HttpServletRequest request){
		PontoDeArticulacao pontoDeArticulacao = new PontoDeArticulacao();
		boolean isMultiPart = FileUpload.isMultipartContent(request);
		
		if (isMultiPart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			String formulario = "";
			try {
				List items = upload.parseRequest(request);
				Iterator iter = items.iterator();
				
				while (iter.hasNext()) {
					FileItem item = (FileItem) iter.next();
					
					if (!item.isFormField()) {
						String nomeArquivo = StringUtils.removerAcentos(pontoDeArticulacao.getNome()) + "-" + (pontoDeArticulacaoDao.buscaUltimoId() + 1L);
						if (item.getFieldName().equals("imagem")){
							if(item.getString() != null && !"".equals(item.getString())) {
								// salvarFoto
								System.out.println("nomeArquivo: " + nomeArquivo);
								item.setFieldName(nomeArquivo);
								arquivoDao.inserirImagemDiretorio(item, "img");
								pontoDeArticulacao.setImagem(item.getFieldName());
							}else{
								if(pontoDeArticulacao.getImagem() == null || "".equals(pontoDeArticulacao.getImagem())){
									pontoDeArticulacao.setImagem("img1.jpg");
								}
							}
						}
					}else{
						if("id".equals(item.getFieldName()) && !"".equals(item.getString())){
							pontoDeArticulacao = pontoDeArticulacaoDao.buscaPorId(Long.parseLong(item.getString()));
						}else if ("nome".equals(item.getFieldName())) {
							pontoDeArticulacao.setNome(item.getString());
						}
					}
				}
				if(pontoDeArticulacao.getIdPontoDeArticulacao() != null){
					pontoDeArticulacaoDao.altera(pontoDeArticulacao);
				}else{
					pontoDeArticulacaoDao.adiciona(pontoDeArticulacao);
				}
			}catch (FileUploadException ex) {
				ex.printStackTrace();
			}
		}
		return "redirect:pontosDeArticulacao";
	}
	
	@RequestMapping("removerPontoDeArticulacao")
	public String removerPontoDeArticulacao(Long id){
		pontoDeArticulacaoDao.remove(id);
		return "redirect:pontosDeArticulacao";
	}

}
