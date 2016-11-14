<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - �rea do administrador</title>
<meta name="description" content="" />
<c:import url="imports.jsp" />
</head>

<body>
	<c:import url="menu.jsp">
		<c:param name="paginaAtual" value="sinais" />
	</c:import>
	<div class="container" style="background-color: white;">
		<br /> <br />
		<div class="alinhamento-esquerdo">
			<h2>
				<b>�rea do Administrador</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="col-md-4">
				<a href="configuracoesDeMao">
					<div class="box-unidade">
						<div class="col-md-3">
							<img class="img-sinal-libras img-responsive center-block"
								src="${pageContext.request.contextPath}/resources/img/img1.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="center-block">
								<b>Configura��es de M�o</b>
							</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="pontosDeArticulacao">
					<div class="box-unidade">
						<div class="col-md-3">
							<img class="img-sinal-libras img-responsive center-block"
								src="${pageContext.request.contextPath}/resources/img/img1.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="center-block">
								<b>Pontos de Articula��o</b>
							</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="movimentos">
					<div class="box-unidade">
						<div class="col-md-3">
							<img class="img-sinal-libras img-responsive center-block"
								src="${pageContext.request.contextPath}/resources/img/img1.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="center-block">
								<b>Movimentos</b>
							</h3>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<a href="expressoesFaciais">
					<div class="box-unidade">
						<div class="col-md-3">
							<img class="img-sinal-libras img-responsive center-block"
								src="${pageContext.request.contextPath}/resources/img/img1.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="center-block">
								<b>Express�es Faciais</b>
							</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="unidades">
					<div class="box-unidade">
						<div class="col-md-3">
							<img class="img-sinal-libras img-responsive center-block"
								src="${pageContext.request.contextPath}/resources/img/img1.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="center-block">
								<b>Unidades</b>
							</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="professores">
					<div class="box-unidade">
						<div class="col-md-3">
							<img class="img-sinal-libras img-responsive center-block"
								src="${pageContext.request.contextPath}/resources/img/img1.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="center-block">
								<b>Professores</b>
							</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="alunos">
					<div class="box-unidade">
						<div class="col-md-3">
							<img class="img-sinal-libras img-responsive center-block"
								src="${pageContext.request.contextPath}/resources/img/img1.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="center-block">
								<b>Alunos</b>
							</h3>
						</div>
					</div>
				</a>
			</div>
		</div>
		<br /> <br /> <br /> <br /> <br />
	</div>
	<c:import url="rodape.jsp" />
</body>
</html>