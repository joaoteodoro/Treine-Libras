<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Área do professor</title>
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
				<b>Área do Professor</b>
			</h2>
			<br /> <br />
		</div>
			<div class="row">
				<div class="col-md-4">
					<a href="configuracoesDeMao">
						<div class="box-unidade">
							<div class="col-md-3">
								<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/configMao10.png"/>
							</div>
							<div class="col-md-9">
								<h3 class="center-block"><b>Configurações de Mão</b></h3>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="pontosDeArticulacao"> 
						<div class="box-unidade">
							<div class="col-md-3">
								<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/pontoArticulacao.jpg"/>
							</div>
							<div class="col-md-9">
								<h3 class="center-block"><b>Pontos de Articulação</b></h3>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="movimentos"> 
						<div class="box-unidade">
							<div class="col-md-3">
								<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/movimento.jpg"/>
							</div>
							<div class="col-md-9">
								<h3 class="center-block"><b>Movimentos</b></h3>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<a href="expressoesFaciais"> 
						<div class="box-unidade">
							<div class="col-md-3">
								<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/expressaoFacial.jpg"/>
							</div>
							<div class="col-md-9">
								<h3 class="center-block"><b>Expressões Faciais</b></h3>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="unidades"> 
						<div class="box-unidade">
							<div class="col-md-3">
								<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/unidade.png"/>
							</div>
							<div class="col-md-9">
								<h3 class="center-block"><b>Unidades</b></h3>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="alunos"> 
						<div class="box-unidade">
							<div class="col-md-3">
								<img class="img-sinal-libras img-responsive center-block" src="${pageContext.request.contextPath}/resources/img/professor.png"/>
							</div>
							<div class="col-md-9">
								<h3 class="center-block"><b>Alunos</b></h3>
							</div>
						</div>
					</a>
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
</body>
</html>