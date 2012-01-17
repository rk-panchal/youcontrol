<%@ include file="../commons/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/easyTooltip.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.limit-1.2.source.js"/>"></script>
<div id="content-main">
	<h2 class="projeto">Projeto ${project.projeto} > Nova Versão</h2>
</div>
<div id="content-general">
	<form action="<c:url value="/projects/${project.id}/version/new"/>" method="post" id="newVersion">
		<fieldset class="first">
			<legend>Informações</legend>
			
			<p style="margin-top:20px">
				<label for="version_name">
					Nome da versão <img src="<c:url value="/imgs/help.png"/>" class="help" title="Informe um nome para a sua versão" />
				</label>
				<input type="text" name="version.name" id="version_name" class="required" size="30" maxlength="255" />
			</p>
			
			<%
			/*
			<p style="margin-top:20px">
				<label for="version_name">
					Data da criação <img src="<c:url value="/imgs/help.png"/>" class="help" title="Informe o dia da criação da versão" />
				</label>
				<input type="text" name="version.name" id="version_name" size="30" maxlength="255" />
			</p> 
			
			<p style="margin-top:20px">
				<label for="version_name">
					Data da liberação <img src="<c:url value="/imgs/help.png"/>" class="help" title="Informe o dia da liberação da versão" />
				</label>
				<input type="text" name="version.name" id="version_name" size="30" maxlength="255" />
			</p>
			*/
			 %>
		</fieldset>
		<fieldset>
			<p>
				<label for="version_description">
					Descrição <img src="<c:url value="/imgs/help.png"/>" class="help" title="Descreva, resenhe, fale sobre a versão do seu projeto!" />
				</label>
				<textarea rows="15" cols="50" name="version.description" class="required" id="version_description"></textarea>
				<label><span id="restantes"></span> caracteres restantes</label>
			</p>
		</fieldset>
		<p class="submit">
			<input type="submit" value="Criar" />
			<input type="reset" value="Limpar" />
		</p>
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function(){	
		$("img.help").easyTooltip();
		$('textarea').limit(700, '#restantes');
		$('#newVersion').validate();
	});
	$("#main ul li.projetos a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>