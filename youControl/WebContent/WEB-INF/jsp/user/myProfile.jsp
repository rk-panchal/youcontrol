<%@ include file="../commons/header.jsp" %>

<script type="text/javascript" src="<c:url value="/js/easyTooltip.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.validate.js"/>"></script>

<div id="content-main">
	<h2 class="inicio">Meu perfil</h2>
</div>
<div id="content-general">
	<form action="<c:url value="/image/user/${userWeb.user.id }"/>" method="post" enctype="multipart/form-data" id="formFoto">
		<fieldset>
			<legend>Alterar foto</legend>
			<img src="<c:url value="/image/user/${userWeb.user.id }"/>" alt="${userWeb.user.nome }" style="width:80px; height:150px; margin-top:10px"/>
			<input type="file" name="arquivo" />
			<input type="submit" value="Alterar foto" />
		</fieldset>
	</form>
	
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
	<div id="vis" class="gridV">
		<c:forEach items="${projetos }" var="projeto">
			<div class="projBox">
				<div class="topDetails">
					<span class="left">${projeto.project.publicoAlvo }</span>
					<span class="right"><fmt:formatDate value="${projeto.project.dataDeCriacao }" type="date" pattern="dd/MM/yyyy"/></span>
					<span class="right">31 usuários</span>
				</div>
				<div class="details">
					<div class="imgDetails">
						<a href="<c:url value="/projects/${projeto.project.id }"/>">
							<img src="<c:url value="/image/project/${projeto.project.id }"/>" alt="${projeto.project.projeto }" />
						</a>
					</div>
					<div class="textDetails">
						<span class="projTit"><a href="<c:url value="/projects/${projeto.project.id }"/>">${projeto.project.projeto }</a></span>
						<p>${projeto.project.descricao }</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div style="clear:both"></div>
</div>

<script type="text/javascript">
	$("#main ul li.perfil a").addClass("selected");
	$(document).ready(function(){	
		$("img.help").easyTooltip();
		$('#myData').validate();
	});
</script>
<%@ include file="../commons/footer.jsp" %>