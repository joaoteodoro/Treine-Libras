<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Glosário</title>
<meta name="description" content="" />
<c:import url="imports.jsp" />
</head>

<body>
	<c:import url="menu.jsp">
		<c:param name="paginaAtual" value="glossario" />
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
			<div class="center-block video-size-execucao">
				<div class="video-container video">
					<video id="recorded" controls>
						<source
							src="${pageContext.request.contextPath}/resources/videos/${sinal.video}"
							type="video/webm;codecs=&quot;vp8, vorbis&quot;">
					</video>
				</div>
			</div>
			<br /> <br />
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
							<b>Orientação:</b> ${sinal.orientacao}
						</div>
						<div class="linha-box-avaliacao linha-caracteristica">
							<b>Expressão facial:</b> ${sinal.expressaoFacial.nome}
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="box-execucao-sinal">
					<br /> <br />
					<p class="text-center">
						<a href="executarSinal?id=${sinal.idSinal}"><u>Executar
								este sinal</u></a>
					</p>
				</div>

			</div>
		</div>
	</div>
	<c:import url="rodape.jsp" />
</body>
</html>