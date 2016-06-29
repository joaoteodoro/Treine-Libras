<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Avaliar</title>
<meta name="description" content="" />
<c:import url="imports.jsp" />
</head>

<body>
	<c:import url="menu.jsp">
		<c:param name="paginaAtual" value="sinais" />
	</c:import>
	<div class="container" style="background-color: white;">
		<div class="alinhamento-esquerdo">
		<br/>
		<br/>
		<h2><b>Sinais cadastrados</b></h2>
		<br/>
		<br/>
		</div>
		<div class="row">
			<div class="center-block box-page-geral">
			
				<a href="cadastrarSinalAntes">Adiiconar novo sinal</a>
				<br/>
				<br/>
				<table id="tabela" class="display">
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
								<td>
									${sinal.nome}
								</td>
								<td>
									${sinal.categoria}
								</td>
								<td><a
									href="mostraSinal?idSinal=${sinal.idSinal}">Alt</a>
									<a
									href="removerSinal?idSinal=${sinal.idSinal}">Remov.</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/datatables.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/datatables.min.css" />
	<script>
	$('#tabela')
	.dataTable(
			{
				bJQueryUI : true,

				oLanguage : {
					sEmptyTable : "Nenhum registro encontrado",
					sInfo : "Apresentando _END_ sinais. Total de sinais cadastrados: _TOTAL_",
					sInfoEmpty : "Mostrando 0 até 0 de 0 registros",
					sInfoFiltered : "(Filtrados de _MAX_ registros)",
					sInfoPostFix : "",
					sInfoThousands : ".",
					sLengthMenu : "Qtd sinais apresentados por pág: _MENU_",
					sLoadingRecords : "Carregando...",
					sProcessing : "Processando...",
					sZeroRecords : "Nenhum registro encontrado",
					sSearch : "Buscar sinal",
					oPaginate : {
						sNext : "Próximo",
						sPrevious : "Anterior",
						sFirst : "Primeiro",
						sLast : "Último"
					},
					oAria : {
						sSortAscending : ": Ordenar colunas de forma ascendente",
						sSortDescending : ": Ordenar colunas de forma descendente"
					}
				}
			});
	</script>
</body>
</html>