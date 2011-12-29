<%@ include file="../commons/header.jsp" %>
<div id="content-main">
	<h2 class="atividade">Atividades: ${userWeb.project.projeto }</h2>
</div>
<div id="content-general">
	<a href="<c:url value="/activity/new"/>" class="submit">Criar atividade</a>
	<ul class="lista" style="margin-top:10px">
		<c:forEach items="${atividades }" var="atividade">
			<li><a href="#">${atividade.resumo }</a> - por ${atividade.criador.nome } (${atividade.dataCriacao })</li>
		</c:forEach>
	</ul>
</div>
<script>
	$("#main ul li.atividade a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>