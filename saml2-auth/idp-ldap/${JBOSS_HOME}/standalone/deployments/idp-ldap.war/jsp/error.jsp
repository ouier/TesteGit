<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error!</title>
    <meta charset="utf-8"/>
</head>
<body>

    <p>
        O Login e Senha informados não conferem.

        Clique <a href='<%= response.encodeURL("login.jsp") %>'>aqui</a>
        para tentar novamente.
    </p>

</body>
</html>
