<%@ include file="../commons/header.jsp" %>
<div id="content-main">
	<h2 class="atividade">Atividades</h2>
</div>
<div id="content-general">

	<div id="controls">
		<a href="#" class="atualizar">Atualizar</a>
		<a href="#" class="acompanhar">Acompanhar</a>
		<a href="#" class="anexar">Anexar documento</a>
	</div>
	
	<div id="issueBox">
		<h2>${atividade.resumo }</h2>
		<div id="detailTop">
			<a href="#"><img src="<c:url value="/image/user/${atividade.criador.id }"/>" alt="${atividade.criador.nome }" /></a>
			<p>Criado por <a href="#">${atividade.criador.nome }</a><br />Última atualização em: 04/01/2012</p>
		</div>
		<div id="detail">
			<div class="detailLeft">
				<span class="detailTitle">Criticidade: </span><span>${atividade.criticidade }</span><br />
				<span class="detailTitle">Prioridade: </span><span>${atividade.prioridade }</span><br />
				<span class="detailTitle">Atribuido para: </span><span><a href="#">${atividade.responsavel.nome }</a></span><br />
				<span class="detailTitle">Projeto: </span><span>${atividade.projeto.projeto }</span><br />
			</div>
			<div class="detailRight">
				<span class="detailTitle">Início: </span><span><fmt:formatDate value="${atividade.dataCriacao }" type="date" pattern="dd/MM/yyyy - hh:mm"/></span><br />
				<span class="detailTitle">Data prevista: </span><span>-</span><br />
				<span class="detailTitle">Concluído: </span><span>0%</span><br />
				<span class="detailTitle">Tempo gasto: </span><span>-</span><br />
				<span class="detailTitle">Versão(s): </span>
				<span>
					<ul>
						<c:forEach items="${atividade.versions}" var="version">
							<li>${version.name}</li>
						</c:forEach>
					</ul>
				</span><br />
			</div>
		</div>
		<hr />
		<div id="description">
			<span class="detailTitle">Descrição</span>
			<p><pre>${atividade.descricao }</pre></p>
		</div>
	</div>
	
	<div id="commentsBox">
		<h2>Comentários (${qtdComentarios })</h2>
		<form action='' method="post" id="commentForm">
			<div id="voce" style="width:10%; float:left; text-align:right">
				<img src="<c:url value="/image/user/${userWeb.user.id }"/>" alt="${userWeb.user.nome }" style="width:70px; height:80px; margin-right:10px; margin-top:5px"/>
			</div>
			<div id="texto" style="float:left; width:90%">
				<textarea name="comment.comentario" id="comentario" rows=4></textarea>
			</div>
			<input type="submit" value="Comentar" style="margin-top:10px; float:right" /> 
			<img src="<c:url value="/imgs/loader-ajax.gif"/>" class="loaderajax" id="loaderajaxload" />
			<img src="<c:url value="/imgs/certo.gif"/>" class="loaderajax" id="loaderajaxok" />
		</form>
		
		<div style="height:15px; width:100%; clear:both"></div>
		
		<c:if test="${empty comentarios}">
			<div class="commentText"> 
				<p style="text-align:center">Nenhum comentário / histórico.</p>
			</div>
		</c:if> 
		<hr />
		<c:if test="${not empty comentarios}">
			<c:forEach items="${comentarios }" var="comentario">
				<div class="commentText">
					<p class="detail"><span class="detailComment"><fmt:formatDate value="${comentario.dataCriacao }" type="date" pattern="dd/MM/yyyy - hh:mm"/> por <a href="#">${comentario.usuario.nome }</a></span></p>
					<img src="<c:url value="/image/user/${comentario.usuario.id }"/>" alt="usuario" />
					<p>${comentario.comentario }</p>
				</div>
				<hr />
			</c:forEach>
		</c:if>
	</div>

</div>
<script>
	$("#main ul li.atividade a").addClass("selected");
	$("#comentario").puts("Escreva o seu comentário...");
	
	$("#commentForm").submit(function() {
		$("#loaderajaxload").fadeIn();
		
		$.post('<c:url value="/activity/${atividade.id }/comment" />', {'comment.comentario': $('#comentario').val()}, function(data) {
			$("#loaderajaxload").fadeOut();
			$("#loaderajaxok").fadeIn(1000);
			document.location='<c:url value="/activity/${atividade.id }"/>';
        });
		return false;
	});
</script>
<%@ include file="../commons/footer.jsp" %>