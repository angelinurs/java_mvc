<%@page import="java.util.Date"%>
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
		- 날짜 형식
	 --%>
	<c:set var="now" value="<%=new Date()%>" />
	<h3>${now}</h3>
	<h3><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></h3>
	
	<h3><fmt:formatDate value="${now}" pattern="(a)hh:mm:ss" /></h3>
	
	<%--
		- 숫자 형식
	 --%>
	 <h3><fmt:formatNumber value="12000000000" /></h3>
	 <h3><fmt:formatNumber value="12000000000" type="currency" currencySymbol="￦"/></h3>
	 <h3><fmt:formatNumber value="12000000000" groupingUsed="false" /></h3>
	 <h3><fmt:formatNumber value="00000000012000000000" groupingUsed="false" /></h3>
	 <h3><fmt:formatNumber value="00000000012000000000" /></h3>
	 <h3><fmt:formatNumber value="00000000012000000000" pattern="#,##0.00" /></h3>
	 <h3><fmt:formatNumber value="0.195" pattern="#,##0.00" /></h3>
	 <h3><fmt:formatNumber value="0.194" pattern="#,##0.00" /></h3>
	 <h3><fmt:formatNumber value="0.194" pattern="0.00%" /></h3>
	 <h3><fmt:formatNumber value="0.194" type="percent" pattern="0.00%" /></h3>
	</body>
</html>