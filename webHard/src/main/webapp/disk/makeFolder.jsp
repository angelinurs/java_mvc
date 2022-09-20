<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding( "utf-8" );
	String path = request.getParameter( "cPath" );
	String fname = request.getParameter( "f_name" );
	
	String new_path = application.getRealPath( "/members/" + path + "/"+ fname );
	
	File f = new File( new_path );
	
	if( !f.exists() ) f.mkdir();
	
	response.sendRedirect( "myDisk.jsp?cPath=" + path );
%>