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

	// u_id 파라미터를 받고
	String u_id = request.getParameter( "u_id" );
	// u_id session 으로 저장
	session.setAttribute( "m_id", u_id );
%>
		<h3>param.u_id : ${param.u_id}</h3>
		<h3>param.u_pw : ${param.u_pw}</h3>
		<h3>param.phone : ${param.phone} - </h3>
		<h3>param.phone1 : ${paramValues.phone[1]} - </h3>
		<h3>param.phone2 : ${paramValues.phone[2]} - </h3>
		
		<%--
			현재 페이지에서는 필요가 없는 파라미터 즉, cPage 는
			다음 페이지에서는 필요하다면, 다음 페이지로 이동할 때 파라미터로 
			다음과 같이 전달해야 한다.
		 --%>
		 <button type="button" onclick="javascript:location.href='ex2_res.jsp?cPage=${param.cPage}'">다음</button>
	
	</body>
</html>