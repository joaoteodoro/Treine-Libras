<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Avaliar</title>
	<meta name="description" content="" />
	<c:import url="imports.jsp" />
	</head>
	
	<body style="background-color:gray">
		<c:import url="menu.jsp">
			<c:param name="paginaAtual" value="avaliar"/>
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
				<div class="col-md-6">
					<div class="video-container video col-md-offset-1 col-md-10">
						<video id="recorded" controls="" src="../../resources/videos/video.webm"></video>
					</div>
				</div>
				<div class="col-md-6">
					<div class="video-container video col-md-offset-1 col-md-10">
						<video id="recorded" controls="" src="../../resources/videos/video.webm"></video>
					</div>
				</div>
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
					<div class="box-comum-avaliacao-sinal col-md-11">
						<div class="cabecalho-box-comum-avaliacao text-center">
							<h4><b>Sua avaliação</b></h4>
						</div>
						<div class="catacteristicas-sinal">
							<div class="linha-box-avaliacao linha-avaliacao">
								<div class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
									CF
								</div>
								<div class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
								</div>
								
							</div>
							<div class="linha-box-avaliacao linha-avaliacao">
								<div class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
									PA
								</div>
								<div class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
								</div>
								
							</div>
							<div class="linha-box-avaliacao linha-avaliacao">
								<div class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
									M
								</div>
								<div class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
								</div>
								
							</div>
							<div class="linha-box-avaliacao linha-avaliacao">
								<div class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
									O
								</div>
								<div class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
								</div>
								
							</div>
							<div class="linha-box-avaliacao linha-avaliacao">
								<div class="col-md-2 col-sm-2 col-xs-2 text-center icone-caracteristica">
									EF
								</div>
								<div class="col-md-offset-2 col-md-7 col-sm-offset-2 col-sm-7 col-xs-offset-1 col-xs-8 avaliacao-caracteristica">
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="../../resources/img/estrela-vazia.png"/>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="comentario box-comum-avaliacao-sinal">
						<p>Comentário:</p>
						<textarea class="form-control" rows="5" id="comment"></textarea>
						
						<button class="pull-right">Enviar</button>
					</div>
				</div>				
			</div>
		</div>
	</body>
</html>