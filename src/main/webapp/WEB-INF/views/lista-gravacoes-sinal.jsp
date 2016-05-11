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
				<h2><b>Gravações do sinal "nome do sinal"</b></h2>
				<br/>
				<br/>
				<p>Selecione uma dessas gravações para avaliar!</p>
			</div>
			<div class="row">
				<div class="center-block box-page-geral">
					<table class="table table-striped"> 
						<thead> 
							<tr> 
								<th>Usuário</th> 
								<th>Avaliação atual</th> 
							</tr> 
						</thead> 
						<tbody> 
							<tr> 
								<td><a href="avaliar-sinal.html">joaoteodoro</a></td> 
								<td>
									<img class="estrela-avaliacao" src="img/estrela-cheia-amarela.png"/>
									<img class="estrela-avaliacao" src="img/estrela-cheia-amarela.png"/>
									<img class="estrela-avaliacao" src="img/estrela-cheia-amarela.png"/>
									<img class="estrela-avaliacao" src="img/estrela-cheia-amarela.png"/>
									<img class="estrela-avaliacao" src="img/estrela-vazia.png"/>
								</td> 
							</tr>
							<tr> 
								<td><a href="avaliar-sinal.html">laerciolima</a></td> 
								<td>
									<img class="estrela-avaliacao" src="img/estrela-cheia-amarela.png"/>
									<img class="estrela-avaliacao" src="img/estrela-cheia-amarela.png"/>
									<img class="estrela-avaliacao" src="img/estrela-cheia-amarela.png"/>
									<img class="estrela-avaliacao" src="img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="img/estrela-vazia.png"/>
								</td> 
							</tr>
							<tr> 
								<td><a href="avaliar-sinal.html">victorsobreira</a></td> 
								<td>
									<img class="estrela-avaliacao" src="img/estrela-cheia-amarela.png"/>
									<img class="estrela-avaliacao" src="img/estrela-cheia-amarela.png"/>
									<img class="estrela-avaliacao" src="img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="img/estrela-vazia.png"/>
									<img class="estrela-avaliacao" src="img/estrela-vazia.png"/>
								</td> 
							</tr>
						</tbody> 
					</table>
				</div>
			</div>
		</div>
	</body>
</html>