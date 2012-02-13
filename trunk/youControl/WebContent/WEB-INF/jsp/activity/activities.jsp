<%@ include file="../commons/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/tablesorter.css"/>" media="screen" />
<script type="text/javascript" src="<c:url value="/js/jquery.tablesorter.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.tablesorter.pager.js"/>"></script>

<style>
</style>


<div id="content-main">
	<h2 class="atividade">Atividades: ${userWeb.project.projeto }</h2>
</div>
<div id="content-general">
	<div style="display:none">
		<div id="activityForm"></div>
	</div>
	
	<div id="optionsBox">
		<div id="boxTitle">
			<span>Filtros e opções</span>
			<span class="minimize"></span>
		</div>
		<div id="boxBody">
			<table>
				<tr>
					<td><table>
						<tr>
							<td style="padding:0px 20px 0 0">Colunas disponíveis</td>
							<td></td>
							<td>Colunas selecionadas</td>
						</tr>
						<tr>
							<td>
								<select multiple id="columnsAvailable" style="margin-left:0px">
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
	</div>

	<div id="menuActivity" style="padding:10px 0; min-height:47px">
		<a href="#" class="apply" alt="Aplicar e atualizar lista"></a>
		<a href="#" class="resetActivity" alt="Reset filtros e opções"></a>
		<a href="#" class="deleteSelected" alt="Deletar selecionadas"></a>
		<a href="#activityForm" id="createActivity" class="createActivity" alt="Criar atividade"></a>
		
		<div id="pager2" class="pager">
	    	<form style="float:right;">
				<span>
					por página <select class="pagesize" style="width:70px">
							<option selected="selected"  value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option  value="40">40</option>
					</select>
				</span>
	    	</form>
	    </div>
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
					<td><a href="<c:url value="/users/${atividade.criador.id }"/>">${atividade.criador.nome }</a></td>
					<td><fmt:formatDate value="${atividade.dataCriacao }" type="date" pattern="dd/MM/yyyy"/></td>
					<td>
						<c:if test="${atividade.responsavel.nome == null}">
							-
						</c:if>
						<c:if test="${atividade.responsavel.nome != null}">
							<a href="<c:url value="/users/${atividade.responsavel.id }"/>">${atividade.responsavel.nome }</a>
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
	/* TOOLTIP MENU */
	$('#menuActivity a').append('<span></span>');
	$('#menuActivity a').hover(
		function(){
			$(this).find('span').animate({opacity:'show', top: '46'}, 0);
			var hoverTexts = $(this).attr('alt');
			$(this).find('span').text(hoverTexts);
		},
		function(){
			$(this).find('span').animate({opacity:'hide', top: '-90'}, 0);
		}
	);

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
      }).tablesorterPager({container: $("#pager, #pager2")}).bind('sortEnd', function(){
      	$('table#activies > tbody > tr').removeClass('odd');
        $('table#activies > tbody > tr:odd').addClass('odd');
      });
  	});
	
	$("#main ul li.atividade a").addClass("selected");
	
	
	$(document).ready(function() {
		$("#createActivity").colorbox({width:"800px", height:"600px",inline:true, onLoad: function(){
			$.ajax({
				  url: '<c:url value="/project/${userWeb.project.id }/activity/add"/>',
				  success: function( data ) {
					$('#activityForm').html(data);
				  }
				});
		}});		
	});
	
	
</script>
<%@ include file="../commons/footer.jsp" %>