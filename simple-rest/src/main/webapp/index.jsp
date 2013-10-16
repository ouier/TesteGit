<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:ng="http://angularjs.org" id="ng-app" ng-app>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" charset="utf-8"/>
<title>Cadastro de pessoas</title>
</head>
<script language="javascript" src="http://10.21.16.63/angular/angular.min.js"></script>
<script language="javascript" src="index.js"></script>
</script>
<body>
	<form action="pessoas" ng-controller="FormPessoas">
		<fieldset>
		<legend>Cadastro de pessoas</legend>
		<label for="nome">Nome:</label>
		<input type="text" id="nome" ng-model="pessoa.nome"/>
		<label for="idade">Idade:</label>
		<input type="text" id="idade" ng-model="pessoa.idade"/>
		
		<input type="button" value="Cadastrar" id="btnCadastro" ng-click="cadastrar(pessoa)"/>
		</fieldset>
		<div>
			<p>Nome:{{pessoa.nome}}</p>
			<p>Idade:{{pessoa.idade}}</p>
		</div>
		<table>
			<tr>
				<td>Nome</td>
				<td>Idade</td>
			</tr>
			<tr ng-repeat="p in pessoas">
				<td>{{p.nome}}</td>
				<td>{{p.idade}}</td>
			</tr>
		</table>
	</form>
</body>
</html>