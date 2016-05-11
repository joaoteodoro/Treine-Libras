<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Glosário</title>
	<meta name="description" content="" />
	<c:import url="imports.jsp" />
	<script>
		$(function() {
			$( "#accordion" ).accordion({
				heightStyle: "content"
			});
		});
	</script>
	
	</head>
	
	<body style="background-color:gray">
		<c:import url="menu.jsp">
			<c:param name="paginaAtual" value="glosario"/>
		</c:import>
		<div class="container" style="background-color: white;">
			<br/>
			<br/>
			<div class="alinhamento-esquerdo">
				<h2><b>Sinais executados por intérpretes</b></h2>
				<br/>
				<br/>
			</div>
			<div class="row">
				<div class="center-block box-page-geral">
					<div id="accordion">
						<h3>Categoria A</h3>
						<div>
							<div class="center-block">
								<c:forEach items="${sinais}" var="sinal">
									<a href="mostraSinal?id=${sinal.idSinal}">
										<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
											<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
												<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/img1.jpg"/>
											</div>
											<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
												<h4>${sinal.nome}</h4>
												<div class="sinal-dificuldade">
													${sinal.dificuldade}
												</div>
												<div class="estrela-nota-sinal">
													<img class="" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
													<img class="" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
													<img class="" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
													<img class="" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
													<img class="" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
												</div>
											</div>
										</div>
									</a>
								</c:forEach>
							</div>
						</div>
						<h3>Categoria B</h3>
						<div>
							<div class="center-block">
								<a href="lista-gravacoes-sinal.html"> 
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
						<h3>Categoria C</h3>
						<div>
							<div class="center-block">
								<a href="lista-gravacoes-sinal.html"> 
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
						<h3>Categoria D</h3>
						<div>
							<div class="center-block">
								<a href="lista-gravacoes-sinal.html"> 
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
								<a href="lista-gravacoes-sinal.html">
									<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
										<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
											<img class="img-sinal-libras img-responsive center-block" src="img/img1.jpg"/>
										</div>
										<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
											<h4><b>Nome do sinal</b></h4>
											<div class="sinal-dificuldade">
												FÁCIL
											</div>
											<div class="estrela-nota-sinal">
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
												<img class="" src="img/estrela-cheia-amarela.png"/>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>