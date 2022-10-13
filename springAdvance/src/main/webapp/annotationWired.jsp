<%@page import="pm.action.TestAction"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
<%
	ApplicationContext ctx = 
		WebApplicationContextUtils.getWebApplicationContext( application );
	
	TestAction ta =  ctx.getBean( TestAction.class );
	
	out.println( "<h1>" + ta.getTvo().getName() + " " + ta.getTvo().getEmail() + "</h1>" );
%>
	
	</body>
</html>