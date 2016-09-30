<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<c:param name="paginaAtual" value="sinais" />
	</c:import>
	<div class="container" style="background-color: white;">
		<br /> <br />
		<div class="alinhamento-esquerdo">
			<h2>
				<b>Unidades</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">

				<a href="cadastrarUnidadeAntes">Adicionar nova unidade</a> <br /> <br />
				<table id="tabela" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Unidade</th>
							<th>Nome</th>
							<th>Gerenciar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${unidades}" var="unidade">
							<tr>
								<td>${unidade.numero}</td>
								<td>${unidade.nome}</td>
								<td>
									<div class="gerenciar">
										<a title="Alterar sinal"
											href="alterarUnidadeAntes?id=${unidade.id}"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/editar.png" /></a>
										<a title="Remover sinal"
											onclick="setidUnidadeGerenciando(${unidade.id})"
											data-toggle="modal" data-target="#modalExcluir"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/lixeira.png" /></a>
										<a title="Ver sinais desta unidade"
											onclick="listarSinaisPorUnidade?id=(${unidade.id})"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/mais.png" /></a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
					<div class="modal-body">Deseja realmente excluir esta
						Unidade? Todos os sinais relacionados a esta unidade serão
						excluídos.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
						<button type="button" class="btn btn-primary"
							onclick="excluirUnidade()">Sim</button>
					</div>
				</div>
			</div>
		</div>

		<%-- <div class="center-block box-externo-principal">
				<c:forEach items="${unidades}" var="unidade">
					<a href="listaSinaisPorUnidade?unidade=${unidade.id}"> 
						<div class="col-sm-offset-0 col-sm-6 col-md-3 col-xs-offset-1 col-xs-10 box-unidade">
							<div>
								<h2 class="center-block"><b>Unidade ${unidade.nome}</b></h2>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
				
			<br/><br/><br/><br/><br/> --%>
	</div>
	<c:import url="rodape.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js">
	</script>
	<script>
		var idUnidadeGerenciando;
		
		function setidUnidadeGerenciando(idSinal){
			idUnidadeGerenciando = idSinal;
		}
		
		function excluirSinal(){
			console.log("idUnidadeGerenciando: "+idUnidadeGerenciando);
			$.post("removerUnidade",{'id' : idUnidadeGerenciando}, function(resposta){
				//window.location.replace("listarSinais");
				location.reload();
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