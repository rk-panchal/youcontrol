<%@ include file="../commons/header.jsp" %>

<script type="text/javascript" src="<c:url value="/js/easyTooltip.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.validate.js"/>"></script>

<div id="content-main">
	<h2 class="perfil">Meu perfil</h2>
</div>
<div id="content-general">

	<div id="issueBox">
		<h2>${userWeb.user.nome }</h2>
		<div id="detailTop">
			<a href="#"><img src="<c:url value="/image/user/${userWeb.user.id }"/>" alt="${userWeb.user.nome }" style="width:80px; height:80px"/></a>
			<p>${userWeb.user.email }<br />Registrado em <fmt:formatDate value="${userWeb.user.dataDeCriacao }" type="date" pattern="dd/MM/yyyy - hh:mm"/></p>
		
			<form action="<c:url value="/image/user/${userWeb.user.id }"/>" method="post" enctype="multipart/form-data" id="formFoto">
				<input type="file" name="arquivo" />
				<input type="submit" value="Alterar foto" />
			</form>
		</div>
	</div>

	<form action="<c:url value="/users/profile"/>" method="post" id="myData">
		<fieldset>
			<legend style="padding-top:10px">Meus dados</legend>
			
			<p style="margin-top:20px">
				<label for="name">
					Nome <img src="<c:url value="/imgs/help.png"/>" class="help" title="Como podemos chamá-lo?" />
				</label>
				<input type="text" name="user.nome" id="name" class="required" maxlength="255" value="${userWeb.user.nome }" />
			</p>
			<p>
				<label for="email">
					Email <img src="<c:url value="/imgs/help.png"/>" class="help" title="Utilizamos este e-mail para notificá-lo sobre todas suas pendências em projetos" />
				</label>
				<input type="text" name="user.email" id="email" class="required" maxlength="255" value="${userWeb.user.email }" />			
			</p>
			<p>
				<label for="password">
					Senha <img src="<c:url value="/imgs/help.png"/>" class="help" title="Altere sua senha de acesso." />
				</label>
				<input type="password" name="user.senha" class="required" id="password" />
			</p>
			<p>
				<label for="password2">
					Repita sua senha <img src="<c:url value="/imgs/help.png"/>" class="help" title="Para sua segurança, repita sua senha." />
				</label>
				<input type="password" name="password2" id="password2" />
			</p>
		</fieldset>
		<p class="submit">
			<input type="submit" value="Alterar dados" />
		</p>
	</form>
	
	<form style="padding-bottom:15px">
		<fieldset>
			<legend>Meus projetos</legend>
		</fieldset>
	</form>
	<div style="clear:both"></div>
	<ol style="margin:10px 0 0 30px">
		<c:forEach items="${projetos }" var="project">
			<li><a href="<c:url value="/projects/${project.project.id }"/>">${project.project.projeto }</a> - (<fmt:formatDate value="${project.project.dataDeCriacao }" type="date" pattern="dd/MM/yyyy"/>)</li>
		</c:forEach>
	</ol>
	
</div>

<script type="text/javascript">
	$("#main ul li.perfil a").addClass("selected");
	$(document).ready(function(){	
		$("img.help").easyTooltip();
		$('#myData').validate();
	});
</script>
<%@ include file="../commons/footer.jsp" %>