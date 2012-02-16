<%@ include file="../commons/init.jsp" %>
<div id="content-main">
	<h2 class="atividade">Atividades > ${action.label }</h2>
</div>
<div id="content-general">
	<form action="<c:url value="/project/${userWeb.project.id}/activity/save"/>" method="post" id="activityForm">
		<fieldset class="first">
			<legend>Informa��es</legend>
			
			<input type="hidden" name="activity.id" id="activity.id" value="${activity.id }"/>
			
			<p style="margin-top:20px">
				<label for="activity.summary">
					Resumo <img src="<c:url value="/imgs/help.png"/>" class="help" title="Resuma a atividade que ser� criada" />
				</label>
				<input type="text" name="activity.summary" id="activity.summary" value="${activity.summary }" class="required" size="30" maxlength="255" />
			</p> 
			<p>
				<label for="activity.assignedTo.id">
					Atribuir para <img src="<c:url value="/imgs/help.png"/>" class="help" title="Quem deve ficar respons�vel por esta tarefa?" />
				</label>
				<select name="activity.assignedTo.id" id="activity.assignedTo.id">
					<option value="">N�o atribuir esta atividade</option>
					
					<c:forEach items="${users}" var="user">
						<option <c:if test="${user==activity.assignedTo }">selected</c:if> value="${user.id }">
							${user.nome }
						</option>
					</c:forEach>
				</select>
			</p>
			
			<p>
				<label for="activity.versions">
					Vers�es <img src="<c:url value="/imgs/help.png"/>" class="help" title="Esta atividade est� relacionada a quais vers�es?" />
				</label>
				<select name="activity.versions" id="activity.versions" multiple="multiple">
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
					Descri��o <img src="<c:url value="/imgs/help.png"/>" class="help" title="Descreva, resenhe, sobre a atividade" />
				</label>
				<textarea rows="15" cols="50" name="activity.description" class="required" id="activity.description" >${activity.description}</textarea>
				<label><span id="restantes"></span> caracteres restantes</label>
			</p>
		</fieldset>
		<p class="submit">
			<input type="submit" value="Salvar" />
		</p>
	</form>
</div>


<script type="text/javascript">
	$(document).ready(function(){	
		$("img.help").easyTooltip();
		$('textarea').limit(700, '#restantes');
		$('#activityForm').validate();
	});
	$("#main ul li.atividade a").addClass("selected");
</script>