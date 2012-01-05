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
				<span class="detailTitle">Atribuido para: </span><span>${atividade.responsavel.nome }</span><br />
				<span class="detailTitle">Projeto: </span><span>${atividade.projeto.projeto }</span><br />
			</div>
			<div class="detailRight">
				<span class="detailTitle">Início: </span><span><fmt:formatDate value="${atividade.dataCriacao }" type="date" pattern="dd/MM/yyyy hh:mm"/></span><br />
				<span class="detailTitle">Data prevista: </span><span>-</span><br />
				<span class="detailTitle">Concluído: </span><span>0%</span><br />
				<span class="detailTitle">Tempo gasto: </span><span>-</span><br />
			</div>
		</div>
		<hr />
		<div id="description">
			<span class="detailTitle">Descrição</span>
			<p><pre>${atividade.descricao }</pre></p>
		</div>
	</div>
	
	<div id="commentsBox">
		<h2>Comentários (3)</h2>
		<form action="" method="post" name="commentForm">
			<div id="voce" style="width:10%; float:left; text-align:right">
				<img src="<c:url value="/image/user/${atividade.criador.id }"/>" alt="${atividade.criador.nome }" style="width:70px; height:80px; margin-right:10px; margin-top:5px"/>
				<span style="margin-right:10px">diz: </span>
			</div>
			<div id="texto" style="float:left; width:90%">
				<textarea name="comentario" id="comentario"></textarea>
			</div>
			<input type="submit" value="Comentar" style="margin-top:10px; float:right" /> 		
		</form>
		
		<div style="height:15px; width:100%; clear:both"></div>
		
		<!--<div class="commentText"> 
			<p style="text-align:center">Nenhum comentário / histórico.</p>
		</div> --> 
		<div class="commentText">
			<p class="detail"><span class="detailComment">04/01/2012 - 20:15 por <a href="#">Vinícius Michelutti</a></span></p>
			<img src="http://imagem.vilamulher.com.br/temp/lipoaspiracao-130608.jpg" alt="usuario" />
			<p>Bla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsa</p>
		</div>
		<hr />
		<div class="commentText">
			<p class="detail"><span class="detailComment">04/01/2012 - 20:15 por <a href="#">Vinícius Michelutti</a></span></p>
			<img src="http://imagem.vilamulher.com.br/temp/lipoaspiracao-130608.jpg" alt="usuario" />
			<p>Bla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsaBla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsaBla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsaBla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsaBla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsaBla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsaBla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsaBla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsaBla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsa</p>
		</div>
		<hr />
		<div class="commentText">
			<p class="detail"><span class="detailComment">04/01/2012 - 20:15 por <a href="#">Vinícius Michelutti</a></span></p>
			<img src="http://imagem.vilamulher.com.br/temp/lipoaspiracao-130608.jpg" alt="usuario" />
			<p>Bla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsaBla blabalbalbalab ablabal ablabsalbd ad sad sad asdbaldbas adaljhdsa</p>
		</div>
		<hr />
	</div>

</div>

<script>
	$("#main ul li.atividade a").addClass("selected");
	$("#comentario").puts("Escreva o seu comentário...");
</script>
<%@ include file="../commons/footer.jsp" %>