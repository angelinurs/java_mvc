<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>cPage : ${cPage}</h3>
		<h3>param.cPage : ${param.cPage}</h3>
		<h3>param["cPage"] : ${param["cPage"]}</h3>
		<h3>sessionScope.m_id : ${sessionScope.m_id}</h3>
		<%--
			아래의 방식은 session 값을 다 검색하므로 성능이 좋지 않다.
		 --%>
		<h3>m_id : ${m_id}</h3>
		
	
	</body>
</html>