<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Bem vindo(a), $(usuarioLogado.nome)</title>
	<meta name="description" content="" />
	<c:import url="imports.jsp" />
</head>
	
	<body>
		<c:import url="menu.jsp">
			<c:param name="paginaAtual" value="index"/>
		</c:import>
		<div class="container" style="background-color: white;">
			<br/>
			<br/>
			<div class="alinhamento-esquerdo">
				<h2><b>Seja bem vindo(a), ${usuarioLogado.nome}.</b></h2>
				<br/>
				<br/>
				<h3><b>Melhores avaliações!</b></h3>
				<h4>
				<c:choose>
					 <c:when test="${empty melhoresAvaliacoes}">
					 	Você ainda não recebeu avaliações. Enquanto isso, represente alguns sinais em LIBRAS acessando o menu <b>Exercícios</b>!
					 </c:when>
					 <c:otherwise>
					 	Avalie estes sinais representados por outros usuários.
					 </c:otherwise>
				</c:choose>
				</h4>
			</div>
			<script>
				var listaIdSinaisMelhores = new Array();
				var listaIdSinaisPiores = new Array();
			</script>
			<div class="center-block box-pag-home">
				<c:forEach items="${melhoresAvaliacoes}" var="sinal">
					<a href="listarUsuariosPorGravacao?idSinal=${sinal.idSinal}">
						<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras">
							<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
								<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/${sinal.foto}"/>
							</div>
							<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
								<h4><b>${sinal.nome}</b></h4>
								<p>${sinal.categoria}</p>
								<div class="sinal-dificuldade">
									${sinal.dificuldade}
								</div>
								<div class="estrela-nota-sinal"  id="melhores-estrelas-nota-${sinal.idSinal}">
								</div>
								<script>
									listaIdSinaisMelhores.push('${sinal.idSinal}');
								</script>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			
			
			<div class="alinhamento-esquerdo">
				<br/>
				<br/>
				<h3><b>Piores avaliações!</b></h3>
				<h4>
				<c:choose>
					 <c:when test="${empty melhoresAvaliacoes}">
					 	Você ainda não recebeu avaliações. Enquanto isso, represente alguns sinais em LIBRAS acessando o menu <b>Exercícios</b>!
					 </c:when>
					 <c:otherwise>
					 	Execute novamente estes sinais para que possam ser melhores avaliados.
					 </c:otherwise>
				</c:choose>
				</h4>
			</div>
			<div class="center-block box-pag-home">
				<c:forEach items="${pioresAvaliacoes}" var="sinal">
					<a href="executarSinal?id=${sinal.idSinal}">
						<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-sinal-libras">
							<div class="img-responsive box-img-sinal-libras col-sm-4 col-xs-4">
								<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/${sinal.foto}"/>
							</div>
							<div class="col-sm-8 col-xs-8 text-center box-sinal-descricao">
								<h4><b>${sinal.nome}</b></h4>
								<p>${sinal.categoria}</p>
								<div class="sinal-dificuldade">
									${sinal.dificuldade}
								</div>
								<div class="estrela-nota-sinal"  id="piores-estrelas-nota-${sinal.idSinal}">
								</div>
								<script>
									listaIdSinaisPiores.push('${sinal.idSinal}');
								</script>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<script>
			$( document ).ready(function() {
				for (i = 0; i < listaIdSinaisMelhores.length; i++) {
					carregarEstrelas(listaIdSinaisMelhores[i],'melhores');
				}
				for (i = 0; i < listaIdSinaisPiores.length; i++) {
					carregarEstrelas(listaIdSinaisPiores[i],'piores');
				}
			});
		
			function carregarEstrelas(id, melhorPior){
				$.post("calculaNota",{'id' : id}, function(resposta){
					$("#"+melhorPior+"-estrelas-nota-"+id).html(resposta);
				});
			};
		</script>
	</body>
</html>