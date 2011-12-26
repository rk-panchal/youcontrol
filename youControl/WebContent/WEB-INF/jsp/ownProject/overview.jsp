<%@ include file="../commons/header.jsp" %>
<div id="content-main">
	<h2 class="visao">Visão Geral</h2>
</div>
<div id="content-general">
	${userWeb.project.projeto }<br />
	${userWeb.project.publicoAlvo }<br />
	${userWeb.project.status }<br />
	<pre>${userWeb.project.descricao }</pre>
</div>
<script>
	$("#main ul li.visao a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>