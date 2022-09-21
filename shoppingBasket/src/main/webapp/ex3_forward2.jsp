<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//요청시 한글처리
	request.setCharacterEncoding( "utf-8" );

	//get parameters
	String name = request.getParameter( "name" );
	String year = request.getParameter( "year" );
	
	int age=0;
	// int now = new Date().getYear( );
	Calendar now = Calendar.getInstance();
	int thisYear = now.get( Calendar.YEAR );
	
	
	if( name == null || year == null ) {
		// parameter 값중 하나라도 받지 못했다면, 
		// 다시 앞페이지로 이동
		response.sendRedirect( "ex3_forward.jsp" );
	} else {
		// parameter 를 전부 구했다면 나이를 구하기
		
		age = thisYear - Integer.parseInt( year ) + 1;
		%>
			<jsp:forward page="ex3_forward.jsp">
				<jsp:param value="<%=age %>" name="age"/>
			</jsp:forward>
		<%
	}
%>
