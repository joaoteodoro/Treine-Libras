<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Alterar senha</title>
<meta name="description" content="" />
<c:import url="imports.jsp" />
</head>

<body style="background-color: gray">
	<c:import url="menu.jsp">
		<c:param name="paginaAtual" value="sinais" />
	</c:import>
	<div class="container" style="background-color: white;">
		<br /> <br />
		<div class="alinhamento-esquerdo">
			<h2>
				<b>Alterar senha do ${usuario.perfil}</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">
				<form id="formAlterarSenha" method="post"
					action="alterarSenhaUsuario">
					<input type="hidden" name="idUsuario" id="idUsuario"
						value="${usuario.idUsuario}" />
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text"
							disabled="disabled" required class="form-control" id="nomeAux"
							name="nomeAux" placeholder="Nome" value="${usuario.nome}">
						<input type="hidden" id="nome" name="nome" placeholder="Nome"
							value="${usuario.nome}">
					</div>
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							disabled="disabled" required class="form-control" id="emailAux"
							name="emailAux" placeholder="Email" value="${usuario.email}">
						<input type="hidden" id="email" name="email"
							value="${usuario.email}">
					</div>
					<div class="form-group">
						<label for="usuario">Usuário:</label> <input type="text"
							disabled="disabled" required class="form-control" id="usuarioAux"
							name="usuarioAux" placeholder="Usuario"
							value="${usuario.usuario}"> <input type="hidden"
							id="usuario" name="usuario" placeholder="Usuario"
							value="${usuario.usuario}">
					</div>
					<div class="form-group">
						<label for="senha">Senha:</label> <input type="password" required
							class="form-control" id="senha" name="senha" placeholder="Senha">
					</div>
					<div class="form-group">
						<label for="confirmarSenha">Confirmar Senha:</label> <input
							type="password" required class="form-control" id="confirmarSenha"
							placeholder="Confirmar Senha">
					</div>
					<button type="submit"
						class="bg-black color-white pull-right btn btn-default">Cadastrar</button>
				</form>
			</div>
		</div>

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Confirmar alteração
							de senha</h4>
					</div>
					<div class="modal-body">Confirma a alteração da senha?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
						<button type="button" class="btn btn-primary"
							onclick="alterarSenha()">Sim</button>
					</div>
				</div>
			</div>
		</div>
		<div id="modalErro" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myLargeModalLabel">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 id="tituloModalErro" class="modal-title">Senhas incorretas</h4>
					</div>
					<div class="modal-body">
						<p id="conteudoModalErro">As senhas informadas não são iguais!</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="rodape.jsp" />
	<script>
		$("#formAlterarSenha")
				.submit(
						function() {

							if ($("#senha").val() == $("#confirmarSenha").val()) {
								if ($('#myModal').css("display") == "block") {
									return true;
								}
							} else {
								$("#tituloModalErro").text("Senhas incorretas");
								$("#conteudoModalErro")
										.text(
												"Confirmação de senha está distinda da senha informada!");
								$("#modalErro").modal('show');
								return false;
							}

							$('#myModal').modal('show');
							return false;
						});

		function alterarSenha() {
			// 			if($("#ehAlteracao").val() == "sim"){
			// 				$("#formCadastrarUnidade").attr("action","alterarUnidade");
			// 			}
			$("#formAlterarSenha").submit();
		}
	</script>
</body>
</html>