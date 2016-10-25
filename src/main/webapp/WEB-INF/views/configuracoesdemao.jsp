<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Configurações de Mão</title>
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
				<b>Configurações de Mão</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">
				<a href="cadastrarConfiguracaoDeMao"><h4><b>+Adiconar nova Configuração de Mão</b></h4></a>
				<table id="tabela" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Imagem</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${configuracoesDeMao}" var="configuracaoDeMao">
							<tr>
								<td>${configuracaoDeMao.idConfiguracaoDeMao}</td>
								<td>${configuracaoDeMao.nome}</td>
								<td><img class="img-responsive" 
									src="${pageContext.request.contextPath}/resources/img/${configuracaoDeMao.imagem}"/></td>
								<td>${unidade.sinais.size()}</td>
								<td>
									<div class="gerenciar">
										<a title="Alterar Configuração de Mão"
											href="cadastrarConfiguracaoDeMao?id=${configuracaoDeMao.idConfiguracaoDeMao}"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/editar.png" /></a>
										<a title="Remover Configuração de Mão"
											onclick="setidUnidadeGerenciando(${configuracaoDeMao.idConfiguracaoDeMao})"
											data-toggle="modal" data-target="#modalExcluir"><img
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