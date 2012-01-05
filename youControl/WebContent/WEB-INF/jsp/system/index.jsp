<%@ include file="../commons/header.jsp" %>

<div id="content-main">
	<h2 class="inicio">Início</h2>
</div>
<div id="content-general">
	<p>teste</p>
	<form action="<c:url value="/image/user/${userWeb.user.id }"/>" method="post" enctype="multipart/form-data" id="formFoto">
		<fieldset>
			<legend>Alterar foto</legend>
			<img src="<c:url value="/image/user/${userWeb.user.id }"/>" alt="${userWeb.user.nome }" style="width:80px; height:150px"/>
			<input type="file" name="arquivo" />
			<input type="submit" value="Alterar foto" />
		</fieldset>
	</form>
</div>
<script>
	$("#main ul li.inicio a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>