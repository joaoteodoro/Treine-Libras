package br.com.treinelibras.dao;

import org.apache.commons.fileupload.FileItem;

public interface IArquivoDao {
	
	public void inserirImagemDiretorio(FileItem item, String pasta);
}
