<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding( "utf-8" ); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="s_id" value="${param.u_id }" />
	<c:if test="${ s_id eq 'admin' }" >
		<h3>${s_id } 관리자님 환영합니다.</h3>
	</c:if>
	<c:if test="${ s_id ne 'admin' }" >
		<h3>${s_id } 회원님 환영합니다.</h3>
	</c:if>

</body>
</html>