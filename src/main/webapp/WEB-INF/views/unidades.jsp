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
							<th>Unidade atual</th>
							<th>Unidade</th>
							<th>Nome</th>
							<th>Gerenciar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${unidades}" var="unidade">
							<tr>
								<td><c:choose>
										<c:when test="${unidade.unidadeAtual}">
											<input id="defineUnidadeAtual${unidade.id}"
												name="defineUnidadeAtual${unidade.id}" type="checkbox"
												checked="checked" />
										</c:when>
										<c:otherwise>
											<input id="defineUnidadeAtual${unidade.id}"
												name="defineUnidadeAtual${unidade.id}" type="checkbox" />
										</c:otherwise>
									</c:choose></td>
								<td>${unidade.numero}</td>
								<td>${unidade.nome}</td>
								<td>
									<div class="gerenciar">
										<a title="Alterar unidade"
											href="alterarUnidadeAntes?id=${unidade.id}"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/editar.png" /></a>
										<a title="Remover unidade"
											onclick="setidUnidadeGerenciando(${unidade.id})"
											data-toggle="modal" data-target="#modalExcluir"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/lixeira.png" /></a>
										<a title="Ver sinais desta unidade"
											href="listarSinaisPorUnidade?id=${unidade.id}"><img
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
				
			<br/><br/><br/><br/><br/>
	</div>
	<c:import url="rodape.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js">
	</script>
	<script>
		var idSinalGerenciando;
		
		
		$( "input[id^=defineUnidadeAtual]" ).click(function() {
			var id = this.id;
			var numeroId = id.replace(/[^0-9]/g,'');
			removerOutraMarcacao(numeroId);
		});
		
		function removerOutraMarcacao(idSelecionado){
			$("input[id^=defineUnidadeAtual]").each( function () {
				var id = this.id;
				var numeroId = id.replace(/[^0-9]/g,'');
				
				if(numeroId != idSelecionado){
					$("#"+id).prop("checked",false);
				}
			});
			alterarUnidadeAtual(idSelecionado);
		}
		
		function alterarUnidadeAtual(idSelecionado){
			$.post("alterarUnidadeAtual",{'idUnidade' : idSelecionado}, function(resposta){
				location.reload();
			});
		}
	
		var idUnidadeGerenciando;
		
		function setidUnidadeGerenciando(idUnidade){
			idUnidadeGerenciando = idUnidade;
		}
			
		function excluirUnidade(){
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
								sInfo : "Apresentando _END_ unidades. Total de unidades cadastradas: _TOTAL_",
								sInfoEmpty : "Mostrando 0 até 0 de 0 registros",
								sInfoFiltered : "(Filtrados de _MAX_ registros)",
								sInfoPostFix : "",
								sInfoThousands : ".",
								sLengthMenu : "Qtd unidades apresentadas por pág: _MENU_",
								sLoadingRecords : "Carregando...",
								sProcessing : "Processando...",
								sZeroRecords : "Nenhum registro encontrado",
								sSearch : "Buscar Unidade",
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