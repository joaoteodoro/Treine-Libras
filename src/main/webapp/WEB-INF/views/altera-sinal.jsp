<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Alterar Sinal</title>
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
				<b>Alterar Sinal ${sinal.nome}</b>
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
								<h4 class="modal-title">Configura��es de M�o</h4>
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
								<h4 class="modal-title">Pontos de Articula��o</h4>
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
								<h4 id="tituloModalErro" class="modal-title">Par�metro j�
									selecionado</h4>
							</div>
							<div class="modal-body">
								<p id="conteudoModalErro">Este parametro j� est�
									selecionado, por favor selecione outro!</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Ok</button>
							</div>
						</div>
					</div>
				</div>


				<form id="formAlterarSinal" method="post" action="alterarSinal"
					enctype="multipart/form-data">
					<input type="hidden" value="${sinal.idSinal}" id="idSinal"
						name="idSinal">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text"
							value="${sinal.nome}" disabled class="form-control" id="nome"
							name="nome" placeholder="Nome">
					</div>
					<div class="form-group">
						<label for="unidade">Unidade:</label> <select class="form-control"
							id="unidade" name="unidade">
							<c:forEach items="${unidades}" var="unidade">
								<option ${unidade.id == sinal.unidade.id ? 'selected' : ''}
									value="${unidade.id}">${unidade.numero}-
									${unidade.nome}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label id="labelUtilizacaoDasMaos" for="utilizacaoDasMaos">Utiliza��o
							das M�os</label><br />
						<c:forEach items="${utilizacoesDasMaos}" var="utilizacaoDaMao"
							varStatus="status">
							<input onclick="exibeBlocoUtilizacaoDasMaos()" type="radio"
								name="utilizacoesDasMaos" id="utilizacaoDasMaos${status.count}"
								${utilizacaoDaMao == sinal.utilizacaoDasMaos ? 'checked' : ''}
								value="${utilizacaoDaMao}">
							 	${utilizacaoDaMao.descricao}
						</c:forEach>
						<input type="hidden" id="utilizacaoDasMaos"
							name="utilizacaoDasMaos" />
					</div>


					<div id="bloco-maoPrincipal" class="col-md-6 bloco-mao">
						<h4>M�o Principal</h4>
						<label id="labelConfiguracaoDeMao1" for="configuracaoDeMao1">Configura��o
							de M�o:</label>
						<div class="configuracoesDeMao">
							<div id="configMao1" class="parametro">
								<img id="imgConfigMao1" class="imgParametro"
									src="${pageContext.request.contextPath}/resources/img/${sinal.maoPrincipal.configuracaoDeMao.imagem}"
									data-target="#modalConfigMao" data-toggle="modal"
									title="${sinal.maoPrincipal.configuracaoDeMao.nome}" />
								<div id="excluiConfigMao1" class="excluiParametro">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/excluir.png">
								</div>
								<input type="hidden" id="configuracaoDeMao1"
									name="configuracaoDeMao1" value="${sinal.maoPrincipal.configuracaoDeMao.idConfiguracaoDeMao }"/>
							</div>
							<input type="hidden" name="qtdConfiguracaoDeMao"
								id="qtdConfiguracaoDeMao">
						</div>
						<br /> <br /> <br /> <label id="labelPontoDeArticulacao1"
							for="pontoDeArticulacao1">Ponto de Articula��o</label>
						<div class="pontosDeArticulacao1">
							<div id="pontoArticulacao1" class="parametro">
								<img id="imgPontoArticulacao1" class="imgParametro"
									src="${pageContext.request.contextPath}/resources/img/${sinal.maoPrincipal.pontoDeArticulacao.imagem}"
									data-target="#modalPontoArticulacao" data-toggle="modal"
									title="${sinal.maoPrincipal.pontoDeArticulacao.nome}" />
								<div id="excluiPontoArticulacao1" class="excluiParametro">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/excluir.png">
								</div>
								<input type="hidden" id="pontoDeArticulacao1"
									name="pontoDeArticulacao1" value="${sinal.maoPrincipal.pontoDeArticulacao.idPontoDeArticulacao}" />
							</div>
							<input type="hidden" name="qtdPontoDeArticulacao"
								id="qtdPontoDeArticulacao">
						</div>
						<br /> <br /> <br /> <label id="labelMovimento" for="movimento">Movimento:</label>
						<div class="movimentos">
							<div id="mov1" class="parametro">
								<img id="imgMovimento1" class="imgParametro"
									src="${pageContext.request.contextPath}/resources/img/${sinal.maoPrincipal.movimento.imagem}"
									data-target="#modalMovimento" data-toggle="modal"
									title="${sinal.maoPrincipal.movimento.nome}" />
								<div id="excluiMovimento1" class="excluiParametro">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/excluir.png">
								</div>
								<input type="hidden" id="movimento1" name="movimento1" value="${sinal.maoPrincipal.movimento.idMovimento}" />
							</div>
							<input type="hidden" name="qtdMovimento" id="qtdMovimento">
						</div>
						<br /> <br /> <br />

						<div class="form-group">
							<label for="orientacao1">Orienta��o:</label> <select
								class="form-control" id="orientacao1" name="orientacao1">
								<c:forEach items="${orientacoes}" var="orientacao">
									<option value="${orientacao}"
										${sinal.maoPrincipal.orientacao.descricao == orientacao.descricao ? 'selected' : ''}>${orientacao.descricao}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div id="bloco-maoSecundaria" class="col-md-6 bloco-mao">
						<h4>M�o Secund�ria</h4>
						<label id="labelConfiguracaoDeMao2" for="configuracaoDeMao2">Configura��o
							de M�o:</label>
						<div class="configuracoesDeMao">
							<div id="configMao2" class="parametro">
								<img id="imgConfigMao2" class="imgParametro"
									src="${pageContext.request.contextPath}/resources/img/${sinal.maoSecundaria.configuracaoDeMao.imagem}"
									data-target="#modalConfigMao" data-toggle="modal"
									title="${sinal.maoSecundaria.configuracaoDeMao.nome}" />
								<div id="excluiConfigMao2" class="excluiParametro"
									style="display: none">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/excluir.png">
								</div>
								<input type="hidden" id="configuracaoDeMao2"
									name="configuracaoDeMao2" value="${sinal.maoSecundaria.configuracaoDeMao.idConfiguracaoDeMao}"/>
							</div>
						</div>
						<br /> <br /> <br /> <label id="labelPontoDeArticulacao2"
							for="pontoDeArticulacao2">Ponto de Articula��o</label>
						<div class="pontosDeArticulacao2">
							<div id="pontoArticulacao2" class="parametro">
								<img id="imgPontoArticulacao2" class="imgParametro"
									src="${pageContext.request.contextPath}/resources/img/${sinal.maoSecundaria.pontoDeArticulacao.imagem}"
									data-target="#modalPontoArticulacao" data-toggle="modal"
									title="${sinal.maoSecundaria.pontoDeArticulacao.nome}" />
								<div id="excluiPontoArticulacao2" class="excluiParametro"
									style="display: none">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/excluir.png">
								</div>
								<input type="hidden" id="pontoDeArticulacao2"
									name="pontoDeArticulacao2" value="${sinal.maoSecundaria.pontoDeArticulacao.idPontoDeArticulacao}" />
							</div>
						</div>
						<br /> <br /> <br /> <label id="labelMovimento" for="movimento2">Movimento:</label>
						<div class="movimentos">
							<div id="mov2" class="parametro">
								<img id="imgMovimento2" class="imgParametro"
									src="${pageContext.request.contextPath}/resources/img/${sinal.maoSecundaria.movimento.imagem}"
									data-target="#modalMovimento" data-toggle="modal"
									title="${sinal.maoSecundaria.movimento.nome}" />
								<div id="excluiMovimento2" class="excluiParametro"
									style="display: none">
									<img class="img-responsive"
										src="${pageContext.request.contextPath}/resources/img/excluir.png">
								</div>
								<input type="hidden" id="movimento2" name="movimento2" value="${sinal.maoSecundaria.movimento.idMovimento}"/>
							</div>
						</div>
						<br /> <br /> <br />

						<div class="form-group">
							<label for="orientacao2">Orienta��o:</label> <select
								class="form-control" id="orientacao2" name="orientacao2">
								<c:forEach items="${orientacoes}" var="orientacao">
									<option value="${orientacao}"
										${sinal.maoSecundaria.orientacao.descricao == orientacao.descricao ? 'selected' : ''}>${orientacao.descricao}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row"></div>
					<div class="form-group">
						<label for="expressao">Express�o Facial:</label> <select
							class="form-control" id="expressao" name="expressao">
							<c:forEach items="${expressoesFaciais}" var="expressaoFacial">
								<option value="${expressaoFacial.idExpressaoFacial}"
									${expressaoFacial.idExpressaoFacial == sinal.expressaoFacial.idExpressaoFacial ? 'selected' : ''}>
									${expressaoFacial.nome}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<img class="img-responsive center-block"
							src="${pageContext.request.contextPath}/resources/img/${sinal.foto}" />
						<label for="foto">Foto:</label> <input type="file"
							class="form-control" name="foto" id="foto" placeholder="Foto"
							accept="image/*">
					</div>

					<div class="form-group">
						<div class="center-block video-size-execucao">
							<div class="video-container video">
								<video id="videoGravado" muted="" loop autoplay=""
									src="${pageContext.request.contextPath}/resources/videos/${sinal.video}"></video>
							</div>
						</div>
						<label for="video">Video:</label> <input type="file"
							class="form-control" name="video" id="video" placeholder="V�deo"
							accept="video/*">
					</div>

					<div class="form-group">
						<label for="categoria">Categoria:</label> <input type="text"
							value="${sinal.categoria}" required class="form-control"
							name="categoria" id="categoria" placeholder="Categoria">
					</div>

					<c:set var="dificuldades" value="F�cil,M�dia,Dif�cil"
						scope="application" />
					<div class="form-group">
						<label for="dificuldade">Dificuldade:</label> <select
							class="form-control" id="dificuldade" name="dificuldade">

							<c:forEach items="${fn:split(dificuldades, ',')}"
								var="dificuldade">
								<option value="${dificuldade}"
									${sinal.dificuldade == dificuldade ? 'selected' : ''}>${dificuldade}</option>
							</c:forEach>

						</select>
					</div>
					<button type="submit"
						class="bg-black color-white pull-right btn btn-default">Alterar
						Sinal</button>
				</form>
			</div>
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
					<h4 class="modal-title" id="myModalLabel">Alterar Sinal</h4>
				</div>
				<div class="modal-body">Confirma as altera��es?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">N�o</button>
					<button type="button" class="btn btn-primary"
						onclick="alterarSinal()">Sim</button>
				</div>
			</div>
		</div>
	</div>
	<c:import url="rodape.jsp" />
	<script>
		$( document ).ready(function() {
			exibeBlocoUtilizacaoDasMaos();
			
			var utilizacaoDasMaos = $("#utilizacaoDasMaos").val();
			if(utilizacaoDasMaos == 'SOMENTE_UMA_MAO' || utilizacaoDasMaos == 'DUAS_MAOS_PARAMETROS_IGUAIS'){
				console.log("teste");
				excluiParametro($("#excluiConfigMao2")[0]);
				excluiParametro($("#excluiPontoArticulacao2")[0]);
				excluiParametro($("#excluiMovimento2")[0]);
			}else{
				$("#excluiConfigMao2").show();
				$("#excluiPontoArticulacao2").show();
				$("#excluiMovimento2").show();
			}
				
		});
	
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
// 							if (verficarExistencia($(
// 									"#" + idInputModal + idOpcaoClicada).val())) {
// 								//alert('existe');
// 								$("#tituloModalErro").text(
// 										"Par�metro j� selecionado");
// 								$("#conteudoModalErro")
// 										.text(
// 												"Este parametro j� est� selecionado, por favor selecione outro!");
// 								$("#modalErro").modal('show');
// 								return;
// 							}

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
// 							var idOpcaoClicada = parseInt((this.id).substring(
// 									((this.id).length) - 1, (this.id).length));
// 							var nomeOpcaoClicada = (this.id).substring(6,
// 									((this.id).length) - 1);

