<%@ include file="../commons/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/easyTooltip.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.limit-1.2.source.js"/>"></script>
<div id="content-main">
	<h2 class="projeto">Projetos > Novo Projeto</h2>
</div>
<div id="content-general">
	<form action="<c:url value="/projects/new"/>" method="post" id="newProject">
		<fieldset class="first">
			<legend>Informações</legend>
			
			<p style="margin-top:20px">
				<label for="nome">
					Projeto <img src="<c:url value="/imgs/help.png"/>" class="help" title="Nomeie o seu projeto para identificá-lo!" />
				</label>
				<input type="text" name="project.projeto" id="nome" class="required" size="30" maxlength="255" />
			</p> 
			<p>
				<label for="publico-alvo">
					Público alvo <img src="<c:url value="/imgs/help.png"/>" class="help" title="A quem o seu projeto se destina? ex: pessoas, empresas..." />
				</label>
				<input type="text" name="project.publicoAlvo" id="publicoalvo" class="required" size="30" maxlength="255" />
			</p>
			<p>
				<label for="status">
					Status <img src="<c:url value="/imgs/help.png"/>" class="help" title="Qual a situação atual do projeto a ser criado?" />
				</label>
				<select name="project.status" id="status">
					<option value="estruturando">Concepção de idéia</option>
					<option value="planejamento">Planejamento</option>
					<option value="desenvolvimento">Desenvolvimento</option>
					<option value="entregar">A entregar</option>
					<option value="concluido">Concluído</option>
				</select>
			</p>
		</fieldset>
		<fieldset>
			<p>
				<label for="descricao">
					Descrição <img src="<c:url value="/imgs/help.png"/>" class="help" title="Descreva, resenhe, fale sobre seu projeto!" />
				</label>
				<textarea rows="15" cols="50" name="project.descricao" class="required" id="descricao"></textarea>
				<label><span id="restantes"></span> caracteres restantes</label>
			</p>
		</fieldset>
		<p class="submit">
			<input type="submit" value="Criar projeto" />
			<input type="reset" value="Limpar" />
		</p>
	</form>
</div>

<script type="text/javascript">
	$(document).ready(function(){	
		$("img.help").easyTooltip();
		$('textarea').limit(700, '#restantes');
		$('#newProject').validate();
	});
	$("#main ul li.projetos a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>