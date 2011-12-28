<%@ include file="../commons/header.jsp" %>
<div id="content-main">
	<h2 class="projeto">Projetos</h2>
</div>
<div id="content-general">

	<a href="<c:url value="/projects/new"/>" class="submit">Criar projeto</a>
	<ul class="lista" style="margin-top:10px">
		<c:forEach items="${projetos }" var="projeto">
			<li><a href="<c:url value="/choose/${projeto.project.id }"/>">${projeto.project.projeto }</a> - ${projeto.role } (${projeto.project.dataDeCriacao })</li>
		</c:forEach>
	</ul>
	
</div>
<script>
	$("#main ul li.projetos a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>