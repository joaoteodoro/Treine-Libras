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
import br.com.treinelibras.dao.IConfiguracaoDeMaoDao;
import br.com.treinelibras.modelo.ConfiguracaoDeMao;
import br.com.treinelibras.util.FileUtils;
import br.com.treinelibras.util.StringUtils;

@Controller
@Transactional
public class ConfiguracaoDeMaoController {
	
	@Autowired
	IConfiguracaoDeMaoDao configuracaoDeMaoDao;
	
	@Autowired
	IArquivoDao arquivoDao;
	
	@RequestMapping("configuracoesDeMao")
	public String configuracoesDeMao(Model model){
		List<ConfiguracaoDeMao> configuracoesDeMao = configuracaoDeMaoDao.lista();
		model.addAttribute("configuracoesDeMao",configuracoesDeMao);
		return "configuracoesdemao";
	}
	
	@RequestMapping("cadastrarConfiguracaoDeMaoAntes")
	public String cadastrarConfiguracaoDeMaoAntes(Model model, Long id){
		//alteracao
		if(id != null){
			ConfiguracaoDeMao configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(id);
			model.addAttribute("configuracaoDeMao",configuracaoDeMao);
			model.addAttribute("logica",new String[] {"Alterar","a alteração"});
		}else{
			model.addAttribute("logica",new String[] {"Cadastrar","o cadastro"});
		}
		return "cadastrar-configmao";
	}
	
	@RequestMapping("cadastrarConfiguracaoDeMao")
	public String cadastrarConfiguracaoDeMao(Model model, HttpServletRequest request){
		ConfiguracaoDeMao configuracaoDeMao = new ConfiguracaoDeMao();
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
						String nomeArquivo = StringUtils.removerAcentos(configuracaoDeMao.getNome()) + "-" + configuracaoDeMaoDao.buscaUltimoId() + 1;
						if (item.getFieldName().equals("imagem") && item.getString() != null && !"".equals(item.getString())) {
							// salvarFoto
							System.out.println("nomeArquivo: " + nomeArquivo);
							item.setFieldName(nomeArquivo);
							arquivoDao.inserirImagemDiretorio(item, "img");
							configuracaoDeMao.setImagem(item.getFieldName());
						}
					}else{
						if("id".equals(item.getFieldName()) && !"".equals(item.getString())){
							configuracaoDeMao = configuracaoDeMaoDao.buscaPorId(Long.parseLong(item.getString()));
						}else if ("nome".equals(item.getFieldName())) {
							configuracaoDeMao.setNome(item.getString());
						}
					}
				}
				if(configuracaoDeMao.getIdConfiguracaoDeMao() != null){
					configuracaoDeMaoDao.altera(configuracaoDeMao);
				}else{
					configuracaoDeMaoDao.adiciona(configuracaoDeMao);
				}
			}catch (FileUploadException ex) {
				ex.printStackTrace();
			}
		}
		return "redirect:configuracoesDeMao";
	}
	
	@RequestMapping("removerConfigMao")
	public String removerConfigMao(Long id){
		configuracaoDeMaoDao.remove(id);
		return "redirect:configuracoesDeMao";
	}
	
}
