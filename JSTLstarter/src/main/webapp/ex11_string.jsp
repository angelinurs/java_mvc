<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
<%--
	- 현제 페이지는 str 라는 파라미터를 받는다.
	str 의 길이를 구해보자
--%>

	<c:out value="param.str : ${param.str }" />
	<br />
	<c:out value="param.str.length() : ${param.str.length() }" />
	<br />
	<c:out value="param.str.substring( 0, 3) : ${param.str.substring( 0, 3) }" />
	<br />
	<c:out value="param.str.toUpperCase( 0, 3) : ${param.str.toUpperCase() }" />
	<br />
	
	<c:set var="s1" value="${param.str }" />
	<br />
	<c:out value="fn:length( s1 ) : ${fn:length( s1 ) }" />
	<br />
	<c:out value="fn:substring( s1, 0, 3) : ${fn:substring( s1, 0, 3) }" />
	<br />
	<c:out value="fn:toUpperCase( s1 ) : ${fn:toUpperCase( s1 ) }" />
	<br />
	<c:out value="fn:indexOf( s1, \"H\" ) : ${fn:indexOf( s1, \"H\" ) }" />
	<br />
	<c:out value="fn:replace( s1, \"o\", \"u\" ) : ${fn:replace( s1, \"o\", \"u\" ) }" />
	<br />
	
	
	</body>
</html>