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
			- 같은 이름으로 request 와 session 에 저장 되었다면,
			우선순위가 request 에 있다.
		 --%>
		<h3>id : ${id}</h3>
		<h3>sessionScope.id : ${sessionScope.id}</h3>
		
		<%--
			- request 에 map 구조로 저장한 "map1" 의 m_id 출력 
		 --%>
		 <h3>requestScope.map1.m_id : ${requestScope.map1.m_id}</h3>
		 <h3>requestScope.map1["m_id"] : ${requestScope.map1["m_id"]}</h3>
		
	
	</body>
</html>