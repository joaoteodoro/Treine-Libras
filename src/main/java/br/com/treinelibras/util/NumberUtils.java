package br.com.treinelibras.util;

import java.text.DecimalFormat;

public class NumberUtils {
	
	public static float arredondamentoQuatroCasas(float valor){
		DecimalFormat decimalFormat = new DecimalFormat();
		decimalFormat.setMinimumFractionDigits(4);
		
		try {
			return Float.valueOf(decimalFormat.format(valor).replaceAll("\\.", "").replaceAll(",", "."));
		} catch (Exception e) {
			System.out.println("teste");
		}
		return (Float) null;
	}

}
