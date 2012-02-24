<%@ include file="init.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
<title>youControl - Projects Management</title>
<script type="text/javascript" src="<c:url value="/js/jquery-1.5.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.gritter.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/puts.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.scrollablecombo.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.colorbox.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/easyTooltip.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery.limit-1.2.source.js"/>"></script>

<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/gritter.css"/>" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/projectSelector.css"/>"/>
<link rel="shortcut icon" href="<c:url value="/imgs/favicon.png"/>" type="image/png" />
<link rel="stylesheet" type="text/css" href="<c:url value="/css/colorbox.css"/>"/>



</head>
<body>
	<div id="general">
	
		<div id="topNav">
			<div class="fixed">
				<div class="welcome">
					<a href="#"><img src="<c:url value="/imgs/topmenu/userPic.png"/>" alt="" /></a>
					<span>${userWeb.user.nome }</span>
				</div>
				<div class="userNav">
					<ul>
						<li>
							<a href="<c:url value="/start"/>">
								<img src="<c:url value="/imgs/topmenu/profile.png"/>" />
								<span>Início</span>
							</a>
						</li>
						<li>
							<a href="#">
								<img src="<c:url value="/imgs/topmenu/messages.png"/>" />
								<span>Mensagens</span>
								<span class="numberTop">8</span>
							</a>
						</li>
						<li>
							<a href="<c:url value="/users/profile"/>">
								<img src="<c:url value="/imgs/topmenu/settings.png"/>" />
								<span>Editar configurações</span>
							</a>
						</li>
						<li>
							<a href="<c:url value="/logout"/>">
								<img src="<c:url value="/imgs/topmenu/logout.png"/>" />
								<span>Sair</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- <img src="<c:url value="/imgs/logoH.png"/>" alt="youControl" /> -->
		
		<div id="principal">
			<div style="clear:both"></div>
			<div id="main">
				<ul class="menu">
					<li class="inicio"><a href="<c:url value="/start"/>">Início</a></li>
					<li class="projetos"><a href="<c:url value="/projects"/>">Projetos <span class="stats">- 5 ativos</span></a></li>
					<li class="msgs"><a href="<c:url value="/messages"/>">Mensagens <span class="stats">- (0/0)</span></a></li>
					<li class="perfil"><a href="<c:url value="/users/profile"/>">Perfil </a></li>
					<li class="conf"><a href="#">Configurações </a></li>
				</ul>
				<hr />
				
				<div>
					<select id="selectProjects">
						<option value="">Selecione um projeto</option>			
						<c:forEach items="${userWeb.availableProjects}" var="availableProjects">
							<c:if test="${availableProjects.id == userWeb.project.id }">
								<option value="<c:url value="/project/${availableProjects.id}"/>" selected="selected">${availableProjects.projeto}</option>
							</c:if>
							<c:if test="${availableProjects.id != userWeb.project.id }">
								<option value="<c:url value="/project/${availableProjects.id}"/>">${availableProjects.projeto}</option>
							</c:if>
						</c:forEach>		
					</select>
				</div>
				
				
				<c:if test="${userWeb.project != null}">
					<ul class="menu" style="margin-top:50px">
						<li class="visao"><a href="<c:url value="/project/${userWeb.project.id }"/>">Visão geral</a></li>
						<li class="atividade"><a href="<c:url value="/project/${userWeb.project.id }/activities"/>">Atividades <span class="stats">- 37 em aberto</span></a></li>
						<li class="wiki"><a href="#">Wiki</a></li>
						<li class="doc"><a href="#">Documentos <span class="stats">- 0 docs</span></a></li>
						<li class="agenda"><a href="#">Agenda <span class="stats">- 2 tarefas hoje</span></a></li>
						<li class="plan"><a href="#">Planejamento <span class="stats">- 9 planos</span></a></li>
						<li class="estat"><a href="#">Estatísticas</a></li>
						<li class="adm"><a href="#">Administração</a></li>
					</ul>
				</c:if>
				
			</div>
			<div id="content">
			<script>
				$('#selectProjects').scrollablecombo();
			</script>