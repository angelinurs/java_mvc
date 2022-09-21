<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding( "utf-8" );
		%>
		
		<jsp:useBean id="vo" class="shoppingBasket.vo.ParamVO" scope="page" >
			<%--
				- 만약 parameter 와 property 의 이름 같은 경우 
				param argument 는 생략 가능하다.
				ex) 
				<jsp:setProperty property="id" name="vo" param="id" />
				-> <jsp:setProperty property="id" name="vo" />
			 --%>
			 <%--
				<jsp:setProperty property="id" name="vo" param="id" />
				<jsp:setProperty property="pw" name="vo" param="pw" />
				<jsp:setProperty property="name" name="vo" param="name" />
				<jsp:setProperty property="hobby" name="vo" param="hobby" />
				
				- 위와 같이 property 와 parameter 가 모두 동일 할때 한번에 object 를 생성할 수 있다.
			  --%>
				<jsp:setProperty property="*" name="vo" />
		</jsp:useBean>
		
		<h1><%=vo.getId() %></h1>
		<h1><%=vo.getPw() %></h1>
		<h1><%=vo.getName() %></h1>
		<ol>
			<%
			for( String hobby : vo.getHobby() ) {
				%>
				<li><%=hobby %></li>
				<%
			}
			%>
		</ol>
	</body>
</html>