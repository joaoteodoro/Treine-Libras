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
					<video id="recorded" muted="" loop autoplay="">
						<source
							src="${pageContext.request.contextPath}/resources/videos/${sinal.video}"
							type="video/webm;codecs=&quot;vp8, vorbis&quot;">
					</video>
				</div>
			</div>
			<br /> <br />
			<div class="col-md-6">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th colspan="3"><p align="center">CARACTERÍSTICAS DESTE SINAL</p></th>
						<tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3" class="destaque-tabela" align="center">
								${sinal.utilizacaoDasMaos.descricao}
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td class="destaque-tabela" align="center">Mão Principal</td>
							<td class="destaque-tabela">
								<c:if test="${sinal.maoSecundaria != null }">
									Mão Secundária
								</c:if>
							</td>
						</tr>
						<tr title="Configuração de Mão">
							<td class="destaque-tabela">CF</td>
							<td>${sinal.maoPrincipal.configuracaoDeMao.nome}</td>
							<td>${sinal.maoSecundaria.configuracaoDeMao.nome}</td>
						</tr>
						<tr title="Ponto de Articulação">
							<td class="destaque-tabela">PA</td>
							<td>${sinal.maoPrincipal.pontoDeArticulacao.nome}</td>
							<td>${sinal.maoSecundaria.pontoDeArticulacao.nome}</td>
						</tr>
						<tr title="Movimento">
							<td class="destaque-tabela">MV</td>
							<td>${sinal.maoPrincipal.movimento.nome}</td>
							<td>${sinal.maoSecundaria.movimento.nome}</td>
						</tr>
						<tr title="Orientação">
							<td class="destaque-tabela">OR</td>
							<td>${sinal.maoPrincipal.orientacao.descricao}</td>
							<td>${sinal.maoSecundaria.orientacao.descricao}</td>
						</tr>
						<tr title="Expressão Facial">
							<td class="destaque-tabela">EF</td>
							<td colspan="2" align="center">${sinal.expressaoFacial.nome}</td>
						</tr>
					</tbody>
				</table>
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