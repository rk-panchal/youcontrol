<%@ include file="../commons/header.jsp" %>
<div id="content-main">
	<h2 class="projeto">Projetos</h2>
</div>
<div id="content-general">
	<div id="tipoVisualizacao">
		<span id="grid_view" title="Modo visualização grid">Grid</span>
		<span id="list_view" class="active" title="Modo visualização de lista">Lista</span>
	</div>
	<a href="<c:url value="/projects/new"/>" class="submit">Criar projeto</a>
	<div id="visualizacao">
		<ul class="list" style="margin-top:10px">
			<c:forEach items="${projetos }" var="projeto">
				<li><a href="<c:url value="/choose/${projeto.project.id }"/>">${projeto.project.projeto }</a> - ${projeto.role } (${projeto.project.dataDeCriacao })</li>
			</c:forEach>
		</ul>
	</div>
</div>
<script>
	$("#main ul li.projetos a").addClass("selected");
	$('#grid_view').click(function(e) {
		$('#visualizacao ul').removeClass().addClass('grid');
		$('#list_view').removeClass();
		$(this).addClass('active');
	});
	$('#list_view').click(function(e) {
		$('#visualizacao ul').removeClass().addClass('list');
		$('#grid_view').removeClass();
		$(this).addClass('active');
	});
</script>
<style>
	#visualizacao ul { list-style:none; margin-left:-20px; }
	#visualizacao ul li { padding:20px; }
	#visualizacao ul.grid li { float:left; width:20%; height:50px; }
</style>
<%@ include file="../commons/footer.jsp" %>