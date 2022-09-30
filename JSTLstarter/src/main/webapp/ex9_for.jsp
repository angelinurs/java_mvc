<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ex9.vo.TestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
<%
	TestVO t1 = new TestVO( "Alice", "010-2222-3333", "alice@email.com" );
	TestVO t2 = new TestVO( "Dorosi", "010-5555-7777", "dorosi@email.com" );
	TestVO t3 = new TestVO( "Totoro", "010-3333-9999", "Tototo@email.com" );
	TestVO t4 = new TestVO( "Pika", "010-8888-1111", "Pika@email.com" );
	
	List<TestVO> list = new ArrayList<>();
	
	list.add( t1 );
	list.add( t2 );
	list.add( t3 );
	list.add( t4 );
	
	session.setAttribute( "list", list );
%>
		<button type="button" 
				onclick="javasript:location.href='ex9_res.jsp'">다음</button>
	</body>
</html>