<%@ include file="../commons/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/jquery.collapse.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.cookie.js"/>"></script>
<script>document.documentElement.className = "js";</script>

<div id="content-main">
	<h2 class="atividade">Atividades: ${userWeb.project.projeto }</h2>
</div>
<div id="content-general">
	<div id="options" style="width:100%">
		<form id="activityForm">
		
			<fieldset class="collapsable">
				<legend class="linkColl">Filtros</legend>
				
				<div>
					<h1>Funcionalidade em construção</h1>
				</div>
			</fieldset>
			
			<fieldset class="collapsable">
				<legend class="linkColl">Opções</legend>
				<div>
				
					<table>
						<tr>
							<td><label for="columnsAvailable">Colunas: </label></td>
							<td><table>
								<tr>
									<td style="padding:0px 20px">Colunas disponíveis</td>
									<td style="padding:0px 20px">Colunas selecionadas</td>
								</tr>
								<tr>
									<td>
										<select multiple id="columnsAvailable">
											<option value="criticidade">Criticidade</option>
											<option value="prioridade">Prioridade</option>
											<option value="concluido">Concluído</option>
											<option value="id">ID</option>
										</select>
									</td>
									<td>
										<select multiple id="columnsSelected">
											<option value="resumo">Resumo</option>
											<option value="atribuido">Atribuido para</option>
											<option value="dataCriacao">Data de criação</option>
											<option value="autor">Autor</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="padding:0px 20px"><a href="#" id="add">Adicionar</a> <a href="#" id="addAll">Adicionar todos</a></td>
									<td style="padding:0px 20px"><a href="#" id="remove">Remover</a> <a href="#" id="removeAll">Remover todos</a></td>
								</tr>
							</table></td>
						</tr>
					</table>
					
				</div>
			</fieldset>
		</form>
	</div>
	
	<div id="menuActivity">
		<a href="#" class="apply" title="Aplicar e atualizar lista"></a>
		<a href="#" class="resetActivity" title="Reset filtros e opções"></a>
		<a href="#" class="deleteSelected" title="Deletar selecionadas"></a>
		<a href="<c:url value="/activity/new"/>" class="createActivity" title="Criar atividade"></a>
	</div>
	
	<table style="width:100%; padding-top:20px;">
		<tr>
			<td>ID</td>
			<td>Resumo</td>
			<td>Criado por</td>
			<td>Criado em</td>
			<td>Atribuido para</td>
		</tr>
		<c:forEach items="${atividades }" var="atividade">
			<tr>
				<td><a href="<c:url value="/activity/${atividade.id }"/>">${atividade.id }</a></td>
				<td>${atividade.resumo }</td>
				<td>${atividade.criador.nome }</td>
				<td><fmt:formatDate value="${atividade.dataCriacao }" type="date" pattern="dd/MM/yyyy"/></td>
				<td>
					<c:if test="${atividade.responsavel.nome == null}">
						tarefa não atribuida
					</c:if>
					<c:if test="${atividade.responsavel.nome != null}">
						${atividade.responsavel.nome }
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</div>

<script>
	/* ADD AND REMOVE OPTIONS */
	$('#add').click(function() {  
		return !$('#columnsAvailable option:selected').remove().appendTo('#columnsSelected');  
	});  
	$('#remove').click(function() {  
		return !$('#columnsSelected option:selected').remove().appendTo('#columnsAvailable');  
	});  
	$('#addAll').click(function() {
		$('#columnsAvailable option').each(function(i) {
			$(this).remove().appendTo('#columnsSelected');
		});
	});
	$('#removeAll').click(function() {
		$('#columnsSelected option').each(function(i) {
			$(this).remove().appendTo('#columnsAvailable');
		});
	});
	
	/* COLLAPSABLE FIELDS */
	$(".collapsable").collapse({
		head: "legend.linkColl", 
		show: function(){
			this.animate({
				opacity: 'toggle', 
				height: 'toggle'
			}, 300);
        }, hide: function() {
			this.animate({
				opacity: 'toggle', 
				height: 'toggle'
			}, 300);
        }
	});
	
	/* SELECTING ALL ELEMENTS TO SUBMIT */
	/*$('form').submit(function() {  
		$('#select2 option').each(function(i) {  
			$(this).attr("selected", "selected");  
		});  
	});*/
	
	$("#main ul li.atividade a").addClass("selected");
</script>

<%@ include file="../commons/footer.jsp" %>