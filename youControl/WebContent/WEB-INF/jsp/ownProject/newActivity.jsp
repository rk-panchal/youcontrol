<%@ include file="../commons/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/easyTooltip.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.limit-1.2.source.js"/>"></script>
<div id="content-main">
	<h2 class="projeto">Atividades > Nova atividade</h2>
</div>
<div id="content-general">
	<form action="<c:url value="/activity/new"/>" method="post" id="newActivity">
		<fieldset class="first">
			<legend>Informações</legend>
			
			<p style="margin-top:20px">
				<label for="resumo">
					Resumo <img src="<c:url value="/imgs/help.png"/>" class="help" title="Resuma a atividade que será criada" />
				</label>
				<input type="text" name="activity.resumo" id="resumo" class="required" size="30" maxlength="255" />
			</p> 
			<p>
				<label for="responsavel">
					Atribuir para <img src="<c:url value="/imgs/help.png"/>" class="help" title="Quem deve ficar responsável por esta tarefa?" />
				</label>
				<select name="activity.responsavel.id" id="responsavel">
					<option value="">Não atribuir esta atividade</option>
					<c:forEach items="${usuarios }" var="user">
						<option value="${user.user.id }">${user.user.nome }</option>
					</c:forEach>
				</select>
			</p>
			
			<p>
				<label for="responsavel">
					Versões <img src="<c:url value="/imgs/help.png"/>" class="help" title="Esta atividade está relacionada a quais versões?" />
				</label>
				<select name="versions" id="activity_versions" multiple="multiple">
					<option value=""></option>
					<c:forEach items="${versions}" var="version">
						<option value="${version.id}">${version.name}</option>
					</c:forEach>
				</select>
			</p>
		</fieldset>
		<fieldset>
			<p>
				<label for="descricao">
					Descrição <img src="<c:url value="/imgs/help.png"/>" class="help" title="Descreva, resenhe, sobre a atividade" />
				</label>
				<textarea rows="15" cols="50" name="activity.descricao" class="required" id="descricao"></textarea>
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
		$('#newActivity').validate();
	});
	$("#main ul li.atividade a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>