package br.com.treinelibras.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArquivoDao implements IArquivoDao {
	
	@Autowired
	protected ServletContext servletContext;

	@Override
	public void inserirImagemDiretorio(FileItem item, String pasta) {
		String caminho = servletContext.getRealPath("/resources/" + pasta) + "/";
		// String caminho = "D:\\videosTreineLibras\\";

		File diretorio = new File(caminho);

		if (!diretorio.exists()) {
			diretorio.mkdir();
		}

		String nome = item.getFieldName();
		String arq[] = nome.split("\\\\");

		for (int i = 0; i < arq.length; i++) {
			nome = arq[i];
		}

		File file = new File(diretorio, nome);
		FileOutputStream output;
		try {
			output = new FileOutputStream(file);

			InputStream is = item.getInputStream();
			byte[] buffer = new byte[2048];
			int nLidos;

			while ((nLidos = is.read(buffer)) >= 0) {
				output.write(buffer, 0, nLidos);
			}
			output.flush();
			output.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
