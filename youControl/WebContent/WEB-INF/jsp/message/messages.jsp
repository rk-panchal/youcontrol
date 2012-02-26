<%@ include file="../commons/header.jsp" %>

<div id="content-main">
	<h2 class="msgs">Mensagens</h2>
</div>
<div id="content-general">
	<p><a href="#" id="sendNotification">Mensagem enviada</a></p>
	<p><a href="#" id="inboxNotification">Chegou mensagem</a></p>

	<ul class="tabs">
		<li id="inbox" class="active">Caixa de entrada</li>
		<li id="sentMessage">Caida de saída</li>
		<li id="sendMessage">Escrever mensagem</li>
	</ul>
	
	<div style="width:100%; height:29px"></div>
	<div class="content inbox">
		<c:if test="${empty inboxMessages }">
			<p style="text-align:center; margin:10px 0">Nenhuma mensagem recebida.</p>
		</c:if>
		<c:if test="${!empty inboxMessages }">
			<table class="messagesTable" border="0" cellpadding="0" cellspacing="0">
				<c:forEach items="${inboxMessages }" var="message">
					<tr <c:if test="${message.markAsRead == false }">class="unread"</c:if> >
						<td class="check"><input type="checkbox" /></td>
						<td class="username">${message.fromUser.nome }</td>
						<td class="subject">${message.subject } - ${message.markAsRead }</td>
						<td class="date"><fmt:formatDate value="${message.sentDate }" type="date" pattern="dd/MM/yyyy HH:mm"/></td>
					</tr>
				</c:forEach>
				<tr class="lastRow">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</c:if>
	</div>
	
	<div class="content sentMessage">
		<c:if test="${empty sentMessages }">
			<p style="text-align:center; margin:10px 0">Nenhuma mensagem enviada.</p>
		</c:if>
		<c:if test="${!empty sentMessages }">
			<table class="messagesTable" border="0" cellpadding="0" cellspacing="0">
				<c:forEach items="${sentMessages }" var="message">
					<tr>
						<td class="check"><input type="checkbox" /></td>
						<td class="username">Para: ${message.toUser.nome }</td>
						<td class="subject">${message.subject }</td>
						<td class="date"><fmt:formatDate value="${message.sentDate }" type="date" pattern="dd/MM/yyyy HH:mm"/></td>
					</tr>
				</c:forEach>
				<tr class="lastRow">
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</c:if>
	</div>
	
	<div class="content sendMessage">
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
		
		$("table.messagesTable tr td input").click(function(x) {
			$(this).parents('tr').toggleClass('selected');
		});
		
		/* ABAS DE NAVEGACAO */
		$("ul.tabs > li").click(function(e){
			switch(e.target.id){
				case "inbox":
					$("#inbox").addClass("active");
					$("#sentMessage").removeClass("active");
					$("#sendMessage").removeClass("active");
					
					$("div.inbox").css("display", "block");
					$("div.sentMessage").css("display", "none");
					$("div.sendMessage").css("display", "none");
				break;
				case "sentMessage":
					$("#inbox").removeClass("active");
					$("#sentMessage").addClass("active");
					$("#sendMessage").removeClass("active");
					
					$("div.sentMessage").css("display", "block");
					$("div.inbox").css("display", "none");
					$("div.sendMessage").css("display", "none");
				break;
				case "sendMessage":
					$("#inbox").removeClass("active");
					$("#sentMessage").removeClass("active");
					$("#sendMessage").addClass("active");
					
					$("div.sendMessage").css("display", "block");
					$("div.inbox").css("display", "none");
					$("div.sentMessage").css("display", "none");
				break;
			}
			return false;
		});
		
		/* NOTIFICACOES DE MENSAGEM */
		$('#sendNotification').click(function(){
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
		$('#inboxNotification').click(function(){
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