<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Professores</title>
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
				<b>Professores</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">
				<div class="col-md-5">
					<a href="cadastrarProfessorAntes"><h4><b>+Cadastrar novo professor</b></h4></a> <br /> <br />
				</div>
				
				<table id="tabela" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Nome do Professor</th>
							<th>E-mail</th>
							<th>Gerenciar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${professores}" var="professor">
							<tr>
								<td>
									${professor.nome}
								</td>
								<td>${professor.email}</td>
								<td>
									<div class="gerenciar">
										<a title="Alterar Senha"
											href="alterarSenhaAntes?id=${professor.idUsuario}"><img
											class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/alterar-senha.png" /></a>
										<a title="Excluir professor"
											onclick="setidProfessorGerenciando(${professor.idUsuario})"
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
						<h4 class="modal-title" id="myModalLabel">Exclus�o</h4>
					</div>
					<div class="modal-body">Deseja realmente excluir este
						professor?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">N�o</button>
						<button type="button" class="btn btn-primary"
							onclick="excluirProfessor()">Sim</button>
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
		var idProfessorGerenciando;
		
		function setidProfessorGerenciando(idProfessor){
			idProfessorGerenciando = idProfessor;
		}
			
		function excluirProfessor(){
			$.post("removerUsuario",{'id' : idProfessorGerenciando}, function(resposta){
				//window.location.replace("listarSinais");
				location.reload();
			});
		}
	
		$('#tabela')
				.dataTable(
						{
							oLanguage : {
								sEmptyTable : "Nenhum registro encontrado",
								sInfo : "Apresentando _END_ professores. Total de professores cadastradas: _TOTAL_",
								sInfoEmpty : "Mostrando 0 at� 0 de 0 registros",
								sInfoFiltered : "(Filtrados de _MAX_ registros)",
								sInfoPostFix : "",
								sInfoThousands : ".",
								sLengthMenu : "Qtd professores apresentadas por p�g: _MENU_",
								sLoadingRecords : "Carregando...",
								sProcessing : "Processando...",
								sZeroRecords : "Nenhum registro encontrado",
								sSearch : "Buscar Professores",
								oPaginate : {
									sNext : "Pr�ximo",
									sPrevious : "Anterior",
									sFirst : "Primeiro",
									sLast : "�ltimo"
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