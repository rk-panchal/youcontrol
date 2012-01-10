<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
		<title>youControl - Projects Management</title>
		<script type="text/javascript" src="<c:url value="/js/jquery-1.5.1.js"/>"></script>
		<link rel="shortcut icon" href="<c:url value="/imgs/favicon.png"/>" type="image/png" />
		<style type="text/css">
			/* RESET */
			* { padding:0px; margin:0px; font-family:"Lucida Grande","Lucida Sans Unicode",helvetica,arial,verdana,sans-serif; font-size:13px; }
			body { background: #eaeaea; color: #282828; }
			h1 { font-size:36px; font-weight:normal; float:left; }			
			h2 {
				padding-bottom: 5px;
				margin-bottom: 20px;
				font-size: 18px;
				font-weight: normal;
				border-bottom: 1px solid #ddd;
			}
			a, a:active, a:hover, a:visited { float:right; padding:6px; display:block; text-decoration:none; background:#3A6897; border:1px solid #3B6B9C; color:#fff; -moz-border-radius: 3px; -webkit-border-radius: 3px; margin:12px 0 0 5px; }
			
			#header { width:600px; margin:30px auto 0; }
			#wrapper { width:600px; margin:10px auto; background: #fff; border: 7px solid #ccc; -moz-border-radius: 10px; -webkit-border-radius: 10px; min-height:390px; }
			#login { width:279px; float:left; border-right:1px solid #ccc; height:370px; padding:10px; }
			#register { width:279px; float:right; border-left:1px solid #ccc; height:370px; padding:10px; } 
			#footer { width:600px; margin:0 auto; text-align:right; color:#696969; }

			h2.login { background:url("<c:url value="/imgs/login.png"/>") no-repeat 4px 2px; padding-left:28px; }
			h2.register { background:url("<c:url value="/imgs/register.png"/>") no-repeat 4px 2px; padding-left:28px; }
			
			label {	color: #7a7a7a;	font-weight: bold; }
			input[type=text], input[type=password] {
				margin: 5px 0 10px;
				width:95%;
				background: #f8f8f8;
				border: 1px solid #aaa;
				padding:6px; 
			}
			p { margin: 0 0 18px; text-align:justify; }
			input[type=submit] {
				float: right;
				color: #fff;
				cursor: pointer;
				font-weight: bold;
				font: 12px/20px Arial,Helvetica Neue,Helvetica,sans-serif;
				height: 28px;
				margin: 23px 2px 0 0;
				padding: 0 15px;
				text-transform: uppercase;
				background: none repeat scroll 0 0 #3B6B9C;
				border: 1px solid #3A6897;
				border-radius: 3px 3px 3px 3px;
			}

			/* MENSAGENS INFORMATIVAS */
			.messageboxinfo{
				position:absolute;
				width:249px;
				border:1px solid #1E5395;
				background:url("<c:url value="/imgs/info.png"/>") no-repeat 4px 50%;
				background-color:#B0C4DE;
				padding:3px 3px 3px 25px;
				color:#1E5395;
				margin-top:5px;
			}
			.messagebox{
				width:249px;
				border:1px solid #c93;
				background:url("<c:url value="/imgs/alerta.png"/>") no-repeat 4px 50%;
				background-color:#ffc;
				padding:3px 3px 3px 25px;
				margin-top:5px;
				color:#708090;
			}
			.messageboxok{
				width:249px;
				border:1px solid #349534;
				background:url("<c:url value="/imgs/certo.gif"/>") no-repeat 4px 50%;
				background-color:#C9FFCA;
				padding:3px 3px 3px 25px;
				color:#008000;
				margin-top:5px;
			}
			.messageboxerror{
				width:249px;
				border:1px solid #CC0000;
				background:url("<c:url value="/imgs/erro.png"/>") no-repeat 4px 50%;
				background-color:#F7CBCA;
				padding:3px 3px 3px 25px;
				color:#CC0000;
				margin-top:5px;
			}
		</style>
	</head>
	<body onload="document.getElementById('email').focus()">
		<div id="header">
			<h1>youControl</h1>
			<a href="#help">Ajuda</a>
			<a href="#sobre">Sobre</a>
		</div>
		<div style="clear:both"></div>
		<div id="wrapper">
			<div id="login">		
				<h2 class="login">Login</h2>
				<p>Para fazer uso do youControl, você deve entrar os dados abaixo para realizar o login. Caso ainda não possua uma conta, efetue seu cadastro no formulário ao lado.</p>
				<form action="" method="post" id="formLogin">
					<label for="email">Email:</label>
					<input type="text" name="user.email" id="email" />
					<label for="senha">Senha:</label>
					<input type="password" name="user.senha" id="senha" />
					<div id="msgs">
						<span id="msgbox" class="messageboxinfo">Entre com usuário/senha...</span>
					</div>
					<br />
					<input type="submit" value="Entrar" />
				</form>			
			</div>
			<div id="register">
				<h2 class="register">Registre-se</h2>
				<form action="" method="post" id="formRegister">
					<label for="nome">Nome:</label>
					<input type="text" name="user.nome" id="nome" />
					<label for="emailRegister">Email:</label>
					<input type="text" name="user.email" id="emailRegister" />
					<label for="senhaRegister">Senha:</label>
					<input type="password" name="user.senha" id="senhaRegister" />
					<label for="senha2">Repita sua senha:</label>
					<input type="password" name="senha2" id="senha2" />
					<div id="msgs">
						<span id="msgboxReg" class="messageboxinfo">Esperando dados...</span>
					</div>
					<br />
					<input type="submit" value="Registrar" />
				</form>
			</div>
		</div>
		<div id="footer">
			youControl © 2012 - Vinícius Michelutti
		</div>
		
		<script type="text/javascript">
			jQuery(function($){
				
				/* FORMULARIO DE LOGIN */
				$("#formLogin").submit(function() {
					$("#msgbox").removeClass().addClass('messageboxinfo').text('Validando dados...').fadeIn(2000);
					
					$.post('<c:url value="/login"/>', {'user.email': $('#email').val(), 'user.senha': $('#senha').val()}, function(data) {
						if (data.string == 'true') {
							$("#msgbox").fadeTo(200,0.1,function() {
				            	$(this).html('Redirecionando...').addClass('messageboxok').fadeTo(1900,1,function() {
				                	$(this).removeClass().html('');
				                	document.location='<c:url value="/start"/>';
				                 });
				            });
						} else {
							$("#msgbox").fadeTo(200,0.1,function() {
				            	$(this).html('Dados inválidos').addClass('messageboxerror').fadeTo(1900,1);
				            });
						}
					});
					return false;
				});
				
				/* FORMULARIO DE CADASTRO */
			     $("#formRegister").submit(function() {
			          $("#msgboxReg").removeClass().addClass('messageboxinfo').text('Validando dados...').fadeIn(2000);
			          
			 		  var senha1 = $('#senhaRegister').val();
			 		  var senha2 = $('#senha2').val();
			 		  if (senha1 != senha2) {
			 			 $("#msgboxReg").fadeTo(200,0.1,function() {
			                 $(this).html('Senhas não conferem!')
			                    .addClass('messageboxerror')
			                         .fadeTo(1900,1);
			               	});
			 			 return false;
			 		  }
			 		  
			          $.post('<c:url value="/register"/>',
			                    {'user.nome': $('#nome').val(), 'user.email': $('#emailRegister').val(), 'user.senha': $('#senhaRegister').val()},
			                         function(data) {
			               if(data.string=='ok') {
			               	$("#msgboxReg").fadeTo(200,0.1,function() {
			               		document.getElementById("email").value = $('#emailRegister').val();
			                	$(this).html('Sucesso! Realize o seu login.').addClass('messageboxok').fadeTo(1900,1);
			               	});
			               } else if (data.string=='emBranco') {
			               	$("#msgboxReg").fadeTo(200,0.1,function() {
			                 $(this).html('Preencha todos os campos!')
			                    .addClass('messageboxerror')
			                         .fadeTo(1900,1);
			               	});
			               } else if (data.string=='existeEmail') {
			            	   $("#msgboxReg").fadeTo(200,0.1,function() {
					                 $(this).html('Email já cadastrado!')
					                    .addClass('messageboxerror')
					                         .fadeTo(1900,1);
					               	});   
			               }
			        });
			        return false;
			     });
			});
		</script>
		
	</body>
</html>