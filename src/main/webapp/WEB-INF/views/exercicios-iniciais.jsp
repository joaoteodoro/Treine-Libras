<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Treine Libras - Exercicios Iniciais</title>
<meta name="description" content="" />
<c:import url="imports.jsp" />
</head>
<body>
	<div class="container" style="background-color: white;">
		<br /> <br /> 
		<form method="post" id="formPontuacao" name="formPontuacao" action="resultadoAvaliacao">
			<input type="hidden" id="pontuacao" name="pontuacao"
			value="0" />
		</form>
		<c:forEach items="${sinaisIniciais}" var="sinal" varStatus="status">
			<c:choose>
				<c:when test="${status.count == 1}">
					<div id="avaliacao${status.count}" style="display: block">
				</c:when>
				<c:otherwise>
					<div id="avaliacao${status.count}" style="display: none">
				</c:otherwise>
			</c:choose>
				<div class="alinhamento-esquerdo">
					<h2>
						<b>Que sinal é este?</b>
					</h2>
					<br /> <br />
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="video-container video col-md-offset-1 col-md-10">
							<video id="recorded" controls="" autoplay loop
								src="${pageContext.request.contextPath}/resources/videos/${sinal.key.video}"></video>
						</div>
					</div>
					<div class="col-md-6">
						<div class="video-container video col-md-offset-1 col-md-10">
<%-- 							<div onclick="testar(this,'${status.count}')" --%>
<!-- 								class="col-md-12 botaoOpcao center-block"> -->
<%-- 								<p>${sinal.key.nome}</p> --%>
<!-- 							</div> -->
							<c:forEach items="${sinal.value}" var="sinalOpcao">
								<div onclick="testar(this,'${status.count}')"
									class="col-md-12 botaoOpcao center-block">
									<p>${sinalOpcao.nome}</p>
								</div>
							</c:forEach>
						</div>
						<input type="hidden" id="nomeCorreto${status.count}"
							name="nomeCorreto${status.count}" value="${sinal.key.nome}" />
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<script type="text/javascript">
		function testar(parametro, n) {
			var nomeCorreto = $("#nomeCorreto" + n).val();
			var nomeClicado = $(parametro).children().text()
			if (nomeCorreto == nomeClicado) {
				var pontuacao = parseInt($("#pontuacao").val()) + 1;
				$("#pontuacao").val(pontuacao);
			}
			if(n == 5){
				$("#formPontuacao").submit();
			}else{
				$("#avaliacao" + n).hide();
				var nAux = parseInt(n) + 1;
				$("#avaliacao" + nAux).show();	
			}
		}
	</script>
</body>
</html>