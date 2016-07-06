<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Alterar Sinal</title>
<meta name="description" content="" />
<c:import url="imports.jsp" />
</head>

<body style="background-color: gray">
	<c:import url="menu.jsp">
		<c:param name="paginaAtual" value="sinais" />
	</c:import>
	<div class="container" style="background-color: white;">
		<br /> <br />
		<div class="alinhamento-esquerdo">
			<h2>
				<b>Alterar Sinal ${sinal.nome}</b>
			</h2>
			<br /> <br />
		</div>
		<div class="row">
			<div class="center-block box-page-geral">
				<div class="modal fade bs-example-modal-lg" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<table class="table">
								<tbody>
									<tr>
										<c:forEach items="${condifuracoesDeMao}"
											var="configuracaoDeMao" varStatus="status">
											<c:if test="${status.count mod 6 == 0}">
									</tr>
									<tr>
										</c:if>
										<td><img
											id="img-config-mao-${configuracaoDeMao.idConfiguracaoDeMao}"
											data-dismiss="modal" class="img-responsive"
											src="${pageContext.request.contextPath}/resources/img/${configuracaoDeMao.imagem}"></td>
										</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<form id="formAlterarSinal" method="post" action="alterarSinal"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="nome">Nome:</label> <input type="text"
							value="${sinal.nome}" required class="form-control" id="nome"
							name="nome" placeholder="Nome">
					</div>

					<div class="form-group">
						<label id="labelConfiguracaoDeMao" for="configuracaoDeMao">Configuração
							de Mão:</label>

						<c:forEach items="${sinal.configuracoesDeMao}"
							var="configuracaoDeMao" varStatus="status">
							<c:if test="${status.index == 0}">
								<input type="text" required class="form-control"
									id="configuracaoDeMao" name="configuracaoDeMao"
									placeholder="Configuração de Mão"
									value="${configuracaoDeMao.idConfiguracaoDeMao}"
									data-target=".bs-example-modal-lg" data-toggle="modal"
									onkeyup="click()" onclick="configMaoClicada(this)">
								<a id="configuracaoDeMaoMais" href="#"
									title="Adicionar outra configuração de mão">+</a>
							</c:if>

							<c:if test="${status.index == 1}">
								<input style="display: none" type="text" class="form-control"
									id="configuracaoDeMao2" name="configuracaoDeMao2"
									placeholder="Configuração de mão 2"
									value="${configuracaoDeMao.idConfiguracaoDeMao}"
									data-target=".bs-example-modal-lg" data-toggle="modal"
									onkeyup="click()" onclick="configMaoClicada(this)">
								<a style="display: none" id="configuracaoDeMaoMenos" href="#"
									title="Remover outra configuração de mão">-</a>
							</c:if>
						</c:forEach>
					</div>

					<div class="form-group">
						<label id="labelPontoDeArticulacao" for="pontoDeArticulacao">Ponto
							de Articulação:</label>
						<c:forEach items="${sinal.pontosDeArticulacao}"
							var="pontoDeArticulacao" varStatus="status">
							<c:if test="${status.index == 0}">
								<select class="form-control" id="pontoDeArticulacao"
									name="pontoDeArticulacao">
									<option value=""></option>
									<c:forEach items="${pontosDeArticulacao}"
										var="pontoDeArticulacaoBanco">
										<option
											value="${pontoDeArticulacaoBanco.idPontoDeArticulacao}"
											${pontoDeArticulacaoBanco.idPontoDeArticulacao == pontoDeArticulacao.idPontoDeArticulacao ? 'selected' : ''}>${pontoDeArticulacaoBanco.nome}</option>
									</c:forEach>
								</select>
								<a id="pontoDeArticulacaoMais" href="#"
									title="Adicionar outro ponto de articulação">+</a>
							</c:if>
							<c:if test="${status.index == 1}">
								<select style="display: none" class="form-control"
									id="pontoDeArticulacao2">
									<option value=""></option>
									<c:forEach items="${pontosDeArticulacao}"
										var="pontoDeArticulacao">
										<option
											<c:if test="${param.selectValue == pontoDeArticulacao.nome})"> selected </c:if>
											value="${pontoDeArticulacao.idPontoDeArticulacao}">${pontoDeArticulacao.nome}</option>
									</c:forEach>
								</select>
								<a style="display: none" id="pontoDeArticulacaoMenos" href="#"
									title="Remover outro ponto de articulação">-</a>
							</c:if>
						</c:forEach>
					</div>

					<div class="form-group">
						<label id="labelMovimento" for="movimento">Movimento:</label>
						<c:forEach items="${sinal.movimentos}" var="movimento"
							varStatus="status">
							<c:if test="${status.index == 0}">
								<select class="form-control" id="movimento" name="movimento">
									<option value=""></option>
									<c:forEach items="${movimentos}" var="movimentoBanco">
										<option value="${movimentoBanco.idMovimento}"
											${movimentoBanco.idMovimento == movimento.idMovimento ? 'selected' : ''}>${movimentoBanco.nome}</option>
									</c:forEach>
								</select>
								<a id="movimentoMais" href="#" title="Adicionar outro movimento">+</a>
							</c:if>
							<c:if test="${status.index == 0}">
								<select style="display: none" class="form-control"
									id="movimento2" name="movimento2">
									<option value=""></option>
									<c:forEach items="${movimentos}" var="movimento">
										<option
											<c:if test="${param.selectValue == movimento.nome})"> selected </c:if>
											value="${movimento.idMovimento}">${movimento.nome}</option>
									</c:forEach>
								</select>
								<a style="display: none" id="movimentoMenos" href="#"
									title="Remover outro movimento">-</a>
							</c:if>
						</c:forEach>
					</div>
					<c:set var="orientacoes"
						value="Para cima,Para baixo,Para dentro,Para fora,Para o lado esquerdo,Para o lado direito"
						scope="application" />
					<div class="form-group">
						<label for="orientacao">Orientação:</label> <select
							class="form-control" id="orientacao" name="orientacao">
							<c:forEach items="${fn:split(orientacoes, ',')}" var="orientacao">
								<option value="${orientacao}"
									${sinal.orientacao == orientacao ? 'selected' : ''}>${orientacao}</option>
							</c:forEach>

							<%-- <option
								<c:if test="${sinal.orientacao == grade ? 'selected' : ''})"> selected </c:if>
								value="Para cima">Para cima</option>
							<option
								<c:if test="${sinal.orientacao == 'Para baixo'})"> selected </c:if>
								value="Para baixo">Para baixo</option>
							<option
								<c:if test="${sinal.orientacao == 'Para dentro'})"> selected </c:if>
								value="Para dentro">Para dentro</option>
							<option
								<c:if test="${sinal.orientacao == 'Para fora'})"> selected </c:if>
								value="Para fora">Para fora</option>
							<option
								<c:if test="${sinal.orientacao == 'Para o lado esquerdo'})"> selected </c:if>
								value="Para o lado esquerdo">Para o lado esquerdo</option>
							<option
								<c:if test="${sinal.orientacao == 'Para o lado direito'})"> selected </c:if>
								value="Para o lado direito">Para o lado direito</option> --%>
						</select>
					</div>
					<div class="form-group">
						<label for="expressao">Expressão Facial:</label> <select
							class="form-control" id="expressao" name="expressao">
							<c:forEach items="${expressoesFaciais}" var="expressaoFacial">
								<option value="${expressaoFacial.idExpressaoFacial}"
									${expressaoFacial.idExpressaoFacial == sinal.expressaoFacial.idExpressaoFacial ? 'selected' : ''}>
									${expressaoFacial.nome}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<img style="width: 20px; height: 20px;"
							src="${pageContext.request.contextPath}/resources/img/${sinal.foto}" />
						<label for="foto">Foto:</label> <input type="file"
							class="form-control" name="foto" id="foto" placeholder="Foto"
							accept="image/*">
					</div>

					<div class="form-group">
						<video id="videoGravado" controls="" 
						src="${pageContext.request.contextPath}/resources/videos/${sinal.video}"></video>
						<label for="video">Video:</label> <input type="file"
							class="form-control" name="video" id="video" placeholder="Vídeo"
							accept="video/*">
					</div>

					<div class="form-group">
						<label for="categoria">Categoria:</label> <input type="text"
							value="${sinal.categoria}" required class="form-control"
							name="categoria" id="categoria" placeholder="Categoria">
					</div>

					<c:set var="dificuldades"
						value="Fácil,Média,Difícil" scope="application" />
					<div class="form-group">
						<label for="dificuldade">Dificuldade:</label> <select
							class="form-control" id="dificuldade" name="dificuldade">
							
							<c:forEach items="${fn:split(dificuldades, ',')}" var="dificuldade">
								<option value="${dificuldade}"
									${sinal.dificuldade == dificuldade ? 'selected' : ''}>${dificuldade}</option>
							</c:forEach>
							
						</select>
					</div>
					<button type="submit"
						class="bg-black color-white pull-right btn btn-default">Alterar
						Sinal</button>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Alterar Sinal</h4>
				</div>
				<div class="modal-body">Confirma as alterações?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
					<button type="button" class="btn btn-primary"
						onclick="alterarSinal()">Sim</button>
				</div>
			</div>
		</div>
	</div>
	<c:import url="rodape.jsp" />
	<script>
		function alterarSinal() {
			$("#formAlterarSinal").submit();
		}

		$("#formAlterarSinal").submit(function() {
			if ($('#myModal').css("display") == "block") {
				return true;
			}
			$('#myModal').modal('show');
			return false;
		});

		var varConfigMaoClicada;

		function configMaoClicada(paramClicada) {
			varConfigMaoClicada = paramClicada;
		};

		$(".img-responsive").click(function() {
			var idConfiguracaoMao = this.id.substring(15, 17);
			console.log(idConfiguracaoMao);
			$("#" + varConfigMaoClicada.id).val(idConfiguracaoMao);
		});

		$("#configuracaoDeMaoMais").click(
				function() {
					$("#labelConfiguracaoDeMao").text("Configurações de mão");
					$("#configuracaoDeMao").attr("placeholder",
							"Configuração de mão 1");
					$("#configuracaoDeMao2").show();
					$("#configuracaoDeMaoMais").hide();
					$("#configuracaoDeMaoMenos").show();
					$("#configuracaoDeMao2").attr("required", "");
				});

		$("#configuracaoDeMaoMenos").click(function() {
			$("#labelConfiguracaoDeMao").text("Configuração de mão");
			$("#configuracaoDeMao").attr("placeholder", "Configuração de mão");
			$("#configuracaoDeMao2").hide();
			$("#configuracaoDeMaoMais").show();
			$("#configuracaoDeMaoMenos").hide();
			$("#configuracaoDeMao2").val('');
			$("#configuracaoDeMao2").removeAttr("required");
		});

		$("#pontoDeArticulacaoMais").click(function() {
			$("#labelPontoDeArticulacao").text("Pontos de articulação");
			$("#pontoDeArticulacao2").show();
			$("#pontoDeArticulacaoMais").hide();
			$("#pontoDeArticulacaoMenos").show();
		});

		$("#pontoDeArticulacaoMenos").click(function() {
			$("#labelPontoDeArticulacao").text("Ponto de articulação");
			$("#pontoDeArticulacao2").hide();
			$("#pontoDeArticulacaoMais").show();
			$("#pontoDeArticulacaoMenos").hide();
		});

		$("#movimentoMais").click(function() {
			$("#labelMovimento").text("Movimentos");
			$("#movimento2").show();
			$("#movimentoMais").hide();
			$("#movimentoMenos").show();
		});

		$("#movimentoMenos").click(function() {
			$("#labelMovimento").text("Movimento");
			$("#movimento2").hide();
			$("#movimentoMais").show();
			$("#movimentoMenos").hide();
		});
	</script>
</body>
</html>