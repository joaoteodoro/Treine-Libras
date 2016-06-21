<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Cadastrar Sinal</title>
	<meta name="description" content="" />
	<c:import url="imports.jsp" />
	</head>
	
	<body style="background-color:gray">
		<c:import url="menu.jsp">
			<c:param name="paginaAtual" value="avaliar"/>
		</c:import>
		<div class="container" style="background-color: white;">
			<br/>
			<br/>
			<div class="alinhamento-esquerdo">
				<h2><b>Cadastrar Sinal</b></h2>
				<br/>
				<br/>
			</div>
			<div class="row">
				<div class="center-block box-page-geral">
					<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<table class="table"> 
									<tbody>
										<tr>
										<c:forEach items="${condifuracoesDeMao}" var="configuracaoDeMao" varStatus="status">
											<c:if test="${status.count mod 6 == 0}">
												</tr>
												<tr>
											</c:if>
											<td><img id="img-config-mao-${configuracaoDeMao.idConfiguracaoDeMao}" data-dismiss="modal" class="img-responsive" src="${pageContext.request.contextPath}/resources/img/${configuracaoDeMao.imagem}"></td>
										</c:forEach>
									</tbody> 
								</table>
							</div>
						</div>
					</div>
					<form id="formCadastrarSinal" method="post" action="cadastrarSinal" enctype="multipart/form-data">
						<div class="form-group">
							<label for="nome">Nome:</label>
							<input type="text" required class="form-control" id="nome" name="nome" placeholder="Nome">
						</div>
						
						<div class="form-group">
							<label id="labelConfiguracaoDeMao" for="configuracaoDeMao">Configuração de Mão:</label>
							<input type="text" required class="form-control" id="configuracaoDeMao" name="configuracaoDeMao" placeholder="Configuração de Mão"
								data-target=".bs-example-modal-lg" data-toggle="modal" onkeyup="click()" onclick="configMaoClicada(this)">
							<a id="configuracaoDeMaoMais" href="#" title="Adicionar outra configuração de mão">+</a>
							<input style="display: none" type="text" class="form-control" id="configuracaoDeMao2" name="configuracaoDeMao2"
							placeholder="Configuração de mão 2" data-target=".bs-example-modal-lg" data-toggle="modal" onkeyup="click()" 
							onclick="configMaoClicada(this)">
							<a style="display: none" id="configuracaoDeMaoMenos" href="#" title="Remover outra configuração de mão">-</a>
						</div>

						<div class="form-group">
							<label id="labelPontoDeArticulacao" for="pontoDeArticulacao">Ponto de Articulação:</label>
							<select class="form-control" id="pontoDeArticulacao" name="pontoDeArticulacao">
								<option value=""></option>
								<c:forEach items="${pontosDeArticulacao}" var="pontoDeArticulacao">
									<option value="${pontoDeArticulacao.idPontoDeArticulacao}">${pontoDeArticulacao.nome}</option>
								</c:forEach>
							</select>
							<a id="pontoDeArticulacaoMais" href="#" title="Adicionar outro ponto de articulação">+</a>
							<select style="display: none" class="form-control" id="pontoDeArticulacao2">
								<option value=""></option>
								<c:forEach items="${pontosDeArticulacao}" var="pontoDeArticulacao">
									<option value="${pontoDeArticulacao.idPontoDeArticulacao}">${pontoDeArticulacao.nome}</option>
								</c:forEach>
							</select>
							<a style="display: none" id="pontoDeArticulacaoMenos" href="#" title="Remover outro ponto de articulação">-</a>
						</div>
						
						<div class="form-group">
							<label id="labelMovimento" for="movimento">Movimento:</label>
							<select class="form-control" id="movimento" name="movimento">
								<option value=""></option>
								<c:forEach items="${movimentos}" var="movimento">
									<option value="${movimento.idMovimento}">${movimento.nome}</option>
								</c:forEach>
							</select>
							<a id="movimentoMais" href="#" title="Adicionar outro movimento">+</a>
							<select style="display: none" class="form-control" id="movimento2" name="movimento2">
								<option value=""></option>
								<c:forEach items="${movimentos}" var="movimento">
									<option value="${movimento.idMovimento}">${movimento.nome}</option>
								</c:forEach>
							</select>
							<a style="display: none" id="movimentoMenos" href="#" title="Remover outro movimento">-</a>
						</div>
						
						<div class="form-group">
							<label for="orientacao">Orientação:</label>
							<select class="form-control" id="orientacao" name="orientacao">
								<option value="Para cima">Para cima</option>
								<option value="Para baixo">Para baixo</option>
								<option value="Para dentro">Para dentro</option>
								<option value="Para fora">Para fora</option>
								<option value="Para o lado esquerdo">Para o lado esquerdo</option>
								<option value="Para o lado direito">Para o lado direito</option>
							</select>
						</div>
						<div class="form-group">
							<label for="expressao">Expressão Facial:</label>
							<select class="form-control" id="expressao" name="expressao">
								<c:forEach items="${expressoesFaciais}" var="expressaoFacial">
									<option value="${expressaoFacial.idExpressaoFacial}">${expressaoFacial.nome}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group">
							<label for="foto">Foto:</label>
							<input type="file" required class="form-control" name="foto" id="foto" placeholder="Foto" accept="image/*">
						</div>
						
						<div class="form-group">
							<label for="video">Video:</label>
							<input type="file" required class="form-control" name="video" id="video" placeholder="Vídeo" accept="video/*">
							
						</div>
						
						<div class="form-group">
							<label for="categoria">Categoria:</label>
							<input type="text" required class="form-control" name="categoria" id="categoria" placeholder="Categoria">
						</div>
						
						<div class="form-group">
							<label for="dificuldade">Dificuldade:</label>
							<select class="form-control" id="dificuldade" name="dificuldade">
								<option value="Fácil">Fácil</option>
								<option value="Média">Média</option>
								<option value="Difícil">Difícil</option>
							</select>
						</div>
					  <button type="submit" class="bg-black color-white pull-right btn btn-default">Cadastrar</button>
					</form>
				</div>
			</div>
		</div>
		<script>
			var varConfigMaoClicada;
			
			function configMaoClicada(paramClicada){
				varConfigMaoClicada = paramClicada;
			};
			
			$(".img-responsive").click(function(){
				var idConfiguracaoMao = this.id.substring(15,17);
				console.log(idConfiguracaoMao);
				$("#"+varConfigMaoClicada.id).val(idConfiguracaoMao);
			});
		
			$("#configuracaoDeMaoMais").click(function(){
				$("#labelConfiguracaoDeMao").text("Configurações de mão");
				$("#configuracaoDeMao").attr("placeholder","Configuração de mão 1");
				$("#configuracaoDeMao2").show();
				$("#configuracaoDeMaoMais").hide();
				$("#configuracaoDeMaoMenos").show();
				$("#configuracaoDeMao2").attr("required","");
			});
			
			$("#configuracaoDeMaoMenos").click(function(){
				$("#labelConfiguracaoDeMao").text("Configuração de mão");
				$("#configuracaoDeMao").attr("placeholder","Configuração de mão");
				$("#configuracaoDeMao2").hide();
				$("#configuracaoDeMaoMais").show();
				$("#configuracaoDeMaoMenos").hide();
				$("#configuracaoDeMao2").val('');
				$("#configuracaoDeMao2").removeAttr("required");
			});
			
			
			
			$("#pontoDeArticulacaoMais").click(function(){
				$("#labelPontoDeArticulacao").text("Pontos de articulação");
				$("#pontoDeArticulacao2").show();
				$("#pontoDeArticulacaoMais").hide();
				$("#pontoDeArticulacaoMenos").show();
			});
			
			$("#pontoDeArticulacaoMenos").click(function(){
				$("#labelPontoDeArticulacao").text("Ponto de articulação");
				$("#pontoDeArticulacao2").hide();
				$("#pontoDeArticulacaoMais").show();
				$("#pontoDeArticulacaoMenos").hide();
			});
			
			$("#movimentoMais").click(function(){
				$("#labelMovimento").text("Movimentos");
				$("#movimento2").show();
				$("#movimentoMais").hide();
				$("#movimentoMenos").show();
			});
			
			$("#movimentoMenos").click(function(){
				$("#labelMovimento").text("Movimento");
				$("#movimento2").hide();
				$("#movimentoMais").show();
				$("#movimentoMenos").hide();
			});
		</script>
	</body>
</html>