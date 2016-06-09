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
					<form id="form" action="javascript:alert( 'success!' );">
						<div class="form-group">
							<label for="nome">Nome:</label>
							<input type="text" required class="form-control" id="nome" placeholder="Nome">
						</div>
						<div class="form-group">
							<label for="configuracaoMao">Configura��o de M�o:</label>
							<input type="text" required class="form-control" id="configuracaoMao" placeholder="Configura��o de M�o"
								data-target=".bs-example-modal-lg" data-toggle="modal" onkeyup="click()">
						</div>

						<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<table class="table"> 
										<tbody>
											<c:forEach items="${condifuracoesDeMao}" var="configuracaoDeMao" varStatus="status">
												<c:if test="${status.count mod 5 == 0}">
													<tr>
												</c:if>
													<td><img id="img-config-mao-1" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<c:if test="${status.count mod 5 == 0}">
													</tr>
												</c:if>
												${configuracaoDeMao.nome}
											</c:forEach>
											<c:forEach var="i" begin="1" end="5">
											   Item <c:out value="${i}"/><p>
											</c:forEach>
											<tr> 
												<td><img id="img-config-mao-1" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-2" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-3" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-4" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-5" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-6" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
											</tr> 
											<tr>
												<td><img id="img-config-mao-7" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-8" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-9" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-10" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-11" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
												<td><img id="img-config-mao-12" data-dismiss="modal" class="img-responsive" src="img/1.jpg"></td>
											</tr> 
											<tr>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
											</tr>
											<tr>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
											</tr>
											<tr>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
											</tr>
											<tr>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
											</tr>
											<tr>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
											</tr>
											<tr>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
											</tr>
											<tr>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
											</tr>
											<tr>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
											</tr>
											<tr>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
												<td><img class="img-responsive" src="img/1.jpg"></td>
											</tr>
											
										</tbody> 
									</table>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="pontoArticulacao">Ponto de Articula��o:</label>
							<select class="form-control" id="pontoArticulacao">
								<option value="Neutro">Neutro</option>
								<option value="Na testa">Na testa</option>
								<option value="Na boca">Na boca</option>
								<option value="Na orelha">Na orelha</option>
								<option value="Outro">Outro</option>
							</select>
							<div style="display: none" id="outroPontoArticulacao">
								<br/>
								<input type="text" class="form-control" id="pontoArticulacao2" placeholder="Novo Ponto de Articula��o">
							</div>
						</div>
						
						<div class="form-group">
							<label for="movimento">Movimento:</label>
							<select class="form-control" id="movimento">
								<option value="Direcional no espa�o">Direcional no espa�o</option>
								<option value="Outro">Outro</option>
							</select>
							<div style="display: none" id="outroMovimento">
								<br/>
								<input type="text" class="form-control" id="movimento2" placeholder="Novo Movimento">
							</div>
							
						</div>
						
						<div class="form-group">
							<label for="orientacao">Orienta��o:</label>
							<select class="form-control" id="orientacao">
								<option value="Para cima">Para cima</option>
								<option value="Para baixo">Para baixo</option>
								<option value="Para dentro">Para dentro</option>
								<option value="Para fora">Para fora</option>
								<option value="Para o lado esquerdo">Para o lado esquerdo</option>
								<option value="Para o lado direito">Para o lado direito</option>
							</select>
						</div>
						<div class="form-group">
							<label for="expressaoFacial">Express�o Facial:</label>
							<select class="form-control" id="expressaoFacial">
								<option value="Afirmativa">Afirmativa</option>
								<option value="Interrogativa">Interrogativa</option>
								<option value="Exclamativa">Exclamativa</option>
								<option value="Negativa">Negativa</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="foto">Foto:</label>
							<input type="file" required class="form-control" id="foto" placeholder="Foto" accept="image/*">
						</div>
						
						<div class="form-group">
							<label for="video">Video:</label>
							<input type="file" required class="form-control" id="video" placeholder="V�deo" accept="video/*">
							
						</div>
						
						<div class="form-group">
							<label for="categoria">Categoria:</label>
							<input type="text" required class="form-control" id="categoria" placeholder="Categoria">
						</div>
						
						<div class="form-group">
							<label for="dificuldade">Dificuldade:</label>
							<select class="form-control" id="dificuldade">
								<option value="F�cil">F�cil</option>
								<option value="M�dia">M�dia</option>
								<option value="Dif�cil">Dif�cil</option>
							</select>
						</div>
					  <button type="submit" class="bg-black color-white pull-right btn btn-default">Cadastrar</button>
					</form>
				</div>
			</div>
		</div>
		<script>
			$(".img-responsive").click(function(){
				var idConfiguracaoMao = this.id.substring(15,17);
				$("#configuracaoMao").val(idConfiguracaoMao);
			});
			
			$("#movimento").change(function(){
				var valor = $(this).val();
				if(valor == 'Outro'){
					$("#outroMovimento").show();
					$("#movimento2").attr("required","");
				}else{
					$("#outroMovimento").hide();
					$("#movimento2").removeAttr("required");
				}
			});
			
			$("#pontoArticulacao").change(function(){
				var valor = $(this).val();
				if(valor == 'Outro'){
					$("#outroPontoArticulacao").show();
					$("#pontoArticulacao2").attr("required","");
				}else{
					$("#outroPontoArticulacao").hide();
					$("#pontoArticulacao2").removeAttr("required");
				}
			});
		</script>
	</body>
</html>