<%@ include file="../commons/header.jsp" %>

<div id="content-main">
	<h2 class="inicio">${user.nome }</h2>
</div>
<div id="content-general">
	<img src="<c:url value="/image/user/${user.id }"/>" alt="${user.nome }" style="width:80px; height:150px; margin-top:10px"/>
	<br/>
	${user.email }
	
	<ol style="margin:0 0 0 30px">
	<c:forEach items="${projects }" var="project">
		<li><a href="<c:url value="/projects/${project.project.id }"/>">${project.project.projeto }</a> - (<fmt:formatDate value="${project.project.dataDeCriacao }" type="date" pattern="dd/MM/yyyy"/>)</li>
	</c:forEach>
	</ol>
	
</div>

<%@ include file="../commons/footer.jsp" %>