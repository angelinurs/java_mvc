<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//첨부파일은 MultipartRequest라는 객체를 생성하면 업로드가 된다.
	// 그렇다면 우린 MultipartRequest를 어떻게 생성하는지만 알고 있으면 된다.
	// 생성자를 확인해보니 인자 4개짜리 생성자를 활용하면 될것 같다.^^
	// 먼저 저장할 위치의 경로를 절대경로로 만들어야 한다.
	String realPath = application.getRealPath("/bbs/editor_img");

	MultipartRequest mr = new MultipartRequest(request, realPath, 
			1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
	//이때 이미 파일은 서버에 업로드가 된 상태다.
	
	//저장된 정확한 경로와 파일명을 반환해야 하므로 파일명을 얻어내야 한다.
	File f = mr.getFile("s_file");// 저장된 파일객체 얻기
	String o_name  = mr.getOriginalFileName("s_file");// 첨부당시의 파일명 
	String f_name = null;
	if(f != null)
		f_name = f.getName();// 저장된 파일명 
		
	if(f_name != null){	
%>    
{
	"url":"<%=request.getContextPath() %>/editor_img/<%=f_name %>"
}
<%
	}
%>












