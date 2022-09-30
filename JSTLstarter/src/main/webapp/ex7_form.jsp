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
		<h3>JSTL for statement 연습</h3>
		<c:set var="cnt" value="10" scope="page" />
		<ul>
			<c:forEach begin="0" end="${cnt }" varStatus="st" step="1"  >
				<li>${st.index } / <c:out value="${st.index }" />  </li>
			</c:forEach>
		</ul>
		
		<c:set var="str" value="<strong>Alice</strong>" />
		${str }
		<br />
		<c:out value="${str }" />
		<br />
		<c:out value="${str }" escapeXml="true" />
		<br />
		<%--
			- tag 를 브라우저에서 자동 해석을 하도록 되었으며 이를 
			해석하지 않도록 하는 것이 escapeXML 옵션이다.
			default value -> true
		 --%>
		<c:out value="${str }" escapeXml="false" />
		<br />
	</body>
</html>