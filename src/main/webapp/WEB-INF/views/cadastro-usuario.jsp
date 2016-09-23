<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Avaliar</title>
	<meta name="description" content="" />
	<c:import url="imports.jsp" />
	</head>

	<body>
		<div class="container" style="background-color: white;">
			<br/>
			<br/>
			<div class="alinhamento-esquerdo">
				<h2><b>Cadastro de usuário</b></h2>
				<br/>
			</div>
			<div class="row">
				<div class="center-block box-page-geral">
					<form action="adicionaUsuario" method="post">
						<div class="form-group">
							<label for="nome">Nome:</label>
							<input type="text" required class="form-control" id="nome" name="nome" placeholder="Nome">
						</div>
						<div class="form-group">
							<label for="email">Email:</label>
							<input type="email" required class="form-control" id="email" name="email" placeholder="Email">
						</div>
						<div class="form-group">
							<label for="usuario">Usuário:</label>
							<input type="text" required class="form-control" id="usuario" name="usuario" placeholder="Usuario">
						</div>
						<div class="form-group">
							<label for="senha">Senha:</label>
							<input type="password" required class="form-control" id="senha" name="senha" placeholder="Senha">
						</div>
						<div class="form-group">
							<label for="confirmarSenha">Confirmar Senha:</label>
							<input type="password" required class="form-control" id="confirmarSenha" placeholder="Confirmar Senha">
						</div>
					  <button type="submit" class="bg-black color-white pull-right btn btn-default">Cadastrar</button>
					</form>
				</div>
			</div>
		</div>
		<c:import url="rodape.jsp" />
	</body>
</html>