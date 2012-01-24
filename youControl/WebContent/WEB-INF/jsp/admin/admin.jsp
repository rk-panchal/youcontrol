<%@ include file="../commons/header.jsp" %>
<div id="content-main">
	<h2 class="atividade">Administra��o</h2>
</div>
<div id="content-general">
	<h1>�rea administrativa</h1>
	<div id="wrap">
		<div id="usuarios">
			<h2>Usu�rios</h2>
			<ul>
				<c:forEach items="${users }" var="user">
					<li><a href="<c:url value="/users/${user.id }"/>">${user.nome }</a> / ${user.email }</li>
				</c:forEach>
			</ul>
		</div>
		<div id="projetos">
			<h2>Projetos</h2>
			<ul>
				<c:forEach items="${projects }" var="project">
					<li>${project.id } - ${project.projeto } - <fmt:formatDate value="${project.dataDeCriacao }" type="date" pattern="dd/MM/yyyy hh:mm"/></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<style>
	#wrap { width:800px; margin:0 auto; font-size:13px; line-height:25px; }
	#usuarios, #projetos { width:380px; padding:5px; float:left; }
	ul li { list-style-type: none; }
</style>
<%@ include file="../commons/footer.jsp" %>