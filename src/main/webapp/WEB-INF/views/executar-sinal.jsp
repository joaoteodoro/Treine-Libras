<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Exercícios</title>
	<meta name="description" content="" />
	<c:import url="imports.jsp" />
	</head>
	
	<body style="background-color:gray">
		<c:import url="menu.jsp">
			<c:param name="paginaAtual" value="exercicios"/>
		</c:import>
		<div class="container" style="background-color: white;">
			<br/>
			<br/>
			<div class="alinhamento-esquerdo">
				<h2><b>Nome do Sinal</b></h2>
				<br/>
				<br/>
			</div>
			<div class="row">
				<div class="center-block video-size-execucao">
					<div class="video-container video">
						<video id="gum" autoplay="" muted="" src="blob:http%3A//localhost/609470af-b833-448b-9b7f-2a72dbeab7ed"></video>
						<video id="recorded" autoplay="" loop="" controls="" src="blob:http%3A//localhost/e6a72d19-04af-4335-b74d-7989001f3bf2"></video>
					</div>
					<div>
					  <button id="record">Start Recording</button>
					  <button id="play">Play</button>
					  <button id="download">Download</button>
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
								<b>Configuração de Mão:</b> mão aberta
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Ponto de articulação:</b> na testa
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Movimento:</b> não tem
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Orientação:</b> para frente
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Expressão facial:</b> alegre
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="box-execucao-sinal">
						<button class="center-block bg-black color-white">Enviar</button>
						<br/>
						<p class="text-center">
							<a href="sinal-interprete.html"><u>Veja este sinal sendo executado por um intérprete.</u></a>
						</p>
					</div>
					
				</div>
			</div>
		</div>
	</body>
	<object id="5a08bb68-f9fa-9794-39ea-3bab1b95a09c" width="0" height="0" type="application/gas-events-cef"></object>
</html>