<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="barra-menu">
	<nav class="navbar navbar-default navbar-libras menu center-block">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				  <span class="sr-only">Toggle navigation</span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Treine Libras</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<c:choose>
						<c:when test="${param.paginaAtual == 'index'}">
							<li class="active"><a href="index">HOME</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="index">HOME</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.paginaAtual == 'exercicios'}">
							<li class="active"><a href="exercicios.html">EXERCÍCIOS</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="exercicios.html">EXERCÍCIOS</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.paginaAtual == 'glosario'}">
							<li class="active"><a href="listaSinais">GLOSÁRIO</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="listaSinais">GLOSÁRIO</a></li>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${param.paginaAtual == 'avaliar'}">
							<li class="active"><li><a href="avaliar.html">AVALIAR</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="avaliar.html">AVALIAR</a></li>
						</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
		</div>
	</nav>
</div>