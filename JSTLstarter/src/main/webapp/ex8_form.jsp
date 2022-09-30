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
<% String[] ar = { "Java", "Clang", "Python", "Lombok" }; %>
		<h3>JSTL for statement 연습</h3>
		
		<c:set var="cnt" value="<%=ar.length %>" scope="page" />
		<c:set var="ar" value="<%=ar %>" scope="page" />
		<ul>
			<c:forEach begin="0" end="${cnt-1 }" varStatus="st"  >
				<li>${ar[st.index] } </li>
			</c:forEach>
		</ul>
		
		<hr />
		<c:set var="ar" value="<%=ar %>" scope="page" />
		<ul>
			<c:forEach var="item" items="${ar }" varStatus="st"  >
				<li>${st.index } / ${item }  </li>
			</c:forEach>
		</ul>
	</body>
</html>