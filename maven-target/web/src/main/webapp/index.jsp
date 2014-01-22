<%@page import="util.base.ConfiguracaoSimples"%>
<%@ page import="util.Configuracao"%>
<%--
  Created by IntelliJ IDEA.
  User: rafael
  Date: 31/10/13
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>MAVEN-TARGET</title>
</head>
<body>
	<%
		ConfiguracaoSimples c = new ConfiguracaoSimples();

		String str = "Regional de " + new Configuracao(c).getRegional();
		out.println(str);
	%>
</body>
</html>