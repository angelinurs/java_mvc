<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
<%--
	- 현제 페이지는 money 라는 파라미터를 받는다.
	money 에 따라 과일을 선택할 수 있다.
	+ 사과  :700
	+ 배   :1000
	+ 샤인머스켓  :1800
--%>

	<c:out value="Choose statement"></c:out>
	<c:choose>
		<c:when test='${param.money >= 1800 }' >
			사과, 배, 샤인머스켓 중 하나를 선택
		</c:when>
		<c:when test='${param.money >= 1000 }' >
			사과, 배 중 하나를 선택
		</c:when>
		<c:when test='${param.money >= 700 }' >
			사과를 선택
		</c:when>
		<c:otherwise>
			눈으로 보기만 하기 선택
		</c:otherwise>
	</c:choose>
	
	<br />
	<c:out value="if statement"></c:out>
	<c:out value="${param.money }"></c:out>
	<c:if test="${param.money eq null or param.money < 700 }" >
		눈으로 보기만 하기 선택
	</c:if>
	<c:if test="${param.money >= 1800 }" >
		사과, 배, 샤인머스켓 중 하나를 선택
	</c:if>
	<c:if test="${param.money ne null and param.money >= 1000 and param.money < 1800 }" >
		사과, 배 중 하나를 선택
	</c:if>
	<c:if test="${param.money ne null and param.money >= 700 and param.money < 1000 }" >
		사과를 선택
	</c:if>
	
	</body>
</html>