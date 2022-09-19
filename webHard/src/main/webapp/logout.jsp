<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.setAttribute( "mvo", null );

	// or
	// session.removeAttribute( "mvo" );
	
	response.sendRedirect("left.jsp");
%>