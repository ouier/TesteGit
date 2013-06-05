<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf8" />
<title>Login LDAP - Sistema FIEG</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/estilo.css"></link>
</head>
<body>
	<div class="geral">
		<div class="login">
			<form>
				<fieldset>
					<legend>Efetue o login - LDAP</legend>
					
					<label for="login">Usuário:</label>
					<input type="text" id="login" value=""/>
					
					<label for="password">Senha:</label>
					<input type="password" id="password" value=""/>
					
					<div class="painel_botoes">
						<input type="button" value="Entrar" onclick="doLogin()"/>
					</div>
				</fieldset>
				
				
			</form>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script> 
</body>
</html>