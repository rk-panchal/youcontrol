<%@ include file="../commons/header.jsp" %>

<div id="content-main">
	<h2 class="perfil">Perfil de usuário</h2>
</div>
<div id="content-general">

	<div id="issueBox">
		<h2>${user.nome }</h2>
		<div id="detailTop">
			<a href="#"><img src="<c:url value="/image/user/${user.id }"/>" alt="${user.nome }" style="width:90px; height:90px"/></a>
			<p>${user.email }<br />Registrado em <fmt:formatDate value="${user.dataDeCriacao }" type="date" pattern="dd/MM/yyyy - hh:mm"/></p>
		</div>
		
		<a href="#">Enviar mensagem</a><br/>
		<a href="#">Atribuir no projeto...</a><br/>
		<a href="#">Reportar usuário</a>
	</div>

	<ol style="margin:0 0 0 30px">
		<c:forEach items="${projects }" var="project">
			<li><a href="<c:url value="/projects/${project.project.id }"/>">${project.project.projeto }</a> - (<fmt:formatDate value="${project.project.dataDeCriacao }" type="date" pattern="dd/MM/yyyy"/>)</li>
		</c:forEach>
	</ol>
	
</div>

<%@ include file="../commons/footer.jsp" %>