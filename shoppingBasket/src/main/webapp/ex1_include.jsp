<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="css/menu.css" />
	</head>
	<body>
		<div id="header">
		
			<!-- jsp include 사용법 차이 -->
			<!-- 1. jsp:inlcude jsp 액션 -->
			<%-- 
				- jsp:include 는 
				- compile 된 결과인 html documnet를 가져온다.
				- 따라서 선어된 variable 및 method 들을 사용 불가능하다.
			--%>
			<jsp:include page="ex1_menu.jsp" />
			<%-- <%=msg %> 따라서 이 코드는 에러 --%>
			
			<!-- 2. jsp script include 지시자 -->
			<%-- 
				- include 지시자는
				- compile 되기전의 코드를 가져온다.
				- 따라서 선어된 variable 및 method 들을 사용가능하다. 
			--%>
			<%@ include file="ex1_menu.jsp" %>
			<%=msg %>
			
		</div>
	</body>
</html>