<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Área do administrador</title>
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
				<b>Área do Administrador</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="col-md-4">
				<a href="configuracoesDeMao">
					<div class="box-unidade">
						<div class="col-md-3">
							<img class="img-sinal-libras img-responsive center-block"
								src="${pageContext.request.contextPath}/resources/img/configMao10.png" />
						</div>
						<div class="col-md-9">
							<h3 class="margin-zero line-40">
								<b>Configurações de Mão</b>
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
								src="${pageContext.request.contextPath}/resources/img/pontoArticulacao.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="margin-zero line-40">
								<b>Pontos de Articulação</b>
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
								src="${pageContext.request.contextPath}/resources/img/movimento.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="margin-zero line-80">
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
								src="${pageContext.request.contextPath}/resources/img/expressaoFacial.jpg" />
						</div>
						<div class="col-md-9">
							<h3 class="margin-zero line-80">
								<b>Expressões Faciais</b>
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
								src="${pageContext.request.contextPath}/resources/img/unidade.png" />
						</div>
						<div class="col-md-9">
							<h3 class="margin-zero line-80">
								<b>Unidades/Sinais</b>
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
								src="${pageContext.request.contextPath}/resources/img/professor.png" />
						</div>
						<div class="col-md-9">
							<h3 class="margin-zero line-80">
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
								src="${pageContext.request.contextPath}/resources/img/alunos.png" />
						</div>
						<div class="col-md-9">
							<h3 class="margin-zero line-80">
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