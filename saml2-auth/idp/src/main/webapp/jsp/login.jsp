<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Autenticação</title>
    <meta charset="utf-8"/>
</head>
<body>
    <form id="login_form" name="login_form" method="post"
      action="j_security_check" enctype="application/x-www-form-urlencoded">
        <fieldset>
            <legend>Digite suas credenciais</legend>
            <label for="login">Login:</label>
            <input type="text" id="login"/>
            <label for="senha">Senha:</label>
            <input type="text" id="senha"/>
            <input type="submit" value="Login">
        </fieldset>
    </form>

</body>
</html>