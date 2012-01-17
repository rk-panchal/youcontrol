<%@ include file="../commons/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/easyTooltip.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.limit-1.2.source.js"/>"></script>
<div id="content-main">
	<h2 class="projeto">Projeto ${project.projeto} > Nova Vers�o</h2>
</div>
<div id="content-general">
	<form action="<c:url value="/projects/${project.id}/version/new"/>" method="post" id="newVersion">
		<fieldset class="first">
			<legend>Informa��es</legend>
			
			<p style="margin-top:20px">
				<label for="version_name">
					Nome da vers�o <img src="<c:url value="/imgs/help.png"/>" class="help" title="Informe um nome para a sua vers�o" />
				</label>
				<input type="text" name="version.name" id="version_name" class="required" size="30" maxlength="255" />
			</p>
			
			<%
			/*
			<p style="margin-top:20px">
				<label for="version_name">
					Data da cria��o <img src="<c:url value="/imgs/help.png"/>" class="help" title="Informe o dia da cria��o da vers�o" />
				</label>
				<input type="text" name="version.name" id="version_name" size="30" maxlength="255" />
			</p> 
			
			<p style="margin-top:20px">
				<label for="version_name">
					Data da libera��o <img src="<c:url value="/imgs/help.png"/>" class="help" title="Informe o dia da libera��o da vers�o" />
				</label>
				<input type="text" name="version.name" id="version_name" size="30" maxlength="255" />
			</p>
			*/
			 %>
		</fieldset>
		<fieldset>
			<p>
				<label for="version_description">
					Descri��o <img src="<c:url value="/imgs/help.png"/>" class="help" title="Descreva, resenhe, fale sobre a vers�o do seu projeto!" />
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