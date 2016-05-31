<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Login</title>
	<c:import url="imports.jsp" />
	</head>
	
	<body>
		<div class="container" style="background-color: white; height: 100%;">
		
			<div class="text-center div-titulo">
				<h1 class="titulo">Treine Libras</h1>
			</div>
			<form class="form-horizontal" action="efetuaLogin" method="post">
				<div class="form-group">
					<label for="usuario" class="col-sm-5 control-label" >Usuário </label>
					<div class="col-sm-3">
						<input type="text" maxlength="15" class="form-control" id="usuario" name="usuario" placeholder="Usuário" required>
					</div>
				</div>
				
				<div class="form-group">
					<label for="senha" class="col-sm-5 control-label">Senha </label>
					<div class="col-sm-3">
						<input type="password" maxlength="15" class="form-control" id="senha" name="senha" placeholder="Senha" required>
					</div>
				</div>
				
				<div class="col-sm-offset-7 col-sm-1">
					<button type="submit" class="btn  btn-geral">Acessar</button>
				</div>
				<br/><br/><br/><br/>
			</form>
			<div class="center-block">
				<button onclick='window.location.href="cadastro-usuario.html"' type="submit" class="btn  btn-geral btn-cadastrar center-block ">Cadastre-se</button>
			</div>
		</div>
	</body>

</html>