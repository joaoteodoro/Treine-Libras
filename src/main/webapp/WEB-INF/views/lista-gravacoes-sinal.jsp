<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<c:param name="paginaAtual" value="avaliar"/>
		</c:import>
		<div class="container" style="background-color: white;">
			<br/>
			<br/>
			<div class="alinhamento-esquerdo">
				<h2><b>Gravações do sinal ${sinal.nome}</b></h2>
				<br/>
				<br/>
				<p>Selecione uma dessas gravações para avaliar!</p>
			</div>
			<script>
				var listaIdSinais = new Array();
				var listaIdUsuarios = new Array();
			</script>
			<div class="row">
				<div class="center-block box-page-geral">
					<table class="table table-striped"> 
						<thead> 
							<tr> 
								<th>Usuário</th> 
								<th>Avaliação atual</th> 
							</tr> 
						</thead> 
						<tbody>
							<c:forEach items="${gravacoes}" var="gravacao">
								<tr>
									<td><a href="mostraGravacao?idSinal=${sinal.idSinal}&idUsuario=${gravacao.usuario.idUsuario}">${gravacao.usuario.nome}</a></td>
									<td>
										<div id="estrelas-nota-${sinal.idSinal}">
										</div>
										<script>
											listaIdSinais.push('${sinal.idSinal}');
											listaIdUsuarios.push('${gravacao.usuario.idUsuario}');
										</script>
									</td>
								</tr>	
							</c:forEach>
						</tbody> 
					</table>
				</div>
			</div>
		</div>
		<script>
			$( document ).ready(function() {
				for (i = 0; i < listaIdSinais.length; i++) {
					carregarEstrelas(listaIdSinais[i],listaIdUsuarios[i]);
				}
			});
		
			function carregarEstrelas(idSinal, idUsuario){
				console.log("idSinal: "+idSinal);
				console.log("idUsuario: "+idUsuario);
				
				$.post("calculaNotaUsuarios",{'idSinal' : idSinal, 'idUsuario' : idUsuario}, function(resposta){
					$("#estrelas-nota-"+idSinal).html(resposta);
				});
			};
		</script>
	</body>
</html>