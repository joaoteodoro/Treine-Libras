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
import br.com.treinelibras.dao.IMovimentoDao;
import br.com.treinelibras.modelo.Movimento;
import br.com.treinelibras.util.StringUtils;

@Controller
@Transactional
public class MovimentoController {
	
	@Autowired
	IMovimentoDao movimentoDao;
	
	@Autowired
	IArquivoDao arquivoDao;
	
	@RequestMapping("movimentos")
	public String movimentos(Model model){
		List<Movimento> movimentos = movimentoDao.lista();
		for (Movimento movimento : movimentos) {
			List listaMaos = movimentoDao.buscaMaosAssociadas(movimento.getIdMovimento()); 
			if(listaMaos != null && !listaMaos.isEmpty()){
				movimento.setPodeExcluir(false);
			}
		}
		model.addAttribute("movimentos",movimentos);
		return "movimentos";
	}
	
	@RequestMapping("cadastrarMovimentoAntes")
	public String cadastrarMovimentoAntes(Model model, Long id){
		//alteracao
		if(id != null){
			Movimento movimento = movimentoDao.buscaPorId(id);
			model.addAttribute("movimento",movimento);
			model.addAttribute("logica",new String[] {"Alterar","a alteração"});
		}else{
			model.addAttribute("logica",new String[] {"Cadastrar","o cadastro"});
		}
		return "cadastrar-movimento";
	}
	
	@RequestMapping("cadastrarMovimento")
	public String cadastrarMovimento(Model model, HttpServletRequest request){
		Movimento movimento = new Movimento();
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
						String nomeArquivo = StringUtils.removerAcentos(movimento.getNome()) + "-" + movimentoDao.buscaUltimoId() + 1;
						if (item.getFieldName().equals("imagem") && item.getString() != null && !"".equals(item.getString())) {
							// salvarFoto
							System.out.println("nomeArquivo: " + nomeArquivo);
							item.setFieldName(nomeArquivo);
							arquivoDao.inserirImagemDiretorio(item, "img");
							movimento.setImagem(item.getFieldName());
						}
					}else{
						if("id".equals(item.getFieldName()) && !"".equals(item.getString())){
							movimento = movimentoDao.buscaPorId(Long.parseLong(item.getString()));
						}else if ("nome".equals(item.getFieldName())) {
							movimento.setNome(item.getString());
						}
					}
				}
				if(movimento.getIdMovimento() != null){
					movimentoDao.altera(movimento);
				}else{
					movimentoDao.adiciona(movimento);
				}
			}catch (FileUploadException ex) {
				ex.printStackTrace();
			}
		}
		return "redirect:movimentos";
	}
	
	@RequestMapping("removerMovimento")
	public String removerMovimento(Long id){
		movimentoDao.remove(id);
		return "redirect:movimentos";
	}

}
