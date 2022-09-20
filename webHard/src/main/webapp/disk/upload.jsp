<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding( "utf-8" );
	String fname = request.getParameter( "upload" );
	
	Object obj =  session.getAttribute( "cPath" );
	
	if( obj != null ) {
		
		String dir = String.valueOf( obj );
		
		String path = application.getRealPath( "/members/" + dir );
		
		MultipartRequest multi = new MultipartRequest( request, path, 
													   3 * 1024 * 1024, new DefaultFileRenamePolicy() );
		
		response.sendRedirect( "myDisk.jsp?cPath=" + dir );
	}

%>