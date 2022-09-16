<%@page import="memo_220916.vo.MemoVO"%>
<%@page import="java.util.List"%>
<%@page import="memo_220916.service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	SqlSession ss = FactoryService.getMemo_factory().openSession();

	List< MemoVO> list = ss.selectList( "memo.all" );
	
	StringBuffer sb = new StringBuffer();
	for( MemoVO vo : list ) {
		sb.append( "<tr>" );
		sb.append( "<td>" );
		sb.append( vo.getM_idx() );
		sb.append( "</td>" );
		
		sb.append( "<td>" );
		sb.append( vo.getTitle() );
		sb.append( "</td>" );
		
		sb.append( "<td>" );
		sb.append( vo.getContent() );
		sb.append( "</td>" );
		
		sb.append( "<td>" );
		sb.append( vo.getPw() );
		sb.append( "</td>" );
		
		sb.append( "<td>" );
		sb.append( vo.getWriter() );
		sb.append( "</td>" );
		
		sb.append( "<td>" );
		sb.append( vo.getWrite_date() );
		sb.append( "</td>" );
		
		sb.append( "</tr>" );
	}
	
	out.write( sb.toString() );
	out.flush();
	ss.close();
%>