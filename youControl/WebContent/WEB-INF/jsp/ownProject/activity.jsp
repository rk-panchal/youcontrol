<%@ include file="../commons/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/jquery.collapse.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.cookie.js"/>"></script>
<script>document.documentElement.className = "js";</script>

<link rel="stylesheet" type="text/css" href="<c:url value="/css/tablesorter.css"/>" media="screen" />
<script type="text/javascript" src="<c:url value="/js/jquery.tablesorter.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.tablesorter.pager.js"/>"></script>
<div id="content-main">
	<h2 class="atividade">Atividades: ${userWeb.project.projeto }</h2>
</div>
<div id="content-general">
	<div id="options" style="width:100%">
		<form id="activityForm">
		
			<fieldset class="collapsable">
				<legend class="linkColl">Filtros</legend>
				
				<div>
					<h1 style="margin-top:10px">Funcionalidade em construção</h1>
				</div>
			</fieldset>
			
			<fieldset class="collapsable">
				<legend class="linkColl">Opções</legend>
				<div>
				
					<table style="margin-top:10px">
						<tr>
							<td><label for="columnsAvailable">Colunas: </label></td>
							<td><table>
								<tr>
									<td style="padding:0px 20px">Colunas disponíveis</td>
									<td></td>
									<td>Colunas selecionadas</td>
								</tr>
								<tr>
									<td>
										<select multiple id="columnsAvailable">
											<option value="criticidade">Criticidade</option>
											<option value="prioridade">Prioridade</option>
											<option value="concluido">Concluído</option>
										</select>
									</td>
									<td>
										<a href="#" id="add" title="Adicionar" style="padding:0px 20px"><img src="<c:url value="/imgs/arrowright.png"/>" /></a><br/>
										<a href="#" id="remove" title="Remover" style="padding:0px 20px"><img src="<c:url value="/imgs/arrowleft.png"/>" /></a>
									</td>
									<td>
										<select multiple id="columnsSelected">
											<option value="id">ID</option>
											<option value="resumo">Resumo</option>
											<option value="atribuido">Atribuido para</option>
											<option value="dataCriacao">Data de criação</option>
											<option value="autor">Autor</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="text-align:right"><a href="#" id="addAll">Adicionar todos</a></td>
									<td></td>
									<td style="text-align:right"><a href="#" id="removeAll">Remover todos</a></td>
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
	
	<table id="activies" style="width:100%; padding-top:20px;">
		<thead>
			<tr>
				<th><input type="checkbox" value="0" id="marcar-todos" name="marcar-todos"/></th>
				<th>ID</th>
				<th>Resumo</th>
				<th>Criado por</th>
				<th>Criado em</th>
				<th>Atribuido para</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${atividades }" var="atividade">
				<tr>
					<td><input type="checkbox" value="1" /></td>
					<td><a href="<c:url value="/activity/${atividade.id }"/>">${atividade.id }</a></td>
					<td><a href="<c:url value="/activity/${atividade.id }"/>">${atividade.resumo }</a></td>
					<td><a href="#">${atividade.criador.nome }</a></td>
					<td><fmt:formatDate value="${atividade.dataCriacao }" type="date" pattern="dd/MM/yyyy"/></td>
					<td>
						<c:if test="${atividade.responsavel.nome == null}">
							tarefa não atribuida
						</c:if>
						<c:if test="${atividade.responsavel.nome != null}">
							<a href="#">${atividade.responsavel.nome }</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div id="pager" class="pager">
    	<form style="width:100%">
				<span style="float:right; margin-right:20px">
					Exibir <select class="pagesize" style="width:70px">
							<option selected="selected"  value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option  value="40">40</option>
					</select> registros por página
				</span>

			<img src="<c:url value="/imgs/table/first.png"/>" class="first"/>
    		<img src="<c:url value="/imgs/table/prev.png"/>" class="prev"/>
    		<input type="text" class="pagedisplay"/>
    		<img src="<c:url value="/imgs/table/next.png"/>" class="next"/>
    		<img src="<c:url value="/imgs/table/last.png"/>" class="last"/>
    	</form>
    </div>
	
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
	
	/* TABLE OF ACTIVITIES */
	$(function(){
      $('table#activies > tbody > tr:odd').addClass('odd');
      
      $('table#activies > tbody > tr').hover(function(){
        $(this).toggleClass('hover');
      });
      
      $('#marcar-todos').click(function(){
        $('table#activies > tbody > tr > td > :checkbox')
          .attr('checked', $(this).is(':checked'))
          .trigger('change');
      });
      
      $('table#activies > tbody > tr > td > :checkbox').bind('click change', function(){
        var tr = $(this).parent().parent();
        if($(this).is(':checked')) $(tr).addClass('selected');
        else $(tr).removeClass('selected');
      });
      
      $("table#activies").tablesorter({
 		dateFormat: 'uk',
        headers: {
          0: {
            sorter: false
          }
        }
      }).tablesorterPager({container: $("#pager")}).bind('sortEnd', function(){
      	$('table#activies > tbody > tr').removeClass('odd');
        $('table#activies > tbody > tr:odd').addClass('odd');
      });
  	});
	
	$("#main ul li.atividade a").addClass("selected");
</script>

<%@ include file="../commons/footer.jsp" %>