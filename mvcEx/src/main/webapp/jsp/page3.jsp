<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	- MVC 환경은 뷰 퍼이지로 이동시 forward 되므로
	- request 또는 response 를 그대로 사용 가능함.
	- request 에 저장된 자원을 얻어낸다.
 --%>

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