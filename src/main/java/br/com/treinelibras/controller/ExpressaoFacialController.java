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
import br.com.treinelibras.dao.IExpressaoFacialDao;
import br.com.treinelibras.dao.IMovimentoDao;
import br.com.treinelibras.modelo.ExpressaoFacial;
import br.com.treinelibras.modelo.Movimento;
import br.com.treinelibras.util.StringUtils;

@Controller
@Transactional
public class ExpressaoFacialController {
	
	@Autowired
	IExpressaoFacialDao expressaoFacialDao;
	
	@Autowired
	IArquivoDao arquivoDao;
	
	@RequestMapping("expressoesFaciais")
	public String expressoesFaciais(Model model){
		List<ExpressaoFacial> expressoesFaciais = expressaoFacialDao.lista();
		for (ExpressaoFacial expressaoFacial : expressoesFaciais) {
			List sinais = expressaoFacialDao.buscaSinaisAssociados(expressaoFacial.getIdExpressaoFacial()); 
			if(sinais != null && !sinais.isEmpty()){
				expressaoFacial.setPodeExcluir(false);
			}
		}
		model.addAttribute("expressoesFaciais",expressoesFaciais);
		return "expressoesfaciais";
	}
	
	@RequestMapping("cadastrarExpressaoFacialAntes")
	public String cadastrarExpressaoFacialAntes(Model model, Long id){
		//alteracao
		if(id != null){
			ExpressaoFacial expressaoFacial = expressaoFacialDao.buscaPorId(id);
			model.addAttribute("expressaoFacial",expressaoFacial);
			model.addAttribute("logica",new String[] {"Alterar","a alteração"});
		}else{
			model.addAttribute("logica",new String[] {"Cadastrar","o cadastro"});
		}
		return "cadastrar-expressaofacial";
	}
	
	@RequestMapping("cadastrarExpressaoFacial")
	public String cadastrarExpressaoFacial(Model model, HttpServletRequest request){
		ExpressaoFacial expressaoFacial = new ExpressaoFacial();
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
						String nomeArquivo = StringUtils.removerAcentos(expressaoFacial.getNome()) + "-" + expressaoFacialDao.buscaUltimoId() + 1;
						if (item.getFieldName().equals("imagem") && item.getString() != null && !"".equals(item.getString())) {
							// salvarFoto
							System.out.println("nomeArquivo: " + nomeArquivo);
							item.setFieldName(nomeArquivo);
							arquivoDao.inserirImagemDiretorio(item, "img");
							expressaoFacial.setImagem(item.getFieldName());
						}
					}else{
						if("id".equals(item.getFieldName()) && !"".equals(item.getString())){
							expressaoFacial = expressaoFacialDao.buscaPorId(Long.parseLong(item.getString()));
						}else if ("nome".equals(item.getFieldName())) {
							expressaoFacial.setNome(item.getString());
						}
					}
				}
				if(expressaoFacial.getIdExpressaoFacial() != null){
					expressaoFacialDao.altera(expressaoFacial);
				}else{
					expressaoFacialDao.adiciona(expressaoFacial);
				}
			}catch (FileUploadException ex) {
				ex.printStackTrace();
			}
		}
		return "redirect:expressoesFaciais";
	}
	
	@RequestMapping("removerExpressaoFacial")
	public String removerMovimento(Long id){
		expressaoFacialDao.remove(id);
		return "redirect:expressoesFaciais";
	}

}
