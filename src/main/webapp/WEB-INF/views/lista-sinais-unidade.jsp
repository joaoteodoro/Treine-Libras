<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Sinais</title>
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
				<b>Sinais cadastrados na unidade ${unidade}</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">

				<a href="cadastrarSinalUnidadeAntes?unidade=${unidade}">Adicionar
					novo sinal nesta unidade</a> <br /> <br /> <a
					href="cadastrarSinalAntes">Adicionar novo sinal em outra
					unidade</a> <br /> <br />
					
					<div id="atencao" class="atencao" style="display:none">
						<p>Atenção, selecione cinco sinais como sinais de testes! </p>
					</div>
				<table id="tabela" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th
								title="Caso selecionado, este sinal fará parte do teste inicial do usuário! (Selecione apenas 5 sinais)">
								Sinal Teste?</th>
							<th>Sinal</th>
							<th>Categoria</th>
							<th>Gerenciar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sinaisUnidade}" var="sinal">
							<tr>
								<td><c:choose>
										<c:when test="${sinal.sinalDefinePesoInicial}">
											<input id="definePesoInicial${sinal.idSinal}"
												name="definePesoInicial${sinal.idSinal}" type="checkbox"
												checked="checked" />
										</c:when>
										<c:otherwise>
											<input id="definePesoInicial${sinal.idSinal}"
												name="definePesoInicial${sinal.idSinal}" type="checkbox" />
										</c:otherwise>
									</c:choose></td>
								<td>${sinal.nome}</td>
								<td>${sinal.categoria}</td>
								<td>
									<div class="gerenciar">
										<a title="Alterar sinal"
											href="alterarSinalAntes?idSinal=${sinal.idSinal}"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/editar.png" /></a>
										<a title="Remover sinal"
											onclick="setidSinalGerenciando(${sinal.idSinal})"
											data-toggle="modal" data-target="#modalExcluir"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/lixeira.png" /></a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input type="hidden" id="sinaisTestes" name="sinaisTestes"/>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalSinaisTeste" tabindex="-1" role="dialog"
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
				<div class="modal-body">Você pode selecionar apenas 5 sinais por unidade.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
				</div>
			</div>
		</div>
	</div>

	<c:import url="rodape.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap.min.js"></script>
	<script>
	$( document ).ready(function() {
		var n = $( "input:checked" ).length
		if(n < 5){
			$("#atencao").show();
		}else{
			$("#atencao").hide();
		}
	});
	
	
		var idSinalGerenciando;
		
		$( "input[type=checkbox]" ).on( "click", contaSelecionados );
		
		function contaSelecionados(){
			
			//verifica a quantidade selecionada
			var n = $( "input:checked" ).length;
			if(n > 5){
				$("#modalSinaisTeste").show();
				return false;
			}else{
				if(n < 5){
					$("#atencao").show();
				}else{
					$("#atencao").hide();
				}
				$("#sinaisTestes").val("");
				
				$("input[id^=definePesoInicial]").each( function () {
					var sinaisTestes = $("#sinaisTestes").val();
					
					var id = this.id;
					var checked = $("#"+id).prop("checked");
					
					if(checked == '1'){
						$("#sinaisTestes").val(sinaisTestes + id.replace(/[^0-9]/g,'') + ":1" + ",");
					}else{
						$("#sinaisTestes").val(sinaisTestes + id.replace(/[^0-9]/g,'') + ":0" + ",");
					}
				});
				$("#sinaisTestes").val($("#sinaisTestes").val().substr(0,($("#sinaisTestes").val().length - 1)))
				console.log($("#sinaisTestes").val());
				alteraSinaisTeste();
			}
		}
		
		function setidSinalGerenciando(idSinal){
			idSinalGerenciando = idSinal;
		}
		
		function alteraSinaisTeste(){
			var sinaisTestes = $("#sinaisTestes").val();
			$.post("alteraSinaisTeste",{'sinaisTeste' : sinaisTestes}, function(resposta){
				location.reload();
			});
			
		}
		
		function excluirSinal(){
			console.log("idSinalGerenciando: "+idSinalGerenciando);
			$.post("removerSinal",{'idSinal' : idSinalGerenciando}, function(resposta){
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