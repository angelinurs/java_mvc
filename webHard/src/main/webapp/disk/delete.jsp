<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding( "utf-8" );
	String fname = request.getParameter( "f_name" );
	String cPath = request.getParameter( "cPath" );
	
	String path = application.getRealPath( "/members/" + cPath + "/" + fname );
	
	File f = new File( path );
	
	boolean result = false;
	if( f.exists() ) {
		if( f.isFile() ) {
			f.delete();
		}
		if( f.isDirectory() ) {
			if( f.listFiles().length == 0 ) {
				f.delete();
			} else {
				result = true;
			}
		}
	}
	
	// response.sendRedirect( "myDisk.jsp?cPath=" + cPath );
	response.sendRedirect( "myDisk.jsp?cPath=" + cPath + "&notEmpty=" + result + "&undeleted=" + fname );
%>