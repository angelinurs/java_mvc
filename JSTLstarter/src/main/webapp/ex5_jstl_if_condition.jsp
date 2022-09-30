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
		<%--
			- JSTL 변수 선언
		 --%>
		 <c:set var="i" value="${param.idx }" />
		 <%--
		 	- JSTL if 문 사용
		  --%>
		 <h3>
		 	<c:if test="${i == null }" >
		 		값을 받지 못했습니다.
		 		<c:set var="i" value="5" />
		 	</c:if>
		 	<c:if test="${i != null and i <= 5 }" >
		 		i 가 5 이하입니다.
		 	</c:if>
		 </h3>
	
	</body>
</html>