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
			- 일반적인 자바 객체 생성은 아래와 같이 한다. 
			Coount c1 = new Count();
			
			- jsp action useBean 을 사용할 경우 아래와 같이 한다.
		 --%>
		 <jsp:useBean id="c1" class="shoppingBasket.vo.Count" scope="page"></jsp:useBean> 
		 <jsp:useBean id="c2" class="shoppingBasket.vo.Count" scope="session"></jsp:useBean> 
		 <jsp:useBean id="c3" class="shoppingBasket.vo.Count" scope="application"></jsp:useBean>
		 
		 <%
		 	c1.add();
		 	c2.add();
		 	c3.add();
		 	
		 %> 
		 <h1>ex4_useBean.jsp</h1>
		 <h1>page : <%=c1.getCnt() %></h1>
		 <h1>session : <%=c2.getCnt() %></h1>
		 <h1>application : <%=c3.getCnt() %></h1>
		 
		 <button type"button" onclick="javascript:location.href='ex4_useBean.jsp'"><< Prev</button>
	
	</body>
</html>