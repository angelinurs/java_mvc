<%@page import="java.util.List"%>
<%@page import="ex9.vo.TestVO"%>
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
<%
	request.setCharacterEncoding( "utf-8" );
	
/*
	Object obj = session.getAttribute( "list" );
	
	List<TestVO> list = null;
	if( obj != null ) {
		
		list = (List<TestVO>)obj;
	}
	
	out.print( list.get(0).getName() );
*/
%>

		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>번호</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="tlist" value="${sessionScope.list }" />
			
			<c:forEach var="vo" items="${tlist }" varStatus="st" >
				<tr>
					<td>${st.index+1 }</td>
					<td>${vo.name}</td>
					<td>${vo.phone}</td>
					<td>${vo.email}</td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
	
	</body>
</html>