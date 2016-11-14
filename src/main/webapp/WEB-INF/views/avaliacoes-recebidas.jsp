
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Avaliações recebidas</title>
<meta name="description" content="" />
<c:import url="imports.jsp" />
<script>
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content"
		});
	});
</script>

</head>

<body>
	<c:import url="menu.jsp">
		<c:param name="paginaAtual" value="exercicios" />
	</c:import>
	<div class="container" style="background-color: white;">
		<br /> <br />
		<div class="alinhamento-esquerdo">
			<h2>
				<b>Avaliações recebidas pelo aluno ${aluno.nome}</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">
				<div id="accordion">
					<c:forEach items="${unidadesSinaisNotas}" var="unidade">
						<h3>Unidade ${unidade.key.numero}</h3>
						<table id="tabela" class="table table-striped table-bordered"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>Sinal</th>
									<th>Nota atual</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${unidade.value}" var="sinal">
									<c:if test="${sinal.value != '' && sinal.value != null}">
										<tr>
											<td>${sinal.key.nome}</td>
											<td>${sinal.value}</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<c:import url="rodape.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js">
	</script>
	<script>
		$('.table')
				.dataTable(
						{
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