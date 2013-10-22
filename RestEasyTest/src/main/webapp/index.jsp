<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CadUsuarios</title>
</head>
<script language="javascript" src="jquery.js"></script> 
<script language="javascript" src="index.js"></script>
</script>
<body>
	<form action="pessoas">
		
		<fieldset>
		<legend>Cadastro de pessoas</legend>
		<label for="nome">Nome:</label>
		<input type="text" id="nome"/>
		<label for="idade">Idade:</label>
		<input type="text" id="idade"/>
		
		<input type="button" value="Cadastrar" id="btnCadastro"/>
		</fieldset>
	</form>
</body>
</html>