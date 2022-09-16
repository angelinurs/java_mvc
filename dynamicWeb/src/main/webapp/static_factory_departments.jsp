<%@page import="mvc220916.vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="mvc220916.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlSession ss = FactoryService.getFactory().openSession();

	List< DeptVO > list = ss.selectList( "dept.all" );
	
	StringBuffer sb = new StringBuffer();
	if( list != null ) {
		for( DeptVO vo : list ) {
			sb.append( "<tr>");
			sb.append( "<td>" + vo.getDept_no() + "</td>");
			sb.append( "<td>" + vo.getDept_name() + "</td>");
			sb.append( "<td>" + vo.getEmp_no() + "</td>");
			sb.append( "<td>" + vo.getName() + "</td>");
			sb.append( "</tr>");
		}
	}
	ss.close();
	out.write( sb.toString() );
	out.flush();
%>
