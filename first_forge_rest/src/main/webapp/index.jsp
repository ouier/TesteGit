<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<button onclick="extjs()">Testar ExtJS</button>
	<button onclick="dhtmlx()">Testar DHTMLX</button>
	<button onclick="dojoToolkit()">Testar DOJO TOOLKIT</button>

	<script type="text/javascript">
		function extjs(){
			window.location.href='forgeext/forge.jsp';
		}
		function dhtmlx(){
			window.location.href="dhtmlx/forge.jsp"
		}
		function dojoToolkit(){
			window.location.href="dojo/dojo.jsp"
		}
		
	</script>
</body>
</html>