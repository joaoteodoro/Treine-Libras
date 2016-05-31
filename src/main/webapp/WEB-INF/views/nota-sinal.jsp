<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${nota > 0 && nota < 0.5}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${nota >= 0.5 && nota < 1}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-metade-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${nota >= 1 && nota < 1.5}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${nota >= 1.5 && nota < 2}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-metade-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${nota >= 2 && nota < 2.5}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${nota >= 2.5 && nota < 3}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-metade-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${nota >= 3 && nota < 3.5}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${nota >= 3.5 && nota < 4}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-metade-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${nota >= 4 && nota < 4.5}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-vazia.png"/>
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${nota >= 4.5 && nota < 5}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-metade-amarela.png"/>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${nota == 5}">
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
		<img class="estrela-avaliacao" src="${pageContext.request.contextPath}/resources/img/estrela-cheia-amarela.png"/>
	</c:when>
</c:choose>