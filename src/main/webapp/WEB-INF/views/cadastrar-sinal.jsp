<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Cadastrar Sinal</title>
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
				<b>Cadastrar Sinal</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">
				<div id="modalConfigMao" class="modal fade bs-example-modal-lg"
					tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">Configurações de Mão</h4>
							</div>
							<div class="modal-body">
								<table class="table">
									<tbody>
										<tr>
											<c:forEach items="${configuracoesDeMao}"
												var="configuracaoDeMao" varStatus="status">
												<c:if test="${status.count mod 6 == 0}">
										</tr>
										<tr>
											</c:if>
											<td><img
												id="img-config-mao-${configuracaoDeMao.idConfiguracaoDeMao}"
												class="img-responsive opcao"
												src="${pageContext.request.contextPath}/resources/img/${configuracaoDeMao.imagem}"
												title="${configuracaoDeMao.nome}"> <input
												type="hidden"
												id="idConfigMao${configuracaoDeMao.idConfiguracaoDeMao}"
												name="idConfigMao${configuracaoDeMao.idConfiguracaoDeMao}"
												value="${configuracaoDeMao.idConfiguracaoDeMao}" /></td>
											</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div id="modalPontoArticulacao"
					class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">Pontos de Articulação</h4>
							</div>
							<div class="modal-body">
								<table class="table">
									<tbody>
										<tr>
											<c:forEach items="${pontosDeArticulacao}"
												var="pontoDeArticulacao" varStatus="status">
												<c:if test="${status.count mod 6 == 0}">
										</tr>
										<tr>
											</c:if>
											<td><img
												id="img-ponto-articulacao-${pontoDeArticulacao.idPontoDeArticulacao}"
												class="img-responsive opcao"
												src="${pageContext.request.contextPath}/resources/img/${pontoDeArticulacao.imagem}"
												title="${pontoDeArticulacao.nome}"> <input
												type="hidden"
												id="idPontoArticulacao${pontoDeArticulacao.idPontoDeArticulacao}"
												name="idPontoArticulacao${pontoDeArticulacao.idPontoDeArticulacao}"
												value="${pontoDeArticulacao.idPontoDeArticulacao}" /></td>
											</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div id="modalMovimento" class="modal fade bs-example-modal-lg"
					tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">Movimentos</h4>
							</div>
							<div class="modal-body">
								<table class="table">
									<tbody>
										<tr>
											<c:forEach items="${movimentos}" var="movimento"
												varStatus="status">
												<c:if test="${status.count mod 6 == 0}">
										</tr>
										<tr>
											</c:if>
											<td><img id="img-movimento-${movimento.idMovimento}"
												class="img-responsive opcao"
												src="${pageContext.request.contextPath}/resources/img/${movimento.imagem}"
												title="${movimento.nome}"> <input type="hidden"
												id="idMovimento${movimento.idMovimento}"
												name="idMovimento${movimento.idMovimento}"
												value="${movimento.idMovimento}" /></td>
											</c:forEach>
									</tbody>
								</table>
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
								<h4 id="tituloModalErro" class="modal-title">Parâmetro já selecionado</h4>
							</div>
							<div class="modal-body">
								<p id="conteudoModalErro">Este parametro já está selecionado, por favor selecione
									outro!</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Ok</button>
							</div>
						</div>
					</div>
				</div>

				<form id="formCadastrarSinal" method="post" action="cadastrarSinal"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text" required
							class="form-control" id="nome" name="nome" placeholder="Nome">
					</div>
					<div class="form-group">
						<label for="unidade">Unidade:</label> <input type="text" required pattern="[0-9]+$"
							class="form-control" id="unidade" name="unidade" placeholder="unidade">
					</div>
					<label id="labelConfiguracaoDeMao" for="configuracaoDeMao">Configurações
						de Mão:</label>
					<div class="configuracoesDeMao">
						<c:set var="camposConfigMao" value="1,2,3,4" scope="application" />
						<c:forEach items="${fn:split(camposConfigMao, ',')}" var="i">
							<div id="configMao${i}" class="parametro">
								<img id="imgConfigMao${i}" class="imgParametro"
									src="${pageContext.request.contextPath}/resources/img/mais.png"
									data-target="#modalConfigMao" data-toggle="modal"
									title="Clique para adicionar uma configuração de mão" />
								<div id="excluiConfigMao${i}" class="excluiParametro"
									style="display: none">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/excluir.png">
								</div>
								<input type="hidden" id="configuracaoDeMao${i}"
									name="configuracaoDeMao${i}" />
							</div>
						</c:forEach>
						<input type="hidden" name="qtdConfiguracaoDeMao"
							id="qtdConfiguracaoDeMao">
					</div>
					<br /> <br /> <br /> <label id="labelPontoDeArticulacao"
						for="pontoDeArticulacao">Pontos de Articulação:</label>
					<div class="pontosDeArticulacao">
						<c:set var="camposPontoArticulacao" value="1,2,3"
							scope="application" />
						<c:forEach items="${fn:split(camposPontoArticulacao, ',')}"
							var="i">
							<div id="pontoArticulacao${i}" class="parametro">
								<img id="imgPontoArticulacao${i}" class="imgParametro"
									src="${pageContext.request.contextPath}/resources/img/mais.png"
									data-target="#modalPontoArticulacao" data-toggle="modal"
									title="Clique para adicionar um ponto de articulação" />
								<div id="excluiPontoArticulacao${i}" class="excluiParametro"
									style="display: none">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/excluir.png">
								</div>
								<input type="hidden" id="pontoDeArticulacao${i}"
									name="pontoDeArticulacao${i}" />
							</div>
						</c:forEach>
						<input type="hidden" name="qtdPontoDeArticulacao"
							id="qtdPontoDeArticulacao">
					</div>

					<br /> <br /> <br /> <label id="labelMovimento" for="movimento">Movimentos:</label>
					<div class="movimentos">
						<c:set var="camposMovimentos" value="1,2" scope="application" />
						<c:forEach items="${fn:split(camposMovimentos, ',')}" var="i">
							<div id="mov${i}" class="parametro">
								<img id="imgMovimento${i}" class="imgParametro"
									src="${pageContext.request.contextPath}/resources/img/mais.png"
									data-target="#modalMovimento" data-toggle="modal"
									title="Clique para adicionar um movimento" />
								<div id="excluiMovimento${i}" class="excluiParametro"
									style="display: none">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/excluir.png">
								</div>
								<input type="hidden" id="movimento${i}" name="movimento${i}" />
							</div>
						</c:forEach>
						<input type="hidden" name="qtdMovimento" id="qtdMovimento">
					</div>
					<br /> <br /> <br />

					<div class="form-group">
						<label for="orientacao">Orientação:</label> <select
							class="form-control" id="orientacao" name="orientacao">
							<option value="Para cima">Para cima</option>
							<option value="Para baixo">Para baixo</option>
							<option value="Para dentro">Para dentro</option>
							<option value="Para fora">Para fora</option>
							<option value="Para o lado esquerdo">Para o lado
								esquerdo</option>
							<option value="Para o lado direito">Para o lado direito</option>
						</select>
					</div>
					<div class="form-group">
						<label for="expressao">Expressão Facial:</label> <select
							class="form-control" id="expressao" name="expressao">
							<c:forEach items="${expressoesFaciais}" var="expressaoFacial">
								<option value="${expressaoFacial.idExpressaoFacial}">${expressaoFacial.nome}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="foto">Foto:</label> <input type="file" required
							class="form-control" name="foto" id="foto" placeholder="Foto"
							accept="image/*">
					</div>

					<div class="form-group">
						<label for="video">Video:</label> <input type="file" required
							class="form-control" name="video" id="video" placeholder="Vídeo"
							accept="video/*">

					</div>

					<div class="form-group">
						<label for="categoria">Categoria:</label> <input type="text"
							required class="form-control" name="categoria" id="categoria"
							placeholder="Categoria">
					</div>

					<div class="form-group">
						<label for="dificuldade">Dificuldade:</label> <select
							class="form-control" id="dificuldade" name="dificuldade">
							<option value="Fácil">Fácil</option>
							<option value="Média">Média</option>
							<option value="Difícil">Difícil</option>
						</select>
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
						<h4 class="modal-title" id="myModalLabel">Cadastrar Sinal</h4>
					</div>
					<div class="modal-body">Confirma o cadastro deste sinal?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
						<button type="button" class="btn btn-primary"
							onclick="gravarSinal()">Sim</button>
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

		$(".imgParametro").click(
				function() {
					idClicada = this.id;
					nIdClicada = parseInt((this.id).substring(
							(idClicada.length) - 1, idClicada.length));
					nomeClicado = (this.id)
							.substring(3, (idClicada.length) - 1);
					definirNomeNoTitle(nomeClicado);
				});

		function verficarExistencia(valorEscolhido) {
			for (i = 1; i < quantidadeParametro + 1; i++) {
				if (nIdClicada != i
						&& $("#" + nomeInput + i).val() == valorEscolhido) {
					return true;
				}
			}
			return false;
		}

		$(".opcao")
				.click(
						function() {
							var idOpcaoClicada = parseInt((this.id).substring(
									((this.id).length) - 2,
									(this.id).length + 1));

							idOpcaoClicada = Math.abs(idOpcaoClicada);

							//verificar se essa opcao escolhida ja foi escolhida.
							if (verficarExistencia($(
									"#" + idInputModal + idOpcaoClicada).val())) {
								//alert('existe');
								$("#tituloModalErro").text("Parâmetro já selecionado");
								$("#conteudoModalErro").text("Este parametro já está selecionado, por favor selecione outro!");
								$("#modalErro").modal('show');
								return;
							}

							$("#" + idClicada).attr(
									"src",
									$("#" + idOpcaoModal + idOpcaoClicada)
											.attr("src"));
							$("#" + idClicada).attr(
									"title",
									$("#" + idOpcaoModal + idOpcaoClicada)
											.attr("title"));
							$("#" + nomeInput + nIdClicada).val(
									$("#" + idInputModal + idOpcaoClicada)
											.val()); //tem que alterar isso aqui ainda
							$("#exclui" + nomeExclui + nIdClicada).show();

							$("#" + idModal).modal("hide");
						});

		$(".excluiParametro")
				.click(
						function() {
							var idOpcaoClicada = parseInt((this.id).substring(
									((this.id).length) - 1, (this.id).length));
							var nomeOpcaoClicada = (this.id).substring(6,
									((this.id).length) - 1);

							definirNomeNoTitle(nomeOpcaoClicada);

							$("#img" + nomeOpcaoClicada + idOpcaoClicada)
									.attr("src",
											"${pageContext.request.contextPath}/resources/img/mais.png");
							$("#img" + nomeOpcaoClicada + idOpcaoClicada).attr(
									"title",
									"Clique para adicionar " + nomeNoTitle);
							$("#" + nomeInput + idOpcaoClicada).val("");
							$("#exclui" + nomeExclui + idOpcaoClicada).hide();
						});

		function definirNomeNoTitle(parametroClicado) {
			if (parametroClicado == 'ConfigMao') {
				nomeNoTitle = 'configuração de mão';
				nomeInput = 'configuracaoDeMao';
				nomeExclui = 'ConfigMao';
				idOpcaoModal = 'img-config-mao-';
				idInputModal = 'idConfigMao';
				quantidadeParametro = 4;
				idModal = 'modalConfigMao';
			} else if (parametroClicado == 'PontoArticulacao') {
				nomeNoTitle = 'ponto de articulação';
				nomeInput = 'pontoDeArticulacao';
				nomeExclui = 'PontoArticulacao';
				idOpcaoModal = 'img-ponto-articulacao-';
				idInputModal = 'idPontoArticulacao';
				quantidadeParametro = 3
				idModal = 'modalPontoArticulacao';
			} else if (parametroClicado == 'Movimento') {
				nomeNoTitle = 'movimento';
				nomeInput = 'movimento';
				nomeExclui = 'Movimento';
				idOpcaoModal = 'img-movimento-';
				idInputModal = 'idMovimento';
				quantidadeParametro = 2;
				idModal = 'modalMovimento';
			}
			idOpcaoModal = idOpcaoModal.replace("--", "-");
		}

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

		$("#formCadastrarSinal")
				.submit(
						function() {

							if (defineQuantidadeParametro("configuracaoDeMao",
									4, "qtdConfiguracaoDeMao") > 0
									&& defineQuantidadeParametro(
											"pontoDeArticulacao", 4,
											"qtdPontoDeArticulacao") > 0
									&& defineQuantidadeParametro("movimento",
											4, "qtdMovimento") > 0) {
								if ($('#myModal').css("display") == "block") {
									return true;
								}
							} else {
								$("#tituloModalErro").text("Parâmetro em branco");
								$("#conteudoModalErro").text("Existem um ou mais campos vazios. Por favor, preencha todos os campos!");
								$("#modalErro").modal('show');
								//alert("Existem campos vazios. Por favor, preencha todos os campos!");
								return false;
							}
							$('#myModal').modal('show');
							return false;

						});

		function gravarSinal() {
			$("#formCadastrarSinal").submit();
		}
	</script>
</body>
</html>