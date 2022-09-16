<%@page import="java.util.Iterator"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Map"%>
<%@page import="memo_220916.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%

	request.setCharacterEncoding( "utf-8" );
	response.setContentType( "text/html; charset=utf-8;" );
	
	Map<String, String> map = new Hashtable();
	
	Iterator it = request.getParameterNames().asIterator();
	
	while( it.hasNext() ) {
		String name = String.valueOf( it.next() );
%>
	<%= name  %>,
<%
		map.put( name, request.getParameter( name ) );
	}
	
	SqlSession ss = FactoryService.getMemo_factory().openSession();
	
	int result = ss.insert( "memo.insert", map );
	
	if( result > 0 ) {
		ss.commit();
	} else {
		ss.rollback();
	}
	ss.close();
	
	// response.sendRedirect( "memo_all.jsp" );

%>