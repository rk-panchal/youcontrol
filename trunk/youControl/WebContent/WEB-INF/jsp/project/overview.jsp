<%@ include file="../commons/header.jsp" %>
<div id="content-main">
	<h2 class="visao">Visão Geral: ${userWeb.project.projeto }</h2>
</div>
<div id="content-general">
	${userWeb.project.projeto }<br />
	${userWeb.project.publicoAlvo }<br />
	${userWeb.project.status }<br />
	<pre>${userWeb.project.descricao }</pre>
	
	<form action="" method="post" id="formAtribuir">
		<fieldset>
			<legend>Atribuir ao projeto</legend>
			<select name="user.id" id="pessoas" style="margin-top:10px">
				<c:if test="${not empty usuarios}">
					<c:forEach items="${usuarios }" var="user">
						<option value="${user.id }">${user.nome }</option>
					</c:forEach>
				</c:if>
				<c:if test="${empty usuarios}">
					<option value="nobody">Todos usuários já estão no projeto.</option>
				</c:if>
			</select>
			<input type="submit" value="Atribuir" id="submitAtribuir" />
			<div id="msgs" style="margin-top:10px">
				<span id="msgbox" class="messageboxinfo" style="display:none">...</span>
			</div>
		</fieldset>
	</form>
	
	<form action="" method="post" id="formAtribuir">
		<fieldset>
			<legend>Versões</legend>
				<div class="versions">
					<c:if test="${not empty versions}">
						<ul>
							<c:forEach items="${versions}" var="version">
								<li><a href="<c:url value="/version/${version.id }"/>">${version.name }</a></li>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${empty versions}">
						<p>Não há versões cadastradas.</p>
					</c:if>
				</div>
			<a href="<c:url value="/project/${userWeb.project.id }/version/new"/>" class="submit">Criar versão</a>
			<div id="msgs" style="margin-top:10px">
				<span id="msgbox" class="messageboxinfo" style="display:none">...</span>
			</div>
		</fieldset>
	</form>
	
	<form action="<c:url value="/image/project/${userWeb.project.id }"/>" method="post" enctype="multipart/form-data" id="formFoto">
		<fieldset>
			<legend>Alterar foto</legend>
			<img src="<c:url value="/image/project/${userWeb.project.id }"/>" alt="${userWeb.project.projeto }" style="width:150px; height:150px; margin-top:10px"/>
			<input type="file" name="arquivo" />
			<input type="submit" value="Alterar foto" />
		</fieldset>
	</form>
	
	<div style="clear:both"></div>
</div>
<script>
	$("#main ul li.visao a").addClass("selected");
	if ($("#pessoas").val() == "nobody") { $("#submitAtribuir").css("display", "none"); }
	
	jQuery(function($){
		$("#formAtribuir").submit(function() {
			$("#msgbox").removeClass().addClass('messageboxinfo').text('Adicionando...').fadeIn(2000);
			
			$.post('<c:url value="/project/${userWeb.project.id }/addUser"/>', {'user.id': $('#pessoas').val()}, function(data) {
				if (data.string == 'added') {
					$("#msgbox").fadeTo(200,0.1,function() {
		            	$(this).html('Usuário adicionado com sucesso!').removeClass().addClass('messageboxok').fadeTo(1900,1);
		            });
				} else {
					$("#msgbox").fadeTo(200,0.1,function() {
		            	$(this).html('Ocorreu um erro ao adicionar o usuário.').removeClass().addClass('messageboxerror').fadeTo(1900,1);
		            });
				}
			});
			return false;
		});		
	});
</script>
<%@ include file="../commons/footer.jsp" %>