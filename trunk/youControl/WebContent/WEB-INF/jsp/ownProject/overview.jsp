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
				<c:forEach items="${usuarios }" var="user">
					<option value="${user.id }">${user.nome }</option>
				</c:forEach>
			</select>
			<input type="submit" value="Atribuir" />
			<div id="msgs" style="margin-top:10px">
				<span id="msgbox" class="messageboxinfo" style="display:none">Entre com usuário/senha...</span>
			</div>
		</fieldset>
	</form>
</div>
<script>
	$("#main ul li.visao a").addClass("selected");
	
	jQuery(function($){
		$("#formAtribuir").submit(function() {
			$("#msgbox").removeClass().addClass('messageboxinfo').text('Adicionando...').fadeIn(2000);
			
			$.post("/youControl/project/addUser", {'user.id': $('#pessoas').val()}, function(data) {
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