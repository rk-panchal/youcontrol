<%@ include file="../commons/header.jsp" %>

<div id="content-main">
	<h2 class="inicio">Início</h2>
</div>
<div id="content-general">
	<p>teste</p>
	<a href="<c:url value="/users/profile"/>">Editar meu perfil</a>
</div>
<script>
	$("#main ul li.inicio a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>