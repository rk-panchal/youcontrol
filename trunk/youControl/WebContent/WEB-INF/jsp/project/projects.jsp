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

	<div id="vis" class="listV">
		<c:forEach items="${projetos }" var="projeto">
			<div class="projBox">
				<div class="topDetails">
					<span class="left">Por Vinícius Michelutti</span>
					<span class="right">Janeiro 03, 2012</span>
					<span class="right">31 usuários</span>
				</div>
				<div class="details">
					<div class="imgDetails">
						<a href="<c:url value="/choose/${projeto.project.id }"/>">
							<img src="<c:url value="/image/project/${projeto.project.id }"/>" alt="${projeto.project.projeto }" />
						</a>
					</div>
					<div class="textDetails">
						<span class="projTit"><a href="<c:url value="/choose/${projeto.project.id }"/>">${projeto.project.projeto }</a></span>
						<p>${projeto.project.descricao }</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div style="clear:both"></div>
</div>

<script>
	$("#main ul li.projetos a").addClass("selected");
	$('#grid_view').click(function(e) {
		$('#vis').removeClass().addClass('gridV');
		$('#list_view').removeClass();
		$(this).addClass('active');
	});
	$('#list_view').click(function(e) {
		$('#vis').removeClass().addClass('listV');
		$('#grid_view').removeClass();
		$(this).addClass('active');
	});
</script>
<%@ include file="../commons/footer.jsp" %>