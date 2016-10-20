<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Avaliar</title>
<meta name="description" content="" />
<c:import url="imports.jsp" />
</head>

<body>
	<c:import url="menu.jsp">
		<c:param name="paginaAtual" value="avaliar" />
	</c:import>
	<div class="container" style="background-color: white;">
		<br /> <br />
		<div class="alinhamento-esquerdo">
			<h2>
				<b>${sinal.nome}</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="video-container video col-md-offset-1 col-md-10">
					<video id="recorded" muted="" loop autoplay=""
						src="${pageContext.request.contextPath}/resources/videos/${sinal.video}"></video>
				</div>
			</div>
			<div class="col-md-6" style="padding-bottom: 60px;">
				<div
					class="video-usuario video-container video col-md-offset-1 col-md-10">
					<video muted="" loop autoplay=""
						src="${pageContext.request.contextPath}/resources/videos/${gravacao.video}"></video>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box-comum-avaliacao-sinal col-md-11">
					<div class="cabecalho-box-comum-avaliacao text-center">
						<h4>
							<b>Caracteristicas deste sinal</b>
						</h4>
					</div>
					<div class="catacteristicas-sinal">
						<div class="linha-box-avaliacao linha-caracteristica">
							<b>Configuracao de Mao:</b>

							<div class="configuracoesDeMao">
								<c:forEach items="${sinal.configuracoesDeMao}"
									var="configuracaoDeMao" varStatus="status">
									<div id="configMao${status.count}" class="parametro">
										<img id="imgConfigMao${status.count}" class="imgParametro"
											src="${pageContext.request.contextPath}/resources/img/${configuracaoDeMao.imagem}"
											data-target="#modalConfigMao" data-toggle="modal"
											title="${configuracaoDeMao.nome}" />
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="linha-box-avaliacao linha-caracteristica">
							<b>Ponto de articulacaoo:</b>

							<div class="pontosDeArticulacao">
								<c:forEach items="${sinal.pontosDeArticulacao}"
									var="pontoDeArticulacao" varStatus="status">
									<div id="pontoArticulacao${status.count}" class="parametro">
										<img id="imgPontoArticulacao${status.count}"
											class="imgParametro"
											src="${pageContext.request.contextPath}/resources/img/${pontoDeArticulacao.imagem}"
											data-target="#modalPontoArticulacao" data-toggle="modal"
											title="${pontoDeArticulacao.nome}" />
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="linha-box-avaliacao linha-caracteristica">
							<b>Movimento:</b>
							<div class="movimentos">
								<c:forEach items="${sinal.movimentos}" var="movimento"
									varStatus="status">
									<div id="mov${status.count}" class="parametro">
										<img id="imgMovimento${status.count}" class="imgParametro"
											src="${pageContext.request.contextPath}/resources/img/${movimento.imagem}"
											data-target="#modalMovimento" data-toggle="modal"
											title="${movimento.nome}" />
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="linha-box-avaliacao linha-caracteristica">
							<b>Orientação:</b> ${sinal.orientacao.descricao}
						</div>
						<div class="linha-box-avaliacao linha-caracteristica">
							<b>Expressão facial:</b> ${sinal.expressaoFacial.nome}
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box-comum-avaliacao-sinal col-md-11">
					<div class="cabecalho-box-comum-avaliacao text-center">
						<h4>
							<b>Sua avaliação</b>
						</h4>
					</div>
					<div class="catacteristicas-sinal">
						<div class="linha-box-avaliacao linha-avaliacao">
							<div
								class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
								CF</div>
							<div
								class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
								<img id="cf1" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="cf2" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="cf3" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="cf4" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="cf5" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
							</div>

						</div>
						<div class="linha-box-avaliacao linha-avaliacao">
							<div
								class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
								PA</div>
							<div
								class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
								<img id="pa1" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="pa2" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="pa3" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="pa4" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="pa5" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
							</div>

						</div>
						<div class="linha-box-avaliacao linha-avaliacao">
							<div
								class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
								M</div>
							<div
								class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
								<img id="mo1" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="mo2" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="mo3" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="mo4" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="mo5" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
							</div>

						</div>
						<div class="linha-box-avaliacao linha-avaliacao">
							<div
								class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
								O</div>
							<div
								class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
								<img id="or1" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="or2" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="or3" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="or4" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="or5" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
							</div>

						</div>
						<div class="linha-box-avaliacao linha-avaliacao">
							<div
								class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
								EF</div>
							<div
								class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
								<img id="ef1" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="ef2" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="ef3" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="ef4" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
								<img id="ef5" class="estrela-avaliacao es"
									src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="comentario box-comum-avaliacao-sinal">
					<!-- <p>Comentário:</p> -->
					<form id="adicionaAvaliacao" action="adicionaAvaliacao"
						method="post">
						<!-- <textarea class="form-control" rows="5" id="comentario"></textarea> -->
						<input type="hidden" id="notaConfiguracaoMao"
							name="notaConfiguracaoMao" /> <input type="hidden"
							id="notaPontoArticulacao" name="notaPontoArticulacao" /> <input
							type="hidden" id="notaMovimento" name="notaMovimento" /> <input
							type="hidden" id="notaOrientacao" name="notaOrientacao" /> <input
							type="hidden" id="notaExpressaoFacial" name="notaExpressaoFacial" />
						<input type="hidden" id="notaMedia" name="notaMedia" /> <input
							type="hidden" id="idGravacao" name="idGravacao"
							value="${gravacao.idGravacao}" />
					</form>


					<button class="pull-right" data-toggle="modal"
						data-target="#myModal">Enviar</button>
				</div>
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
					<h4 class="modal-title" id="myModalLabel">Avaliação</h4>
				</div>
				<div class="modal-body">Confirma a avalicação?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
					<button type="button" class="btn btn-primary"
						onclick="enviarAvaliacao()">Confirmar avaliação</button>
				</div>
			</div>
		</div>
	</div>
	<c:import url="rodape.jsp" />
	<script>
		$(".es")
				.click(
						function() {
							var idClicada = this.id;
							var nIdClicada = parseInt((this.id).substring(2, 3));
							var tipoClicada = (this.id).substring(0, 2);

							var nIdPosterior = nIdClicada + 1;
							var nIdAnterior = nIdClicada - 1;

							var idPosterior = "#" + tipoClicada + nIdPosterior
							var idAnterior = "#" + tipoClicada + nIdAnterior

							var corAnterior = $(idAnterior).attr("src");
							var corClicada = $(this).attr("src");
							var corPosterior = $(idPosterior).attr("src");

							if (corClicada.indexOf("vazia") != -1) {
								for (i = 1; i <= nIdClicada; i++) {
									$("#" + tipoClicada + i)
											.attr("src",
													"${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png");
								}
							} else {
								if (nIdClicada == 5) {
									for (i = 1; i < 6; i++) {
										$("#" + tipoClicada + i)
												.attr("src",
														"${pageContext.request.contextPath}/resources/img/estrela-vazia.png");
									}
								} else if (corPosterior.indexOf("amarela") != -1) {
									for (i = nIdPosterior; i < 6; i++) {
										$("#" + tipoClicada + i)
												.attr("src",
														"${pageContext.request.contextPath}/resources/img/estrela-vazia.png");
									}
								} else {
									for (i = 1; i <= nIdClicada; i++) {
										$("#" + tipoClicada + i)
												.attr("src",
														"${pageContext.request.contextPath}/resources/img/estrela-vazia.png");
									}
								}
							}
						});

		function enviarAvaliacao() {
			$("#notaConfiguracaoMao").val(pegarValor("cf"));
			$("#notaPontoArticulacao").val(pegarValor("pa"));
			$("#notaMovimento").val(pegarValor("mo"));
			$("#notaOrientacao").val(pegarValor("or"));
			$("#notaExpressaoFacial").val(pegarValor("ef"));

			var media = (pegarValor("cf") + pegarValor("pa") + pegarValor("mo")
					+ pegarValor("or") + pegarValor("ef")) / 5;

			$("#notaMedia").val(media);

			$("#adicionaAvaliacao").submit();
		}

		function pegarValor(parametro) {
			var nota = 0;
			for (i = 5; i > 0; i--) {
				if (($("#" + parametro + i).attr("src")).indexOf("amarela") != -1) {
					nota = i;
					break;
				}
			}
			return nota;
		}
	</script>
</body>
</html>