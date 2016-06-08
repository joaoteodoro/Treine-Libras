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
			<form class="form-horizontal" id="efetuaLogin" action="efetuaLogin" method="post">
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
					<button id="botaoAcessar" class="btn  btn-geral">Acessar</button>
				</div>
			</form>
			
			<br/><br/>
			<div id="loginErro" class="col-sm-offset-5 col-sm-4">
			</div>
			<br/><br/>
			<div class="center-block">
				<button onclick='window.location.href="novoUsuario"' type="submit" class="btn  btn-geral btn-cadastrar center-block ">Cadastre-se</button>
			</div>
		</div>
		<c:import url="rodape.jsp" />
		<script type="text/javascript">
			$("#botaoAcessar").click(function(){
				var usuario = $("#usuario").val();
				var senha = $("#senha").val();
				$.post("validaLogin",{'usuario' : usuario, 'senha' : senha}, function(resposta){
					console.log("resposta: "+resposta);
					if(resposta != ''){
						console.log("entrou if");
						$("#loginErro").html(resposta);
					}else{
						console.log("entrou else");
						$("#efetuaLogin").submit();
					}
				});
			})
		</script>
	</body>
</html>