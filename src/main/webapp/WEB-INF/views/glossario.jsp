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
	
	<body>
		<c:import url="menu.jsp">
			<c:param name="paginaAtual" value="glossario"/>
		</c:import>
		<div class="container" style="background-color: white;">
			<br/>
			<br/>
			<div class="alinhamento-esquerdo">
				<h2><b>Sinais executados por intérpretes</b></h2>
				<br/>
				<br/>
			</div>
			<script>
				var listaIdSinais = new Array();
			</script>
			<div class="row">
				<div class="center-block box-page-geral">
					<div id="accordion">
						
						<c:forEach items="${categorias}" var="categoria">
							<h3>${categoria.key}</h3>
							<div>
								<div class="center-block">
									<c:forEach items="${categoria.value}" var="sinal">
										<a href="mostraSinal?id=${sinal.idSinal}">
											<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras-simples">
												<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
													<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/${sinal.foto}"/>
												</div>
												<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
													<h4>${sinal.nome}</h4>
													<div class="sinal-dificuldade">
														${sinal.dificuldade}
													</div>
													<div class="estrela-nota-sinal"  id="estrelas-nota-${sinal.idSinal}">
													</div>
													<script>
														listaIdSinais.push('${sinal.idSinal}');
													</script>
												</div>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<c:import url="rodape.jsp" />
		<script>
			$( document ).ready(function() {
				for (i = 0; i < listaIdSinais.length; i++) {
					carregarEstrelas(listaIdSinais[i]);
				}
			});
		
			function carregarEstrelas(id){
				$.post("calculaNota",{'id' : id}, function(resposta){
					$("#estrelas-nota-"+id).html(resposta);
				});
			};
		</script>
	</body>
</html>