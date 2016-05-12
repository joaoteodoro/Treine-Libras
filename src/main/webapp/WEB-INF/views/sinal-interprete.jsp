<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Glosário</title>
	<meta name="description" content="" />
	<c:import url="imports.jsp" />
	</head>
	
	<body style="background-color:gray">
		<c:import url="menu.jsp">
			<c:param name="paginaAtual" value="glosario"/>
		</c:import>
		<div class="container" style="background-color: white;">
			<br/>
			<br/>
			<div class="alinhamento-esquerdo">
				<h2><b>${sinal.nome}</b></h2>
				<br/>
				<br/>
			</div>
			<div class="row">
				<div class="center-block video-size-execucao">
					<div class="video-container video">
						<video id="recorded" controls="" src="${pageContext.request.contextPath}/resources/videos/${sinal.video}"></video>
					</div>
				</div>
				<br/>
				<br/>
				<div class="col-md-6">
					<div class="box-comum-avaliacao-sinal col-md-11">
						<div class="cabecalho-box-comum-avaliacao text-center">
							<h4><b>Caracteristicas deste sinal</b></h4>
						</div>
						<div class="catacteristicas-sinal">
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Configuração de Mão:</b> 
								<c:forEach items="${sinal.configuracoesDeMao}" var="configuracaoDeMao">
									${configuracaoDeMao.nome}
								</c:forEach>
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Ponto de articulação:</b> ${sinal.pontoDeArticulacao.nome}
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Movimento:</b> 
								<c:forEach items="${sinal.movimentos}" var="movimento">
									${movimento.nome}
								</c:forEach>
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
						<br/>
						<br/>
						<p class="text-center">
							<a href="executar-sinal.html"><u>Executar este sinal</u></a>
						</p>
					</div>
					
				</div>
			</div>
		</div>
	</body>
</html>