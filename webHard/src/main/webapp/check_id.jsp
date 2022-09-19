<%@page import="mybatis.dao.MemDAO"%>
<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding( "utf-8" );
	response.setContentType( "text/html; charset=utf-8" );
	
	String m_id = request.getParameter( "m_id" );
	
	if( MemDAO.check_id( m_id ) ) {
%>
	<pre id="chk" class="success">Enable</pre>
<%
	} else {
%>
	<pre id="chk" class="fail">Duplicated</pre>
<%		
	}
%>