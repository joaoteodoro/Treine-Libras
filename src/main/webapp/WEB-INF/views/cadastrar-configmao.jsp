<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Cadastrar Configura��o de M�o</title>
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
				<b>${logica[0]} Configura��o de M�o</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">

				<form id="formCadastrarConfiguracaoDeMao" method="post"
					action="cadastrarConfiguracaoDeMao" enctype="multipart/form-data">
					<input type="hidden" name="id" id="id" value="${configuracaoDeMao.idConfiguracaoDeMao}" />
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text" required
							class="form-control" id="nome" name="nome" placeholder="Nome" value="${configuracaoDeMao.nome}">
					</div>
					<div class="form-group">
						<c:if test="${configuracaoDeMao != null }">
							Imagem atual: <img class="img-responsive center-block parametro"
							src="${pageContext.request.contextPath}/resources/img/${configuracaoDeMao.imagem}" />
						</c:if>
						<label for="imagem">Imagem:</label> <input type="file" ${configuracaoDeMao == null ? 'required' : ''}
							class="form-control" name="imagem" id="imagem" placeholder="Imagem"
							accept="image/*">
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
						<h4 class="modal-title" id="myModalLabel">${logica[0]} - Configuracao De M�o</h4>
					</div>
					<div class="modal-body">Confirma ${logica[1]} desta Configura��o de M�o?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">N�o</button>
						<button type="button" class="btn btn-primary"
							onclick="gravarConfiguracaoDeMao()">Sim</button>
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
					<h4 id="tituloModalErro" class="modal-title">Par�metro j�
						selecionado</h4>
				</div>
				<div class="modal-body">
					<p id="conteudoModalErro">Este parametro j� est� selecionado,
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
 		$("#formCadastrarConfiguracaoDeMao")
				.submit(
						function() {

							if ($("#nome").val() != "") {
								if ($('#myModal').css("display") == "block") {
									return true;
								}
							} else {
								$("#tituloModalErro").text(
										"Par�metro em branco");
								$("#conteudoModalErro")
										.text(
												"Existem um ou mais campos vazios. Por favor, preencha todos os campos!");
								$("#modalErro").modal('show');
								return false;
							}
							$('#myModal').modal('show');
							return false;
						});

		function gravarConfiguracaoDeMao() {
// 			if($("#ehAlteracao").val() == "sim"){
// 				$("#formCadastrarUnidade").attr("action","alterarUnidade");
// 			}
			$("#formCadastrarConfiguracaoDeMao").submit();
		}
	</script>
</body>
</html>