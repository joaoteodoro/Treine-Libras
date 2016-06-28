<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Cadastrar Sinal</title>
<meta name="description" content="" />
<c:import url="imports.jsp" />
</head>

<body style="background-color: gray">
	<c:import url="menu.jsp">
		<c:param name="paginaAtual" value="sinais" />
	</c:import>
	<div class="container" style="background-color: white;">
		<div class="row">
			<div class="center-block box-page-geral">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Sinal</th>
							<th>Categoria</th>
							<th>Gerenciar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sinais}" var="sinal">
							<tr>
								<td>${sinal.nome}</td>
								<td>${sinal.categoria}</td>
								<td><a href="removerSinal?id=${sinal.idSinal}">Rem.</a><a
									href="mostrarSinal?id=${sinal.idSinal}">Alt.</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<c:import url="rodape.jsp" />
</body>
</html>