<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="cadastrarSinal" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="nome">Nome:</label>
			<input type="text" required class="form-control" id="nome" name="nome" placeholder="Nome">
		</div>
		
		<div class="form-group">
							<label id="labelConfiguracaoDeMao" for="configuracaoDeMao">Configura��o de M�o:</label>
							<input type="text" required class="form-control" id="configuracaoDeMao" name="configuracaoDeMao" placeholder="Configura��o de M�o">
						</div>
		<div class="form-group">
							<label id="labelPontoDeArticulacao" for="pontoDeArticulacao">Ponto de Articula��o:</label>
							<select class="form-control" id="pontoDeArticulacao" name="pontoDeArticulacao" >
								<option value="Neutro">Neutro</option>
								<option value="Na testa">Na testa</option>
								<option value="Na boca">Na boca</option>
								<option value="Na orelha">Na orelha</option>
							</select>
							<a id="pontoDeArticulacaoMais" href="#" title="Adicionar outro ponto de articula��o">+</a>
							<select style="display: none" class="form-control" id="pontoDeArticulacao2" name="pontoDeArticulacao2">
								<option value="Neutro">Neutro</option>
								<option value="Na testa">Na testa</option>
								<option value="Na boca">Na boca</option>
								<option value="Na orelha">Na orelha</option>
							</select>
							<a style="display: none" id="pontoDeArticulacaoMenos" href="#" title="Remover outro ponto de articula��o">-</a>
						</div>
						
		<div class="form-group">
							<label id="labelMovimento" for="movimento">Movimento:</label>
							<select class="form-control" id="movimento" name="movimento">
								<option value="Direcional no espa�o">Direcional no espa�o</option>
								<option value="Unidirecional">Unidirecional</option>
							</select>
							<a id="movimentoMais" href="#" title="Adicionar outro movimento">+</a>
							<select style="display: none" class="form-control" id="movimento2" name="movimento2">
								<option value="Direcional no espa�o">Direcional no espa�o</option>
								<option value="Unidirecional">Unidirecional</option>
							</select>
							<a style="display: none" id="movimentoMenos" href="#" title="Remover outro movimento">-</a>
						</div>
						
						
		<div class="form-group">
							<label for="orientacao">Orienta��o:</label>
							<select class="form-control" id="orientacao" name="orientacao">
								<option value="Para cima">Para cima</option>
								<option value="Para baixo">Para baixo</option>
								<option value="Para dentro">Para dentro</option>
								<option value="Para fora">Para fora</option>
								<option value="Para o lado esquerdo">Para o lado esquerdo</option>
								<option value="Para o lado direito">Para o lado direito</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="expressao">Expressao:</label>
							<select class="form-control" id="expressao" name="expressao">
								<option value="Afirmativa">Afirmativa</option>
								<option value="Interrogativa">Interrogativa</option>
								<option value="Exclamativa">Exclamativa</option>
								<option value="Negativa">Negativa</option>
							</select>
						</div>
						
		<div class="form-group">
			<label for="dificuldade">Dificuldade:</label>
			<select class="form-control" id="dificuldade" name="dificuldade">
				<option value="F�cil">F�cil</option>
				<option value="M�dia">M�dia</option>
				<option value="Dif�cil">Dif�cil</option>
			</select>
		</div>
		
		<div class="form-group">
							<label for="foto">Foto:</label>
							<input type="file" required class="form-control" name="foto" id="foto" placeholder="Foto" accept="image/*">
						</div>
		
		<button type="submit" class="bg-black color-white pull-right btn btn-default">Cadastrar</button>
	</form>
</body>
</html>