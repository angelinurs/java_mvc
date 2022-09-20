<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding( "utf-8" );

	String fname = request.getParameter( "f_name" );
	String cpath = request.getParameter( "cPath" );
	
	String path = application.getRealPath( "/members/" + cpath + "/" + fname );
	
	File f = new File( path );
	
	if( f.exists() ) {
		byte[] buf = new byte[2048];
		
		int readSize = -1;
		
		BufferedInputStream bis = null;
		FileInputStream fis = null;
		
		BufferedOutputStream bos = null;
		/*
		response 하기 위해 response object 에서 가져오는 OutputStream 이
		ServletOutputStream 이다.
		*/
		ServletOutputStream sos = null;
		
		try{
			
			response.setContentType( "application/x-msdownload" );
			response.setHeader( "Content-disposition", 
								"attachment;filename=" + new String( fname.getBytes(), "8859_1") );
			
			// download file 에 연결할 input stream 셍성
			
			fis = new FileInputStream( f);
			bis = new BufferedInputStream( fis );
			
			out.clear();
			out = pageContext.pushBody();
			
			sos = response.getOutputStream();
			bos = new BufferedOutputStream( sos );
			
			while( ( readSize = bis.read( buf ) ) != -1 ) {
				bos.write( buf, 0, readSize );
				bos.flush();
			}
			
		} catch( Exception e ) {
			e.printStackTrace();
		} finally {
			try {
				
				if( fis != null ) fis.close();
				if( bis != null ) bis.close();
				if( sos != null ) sos.close();
				if( bos != null ) bos.close();
			} catch ( IOException ioe ) {
				ioe.printStackTrace();
			}
		}
	}
%>