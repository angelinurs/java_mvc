<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
	// session.setAttribute( "mvo", null );
	session.removeAttribute( "mvo" );
	response.sendRedirect( "login_main.jsp" );
%>
