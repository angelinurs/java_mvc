<%@page import="java.io.File"%>
<%@page import="mybatis.dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding( "utf-8" );
	response.setContentType( "text/html; charset=utf-8" );
	
	String m_id = request.getParameter( "id" ); 
	String m_pw = request.getParameter( "pw" ); 
	String m_name = request.getParameter( "name" ); 
	String m_addr = request.getParameter( "addr" );
	
	String[] m_phone = request.getParameterValues( "phone" );
	
	int result  = MemDAO.registry(m_id, m_name, m_pw, m_phone, m_addr);
	
	if( result > 0 ) {
		// members 라는 폴더에 아이디와 동일한 이름으로 폴더를 생성해야 한다.
		// 현재 서버( application )의 members 라는 폴더에 정확한 절대경로 얻기
		String path = application.getRealPath( "/members/" + m_id );
		
		File f = new File( path );
		
		if( !f.exists() ) { f.mkdir(); }
%>
		alert( "Success" );
		<script>
		parent.location.href = "index.jsp";
		</script>
<%
	} else {
%>
		alert( "Fail" );
<%
	}
%>