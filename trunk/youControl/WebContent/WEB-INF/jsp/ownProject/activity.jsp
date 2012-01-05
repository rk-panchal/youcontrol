<%@ include file="../commons/header.jsp" %>
<div id="content-main">
	<h2 class="atividade">Atividades: ${userWeb.project.projeto }</h2>
</div>
<div id="content-general">
	<a href="<c:url value="/activity/new"/>" class="submit">Criar atividade</a>
	<ul class="lista" style="margin-top:10px">
		<c:forEach items="${atividades }" var="atividade">
			<li><a href="<c:url value="/activity/${atividade.id }"/>">${atividade.resumo }</a> - 
							por ${atividade.criador.nome } (${atividade.dataCriacao }) - 
							<c:if test="${atividade.responsavel.nome == null}">
								tarefa não atribuida
							</c:if>
							<c:if test="${atividade.responsavel.nome != null}">
								atribuido para ${atividade.responsavel.nome }
							</c:if>
			</li>
		</c:forEach>
	</ul>
</div>
<script>
	$("#main ul li.atividade a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>