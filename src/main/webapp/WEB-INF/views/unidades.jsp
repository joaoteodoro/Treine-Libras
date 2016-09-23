<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Unidades</title>
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
				<h2><b>Unidades</b></h2>
				<br/>
				<br/>
				<h4>Selecione uma das unidades para ver os sinais.</h4>
			</div>
			<div class="center-block box-externo-principal">
				<c:forEach items="${unidades}" var="unidade">
					<a href="listaSinaisPorUnidade?unidade=${unidade}"> 
						<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-unidade">
							<div>
								<h2 class="center-block"><b>Unidade ${unidade}</b></h2>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
				
			<br/><br/><br/><br/><br/>
		</div>
		<c:import url="rodape.jsp" />
	</body>
</html>