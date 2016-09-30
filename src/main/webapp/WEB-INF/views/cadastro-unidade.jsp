<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Cadastrar Unidade</title>
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
				<b>Cadastrar Unidade</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">

				<form id="formCadastrarUnidade" method="post"
					action="cadastrarUnidade" enctype="multipart/form-data">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text" required
							class="form-control" id="nome" name="nome" placeholder="Nome">
					</div>
					<div class="form-group">
						<label for="numero">Numero:</label> <input type="text"
							maxlength="2" required pattern="[0-9]+$" class="form-control"
							id="numero" name="numero" placeholder="Número">
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
						<h4 class="modal-title" id="myModalLabel">Cadastrar Unidade</h4>
					</div>
					<div class="modal-body">Confirma o cadastro desta Unidade?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
						<button type="button" class="btn btn-primary"
							onclick="gravarUnidade()">Sim</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalResposta" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Cadastro de Sinal</h4>
				</div>
				<div class="modal-body" id="textoResposta"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
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
					<h4 id="tituloModalErro" class="modal-title">Parâmetro já
						selecionado</h4>
				</div>
				<div class="modal-body">
					<p id="conteudoModalErro">Este parametro já está selecionado,
						por favor selecione outro!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>
	<c:import url="rodape.jsp" />
	<script>
		var idClicada;
		var nIdClicada;
		var nomeClicado;
		var nomeNoTitle;
		var nomeInput;
		var nomeExclui;
		var idOpcaoModal;
		var idInputModal;
		var quantidadeParametro;
		var idModal;

		function cadastrar() {
			alert(validar());
		}

		//validar se existe pelo menos uma opção selecionada
		function validar() {
			if (validarCamposVazios("configuracaoDeMao", 4)
					&& verificarRepeticao("configuracaoDeMao", 4)
					&& validarCamposVazios("pontoDeArticulacao", 3)
					&& verificarRepeticao("pontoDeArticulacao", 3)
					&& validarCamposVazios("movimento", 2)
					&& verificarRepeticao("movimento", 2)) {
				return true;
			}
			return false;
		}

		//false se tiver repetição
		function verificarRepeticao(parametro, tamanhoVetor) {
			for (i = 1; i < tamanhoVetor + 1; i++) {
				var parametroI = $("#" + parametro + i).val();
				for (j = 1; j < tamanhoVetor + 1; j++) {
					var parametroJ = $("#" + parametro + j).val();
					if (i != j && parametroI == parametroJ && parametroI != ""
							&& parametroJ != "") {
						return false;
					}
				}
			}
			return true;
		}

		//false se estiver vazio
		function validarCamposVazios(parametro, tamanhoVetor) {
			for (i = 1; i < tamanhoVetor + 1; i++) {
				var parametroI = $("#" + parametro + i).val();
				if (parametroI != null && parametroI != "") {
					return true;
				}
			}
			return false;
		}

		function defineQuantidadeParametro(nomeParametro, quantidadeCampos,
				inputQuantidade) {
			var quantidade = 0;
			for (i = 1; i < quantidadeCampos + 1; i++) {
				var parametro = $("#" + nomeParametro + i).val();
				if (parametro != null && parametro != "") {
					quantidade++;
				}
			}
			$("#" + inputQuantidade).val(quantidade);

			return quantidade;
		}

		$("#formCadastrarUnidade")
				.submit(
						function() {

							if ($("#nome").val() != ""
									&& $("#numero").val() != "") {
								if ($('#myModal').css("display") == "block") {
									return true;
								}
							} else {
								$("#tituloModalErro").text(
										"Parâmetro em branco");
								$("#conteudoModalErro")
										.text(
												"Existem um ou mais campos vazios. Por favor, preencha todos os campos!");
								$("#modalErro").modal('show');
								return false;
							}
							$('#myModal').show();
							return false;
						});

		function gravarUnidade() {
			$("#formCadastrarUnidade").submit();
		}
	</script>
</body>
</html>