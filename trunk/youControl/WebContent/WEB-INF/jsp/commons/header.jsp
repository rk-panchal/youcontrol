<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
<title>youControl - Projects Management</title>
<script type="text/javascript" src="<c:url value="/js/jquery-1.5.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/puts.js"/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>" media="screen" />
<link rel="shortcut icon" href="<c:url value="/imgs/favicon.png"/>" type="image/png" />
</head>
<body>
	<div id="general">
		<div id="header">
			<div id="logo"><img src="<c:url value="/imgs/logoH.png"/>" alt="youControl" /></div>
			<div id="pesquisa">
				<input type="text" name="pesquisa" id="pesquisaT" value="" />
			</div>
		</div>
		<div id="principal">
			<div id="greetings" style="text-align:right; margin-bottom:15px">
				<p>Bem vindo, ${userWeb.user.nome }. <a href="#">Editar</a> <a href="#">Help</a> <a href="<c:url value="/logout"/>">Sair</a></p>
			</div>
			<div style="clear:both"></div>
			<div id="main">
				<ul class="menu">
					<li class="inicio"><a href="<c:url value="/start"/>">Início</a></li>
					<li class="projetos"><a href="<c:url value="/projects"/>">Projetos <span class="stats">- 5 ativos</span></a></li>
					<li class="msgs"><a href="#">Mensagens <span class="stats">- (0/0)</span></a></li>
					<li class="perfil"><a href="#">Perfil </a></li>
					<li class="conf"><a href="#">Configurações </a></li>
				</ul>
				<hr />
				<c:if test="${userWeb.project == null}">
					<h4>Selecione um projeto</h4>
				</c:if>
				<c:if test="${userWeb.project != null}">
					<h4>Projeto: ${userWeb.project.projeto }</h4>
					<ul class="menu">
						<li class="visao"><a href="<c:url value="/overview"/>">Visão geral</a></li>
						<li class="atividade"><a href="<c:url value="/activity"/>">Atividades <span class="stats">- 37 em aberto</span></a></li>
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
				$("#pesquisaT").puts("Procure o usuário...");
			</script>