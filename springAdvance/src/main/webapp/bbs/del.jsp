<%@page import="bbs.dao.BBsDAO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ApplicationContext ctx = 
		WebApplicationContextUtils.getWebApplicationContext( application );

	BBsDAO BbsDAO =  ctx.getBean( BBsDAO.class );
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");
	String cPage = request.getParameter("cPage");
	String b_idx = request.getParameter("b_idx");
	
	if( BbsDAO.delBBS(b_idx) > 0){
		response.sendRedirect("list.jsp?cPage="+cPage);	
	}else{
		response.sendRedirect("view.jsp?cPage="+cPage+"&b_idx="+b_idx);	
	}
%>    
