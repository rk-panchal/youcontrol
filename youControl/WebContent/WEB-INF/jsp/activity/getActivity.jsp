<%@ include file="../commons/header.jsp" %>

<script type="text/javascript" src="<c:url value="/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.limit-1.2.source.js"/>"></script>

<script type="text/javascript" src="<c:url value="/js/jquery.colorbox.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/colorbox.css"/>"/>

<div id="content-main">
	<h2 class="atividade">Atividades</h2>
</div>
<div id="content-general">

	<div id="controls">
		<a href="#editarAtividade" class="atualizar">Atualizar</a>
		<a href="#" class="acompanhar">Acompanhar</a>
		<a href="#" class="anexar">Anexar documento</a>
	</div>
	
	<div id="issueBox">
		<h2>${atividade.resumo }</h2>
		<div id="detailTop">
			<a href="<c:url value="/users/${atividade.criador.id }"/>"><img src="<c:url value="/image/user/${atividade.criador.id }"/>" alt="${atividade.criador.nome }" /></a>
			<p>Criado por <a href="<c:url value="/users/${atividade.criador.id }"/>">${atividade.criador.nome }</a><br />Última atualização em: 04/01/2012</p>
		</div>
		<div id="detail">
			<div class="detailLeft">
				<span class="detailTitle">Criticidade: </span><span>${atividade.criticidade }</span><br />
				<span class="detailTitle">Prioridade: </span><span>${atividade.prioridade }</span><br />
				<span class="detailTitle">Atribuido para: </span><span><a href="<c:url value="/users/${atividade.responsavel.id }"/>">${atividade.responsavel.nome }</a></span><br />
				<span class="detailTitle">Projeto: </span><span>${atividade.projeto.projeto }</span><br />
			</div>
			<div class="detailRight">
				<span class="detailTitle">Início: </span><span><fmt:formatDate value="${atividade.dataCriacao }" type="date" pattern="dd/MM/yyyy - hh:mm"/></span><br />
				<span class="detailTitle">Data prevista: </span><span>-</span><br />
				<span class="detailTitle">Concluído: </span><span>0%</span><br />
				<span class="detailTitle">Tempo gasto: </span><span>-</span><br />
				<span class="detailTitle">Versão(ões): </span>
				<span>
					<c:forEach items="${atividade.versions}" var="version">
						${version.name} 
					</c:forEach>
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
					<p class="detail"><span class="detailComment"><fmt:formatDate value="${comentario.dataCriacao }" type="date" pattern="dd/MM/yyyy - hh:mm"/> por <a href="<c:url value="/users/${comentario.usuario.id }"/>">${comentario.usuario.nome }</a></span></p>
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

<!-- UPDATE ACTIVITY -->
<div style='display:none'>
	<div id="editarAtividade">
		<div id="content-main">
			<h2 class="atividade">Editar atividade</h2>
		</div>
		<div id="content-general">
			<form action="" method="post" id="updateActivity">
				<fieldset class="first">
					<legend>Informações</legend>
					
					<p style="margin-top:20px">
						<label for="resumo">Resumo</label>
						<input type="text" name="activity.resumo" id="resumo" class="required" size="30" maxlength="255" value="${atividade.resumo }" />
					</p> 
					<p>
						<label for="responsavel">Atribuir para</label>
						<select name="activity.responsavel.id" id="responsavel">
							<option value="">Não atribuir esta atividade</option>
							<c:forEach items="${usuarios }" var="user">
								<c:if test="${user.user.id == atividade.responsavel.id}">
									<option value="${user.user.id }" selected="selected">${user.user.nome }</option>
								</c:if>
								<c:if test="${user.user.id != atividade.responsavel.id}">
									<option value="${user.user.id }">${user.user.nome }</option>
								</c:if>
							</c:forEach>
						</select>
					</p>
					<p>
						<label for="activity_versions">Versões</label>
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
						<label for="descricao">Descrição</label>
						<textarea rows="15" cols="50" name="activity.descricao" class="required" id="descricao">${atividade.descricao }</textarea>
						<label><span id="restantes"></span> caracteres restantes</label>
					</p>
				</fieldset>
				<p class="submit">
					<input type="submit" value="Atualizar" />
				</p>
			</form>
		</div>
		
		<script>
			$('#descricao').limit(700, '#restantes');
			$('#updateActivity').validate();
			$(".atualizar").colorbox({inline:true, width:"55%"});
			
			$("#updateActivity").submit(function() {
				setTimeout($.colorbox.close, 0);
				var desc = document.getElementById("descricao").value;
				
				return false;
			});
		</script>
	</div>
</div>

<%@ include file="../commons/footer.jsp" %>