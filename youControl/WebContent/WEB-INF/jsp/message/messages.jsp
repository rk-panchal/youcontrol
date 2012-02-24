<%@ include file="../commons/header.jsp" %>
<div id="content-main">
	<h2 class="msgs">Mensagens</h2>
</div>
<div id="content-general">
	<p><a href="#" id="send">Mensagem enviada</a></p>
	<p><a href="#" id="inbox">Chegou mensagem</a></p>

	<div id="inbox">
		<h2>Caixa de entrada</h2>
		<c:forEach items="${inboxMessages }" var="message">
			<p>De ${message.fromUser.nome } - ${message.subject } - em <fmt:formatDate value="${message.sentDate }" type="date" pattern="dd/MM/yyyy HH:mm"/></p>
		</c:forEach>
	</div>
	
	<div id="sentMessage">
		<h2>Caixa de saída</h2>
		<c:forEach items="${sentMessages }" var="message">
			<p>Para ${message.toUser.nome } - ${message.subject } - em <fmt:formatDate value="${message.sentDate }" type="date" pattern="dd/MM/yyyy HH:mm"/></p>
		</c:forEach>
	</div>
	
	<div id="sendMessage">
		<h2>Escrever mensagem</h2>
		<form action="<c:url value="/messages/new"/>" method="post" id="newMessage">
			<fieldset>
				<p>
					<label for="toUser">
						Para <img src="<c:url value="/imgs/help.png"/>" class="help" title="A quem você deseja enviar a sua mensagem?" />
					</label>
					<select id="toUser" name="message.toUser.id">
						<c:forEach items="${users }" var="user">
							<option value="${user.id }">${user.nome }</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label for="subject">
						Assunto <img src="<c:url value="/imgs/help.png"/>" class="help" title="Sobre qual o tema se trata sua mensagem?" />
					</label>
					<input type="text" name="message.subject" id="subject" size="30" maxlength="200" />
				</p>
				<p>
					<label for="message">
						Mensagem <img src="<c:url value="/imgs/help.png"/>" class="help" title="Escreva a sua mensagem" />
					</label>
					<textarea rows="15" cols="50" name="message.message" class="required" id="message"></textarea>
					<label><span id="restantes"></span> caracteres restantes</label>
				</p>			
			</fieldset>
			<p class="submit">
				<input type="submit" value="Enviar mensagem" />
			</p>
		</form>
	</div>

</div>
<script type="text/javascript">
	$(document).ready(function(){	
		$("img.help").easyTooltip();
		$('textarea#message').limit(700, '#restantes');
		$('#newMessage').validate();
		
		$('#send').click(function(){
			$.gritter.add({
					title: 'Enviada',
					text: 'A sua mensagem foi enviada com sucesso!',
					image: '<c:url value="/imgs/gritter/ok.png"/>',
					class_name: 'gritterSuccess',
					sticky: false,
					time: 2500
			});
			return false;
		});
		
		$('#inbox').click(function(){
			$.gritter.add({
					title: 'Nova mensagem',
					text: 'Chegou mensagem nova para você! Visualize <a href="#">aqui</a>.',
					image: '<c:url value="/imgs/gritter/message.png"/>',
					class_name: 'gritterInfo',
					sticky: false,
					time: 2500
			});
			return false;
		});
	});
	$("#main ul li.msgs a").addClass("selected");
</script>
<%@ include file="../commons/footer.jsp" %>