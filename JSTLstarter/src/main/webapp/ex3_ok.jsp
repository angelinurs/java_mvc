<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	request.setCharacterEncoding( "utf-8" );

	// u_id 파라미터를 받고
	String m_id = request.getParameter( "u_id" );

	Map<String, String> map = new HashMap<>();
	map.put( "m_id", m_id );
	
	request.setAttribute( "map1", map );
	
	request.setAttribute( "id", m_id );
	
	session.setAttribute( "id", "increpas" );
%>
		<jsp:forward page="ex3_res.jsp" />
	
	</body>
</html>