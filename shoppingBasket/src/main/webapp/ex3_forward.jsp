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
			// 요청시 한글처리
			request.setCharacterEncoding( "utf-8" );
		
			// get parameters
			String name = request.getParameter( "name" );
			String year = request.getParameter( "year" );
			String age = request.getParameter( "age" );
			
			if( name == null || year == null || age == null ) {
				// 단 한개라도 parameter 를 못 받았을 경우,
				%>
				<form action="ex3_forward2.jsp" method="post" >
					<label for="name">이름</label>
					<input type="text" id="name" name="name" />
					<br />
					
					<label for="year">생년</label>
					<input type="text" id="year" name="year" />
					<br />
					
					<!-- 
					<label for="age">나이</label>
					<input type="text" id="age" name="age" />
					<br />
					 -->
					
					<input type="submit" value="보내기" />
				</form>
				<%
			} else {
				// parameter 를 전부 받은 경우
				%>
				<h1><%=name %>님은 <%=year %>년 생이므로 나이는 <%=age %>세 입니다.</h1>
				<%
			}
		%>
	
	</body>
</html>