// 							definirNomeNoTitle(nomeOpcaoClicada);

// 							$("#img" + nomeOpcaoClicada + idOpcaoClicada)
// 									.attr("src",
// 											"${pageContext.request.contextPath}/resources/img/mais.png");
// 							$("#img" + nomeOpcaoClicada + idOpcaoClicada).attr(
// 									"title",
// 									"Clique para adicionar " + nomeNoTitle);
// 							$("#" + nomeInput + idOpcaoClicada).val("");
// 							$("#exclui" + nomeExclui + idOpcaoClicada).hide();
							console.log(this);
							excluiParametro(this);
						});
		
		
		function excluiParametro(elementoClicado){
			var idOpcaoClicada = parseInt((elementoClicado.id).substring(
					((elementoClicado.id).length) - 1, (elementoClicado.id).length));
			var nomeOpcaoClicada = (elementoClicado.id).substring(6,
					((elementoClicado.id).length) - 1);

			definirNomeNoTitle(nomeOpcaoClicada);

			$("#img" + nomeOpcaoClicada + idOpcaoClicada)
					.attr("src",
							"${pageContext.request.contextPath}/resources/img/mais.png");
			$("#img" + nomeOpcaoClicada + idOpcaoClicada).attr(
					"title",
					"Clique para adicionar " + nomeNoTitle);
			$("#" + nomeInput + idOpcaoClicada).val("");
			$("#exclui" + nomeExclui + idOpcaoClicada).hide();
		}

		function definirNomeNoTitle(parametroClicado) {
			if (parametroClicado == 'ConfigMao') {
				nomeNoTitle = 'configura��o de m�o';
				nomeInput = 'configuracaoDeMao';
				nomeExclui = 'ConfigMao';
				idOpcaoModal = 'img-config-mao-';
				idInputModal = 'idConfigMao';
				quantidadeParametro = 4;
				idModal = 'modalConfigMao';
			} else if (parametroClicado == 'PontoArticulacao') {
				nomeNoTitle = 'ponto de articula��o';
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
		
		function exibeBlocoUtilizacaoDasMaos(){
			$("input[name='utilizacoesDasMaos']").each(function() {
				var id = this.id;
				var checked = $("#"+id).prop('checked');
				if(checked){
					var value = $("#"+id).val();
					$("#utilizacaoDasMaos").val(value);
					if(value == 'SOMENTE_UMA_MAO' || value == 'DUAS_MAOS_PARAMETROS_IGUAIS'){
						$("#bloco-maoSecundaria").hide();
						$(".maoSecundaria").val("");
					}else{
						$("#bloco-maoSecundaria").show();
					}
				}
			});
		}

		function cadastrar() {
			alert(validar());
		}

		//validar se existe pelo menos uma op��o selecionada
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

		//false se tiver repeti��o
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

		function alterarSinal() {
			$("#formAlterarSinal").submit();
		}
		
		function selecionouQuantidadeDeMaos(){
			var result = false;
			$("input[name='utilizacoesDasMaos']").each(function() {
				var id = this.id;
				var checked = $("#"+id).prop('checked');
				if(checked){
					result =  true;
				}
			});
			return result;
		}
		
		function validaCamposMao(listaParametros,idMao){
			console.log("function validaCamposMao");
			for (i = 0; i < listaParametros.length; i++) {
				console.log("value i="+i+" -> "+$("#"+listaParametros[i]+idMao).val());
				if($("#"+listaParametros[i]+idMao).val() == ''){
					return false;
				}
			}
			return true;
		}
		
		function validarCamposObrigatorios(){
			console.log("entrou na function validarCamposObrigatorios");
			//validar campo utilizacao das maos
			var resultado = false;
			$("input[name='utilizacoesDasMaos']").each(function() {
				console.log("foreach de utilizacoesDasMaos id: "+this.id);
				var id = this.id;
				var checked = $("#"+id).prop('checked');
				var idsParametros = ["configuracaoDeMao","pontoDeArticulacao","movimento","orientacao"];
				if(checked){
					var value = $("#"+id).val();
					console.log("checked true value: "+value);
					$("#utilizacaoDasMaos").val(value);
					if(((value == 'SOMENTE_UMA_MAO' || value == 'DUAS_MAOS_PARAMETROS_IGUAIS')
							&& validaCamposMao(idsParametros,'1')) ||
							(value == 'DUAS_MAOS_PARAMETROS_DIFERENTES' && validaCamposMao(idsParametros,'1')
							&& validaCamposMao(idsParametros,'2'))){
						resultado = true;
					}
				}
			});
			return resultado;
		}

		$("#formAlterarSinal")
				.submit(
						function() {
							if (/*defineQuantidadeParametro("configuracaoDeMao",
									4, "qtdConfiguracaoDeMao") > 0
									&& defineQuantidadeParametro(
											"pontoDeArticulacao", 4,
											"qtdPontoDeArticulacao") > 0
									&& defineQuantidadeParametro("movimento",
											4, "qtdMovimento") > 0
									&&*/ selecionouQuantidadeDeMaos()
									&& validarCamposObrigatorios()) {
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
								//alert("Existem campos vazios. Por favor, preencha todos os campos!");
								return false;
							}
							$('#myModal').modal('show');
							return false;
						});
	</script>
</body>
</html>