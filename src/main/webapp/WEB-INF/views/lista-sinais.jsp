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
			<br /> <br />
			<h2>
				<b>Sinais cadastrados</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">

				<a href="cadastrarSinalAntes">Adiiconar novo sinal</a> <br /> <br />
				<table id="tabela" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
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
								<td>
									<div class="gerenciar">
										<a title="Alterar sinal"
											href="mostraSinal?idSinal=${sinal.idSinal}"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/editar.png" /></a>
										<a title="Remover sinal"
											onclick="setidSinalGerenciando(${sinal.idSinal})" data-toggle="modal" data-target="#modalExcluir"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/lixeira.png" /></a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalExcluir" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Exclusão</h4>
				</div>
				<div class="modal-body">Deseja realmente excluir este sinal?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
					<button type="button" class="btn btn-primary"
						onclick="excluirSinal()">Sim</button>
				</div>
			</div>
		</div>
	</div>

	<c:import url="rodape.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
	<script>
		var idSinalGerenciando;
		
		function setidSinalGerenciando(idSinal){
			idSinalGerenciando = idSinal;
		}
		
		function excluirSinal(){
			console.log("idSinalGerenciando: "+idSinalGerenciando);
			$.post("removerSinal",{'idSinal' : idSinalGerenciando}, function(resposta){
				window.location.replace("listarSinais");
			});
		}
	
		$('#tabela')
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