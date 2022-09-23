<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String realPath = application.getRealPath( "/editor_img" );

	MultipartRequest multi = new MultipartRequest( request, realPath, 1024*1024*5, "utf-8", 
												   new DefaultFileRenamePolicy() );
	// 이때 이미 파일은 서버에 업로드가 된 상태다.
	
	// 저장된 정확한 경로와 파일명 반환해야 하므로
	// 파일명을 얻어야 한다.
	File f = multi.getFile( "upload" ); // 저장된 파일 객체 얻기
	String o_name = multi.getOriginalFileName( "upload" ); // 저장된 파일 객체 얻기
	
	String f_name = null;
	if( f != null ) {
		f_name = f.getName();
	}
	
	if( f_name != null ) {
%>
{
	"img_url" : "<%=request.getContextPath() %>/editor_img/<%=f_name %>"
}
<% } %>