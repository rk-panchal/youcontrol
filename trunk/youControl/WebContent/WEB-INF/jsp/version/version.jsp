<%@ include file="../commons/header.jsp" %>
<script type="text/javascript" src="<c:url value="/js/jquery.collapse.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.cookie.js"/>"></script>
<script>document.documentElement.className = "js";</script>

<link rel="stylesheet" type="text/css" href="<c:url value="/css/tablesorter.css"/>" media="screen" />
<script type="text/javascript" src="<c:url value="/js/jquery.tablesorter.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.tablesorter.pager.js"/>"></script>
<div id="content-main">
	<h2 class="activity">Projeto: ${userWeb.project.projeto } > Versão ${version.name }</h2>
</div>
<div id="content-general">
	<div id="options" style="width:100%">

		<div id="menuActivity" style="padding:10px 0; min-height:47px">
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
			<c:forEach items="${activities }" var="activity">
				<tr>
					<td><input type="checkbox" value="1" /></td>
					<td><a href="<c:url value="/activity/${activity.id }"/>">${activity.id }</a></td>
					<td><a href="<c:url value="/activity/${activity.id }"/>">${activity.resumo }</a></td>
					<td><a href="<c:url value="/users/${activity.criador.id }"/>">${activity.criador.nome }</a></td>
					<td><fmt:formatDate value="${activity.dataCriacao }" type="date" pattern="dd/MM/yyyy"/></td>
					<td>
						<c:if test="${activity.responsavel.nome == null}">
							-
						</c:if>
						<c:if test="${activity.responsavel.nome != null}">
							<a href="<c:url value="/users/${activity.responsavel.id }"/>">${activity.responsavel.nome }</a>
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
      }).tablesorterPager({container: $("#pager, #pager2")}).bind('sortEnd', function(){
      	$('table#activies > tbody > tr').removeClass('odd');
        $('table#activies > tbody > tr:odd').addClass('odd');
      });
  	});
	
	$("#main ul li.activity a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>