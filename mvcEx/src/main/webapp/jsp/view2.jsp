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
	Object obj = request.getAttribute( "str" );
	String msg = null;
	
	if( obj != null ) {
		msg = String.valueOf( obj );
	}
	
	out.print( "<h1>" + msg + "</h1>" );
%>
</body>
</html>