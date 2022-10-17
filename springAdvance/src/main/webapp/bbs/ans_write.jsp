<%@page import="bbs.dao.BBsDAO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");
%>    
<jsp:useBean id="vo" class="bbs.vo.CommVO" scope="page"/>
<jsp:setProperty property="*" name="vo"/><%-- 모든 파라미터 값들을 받아서 vo 즉
										CommVO에 멤버변수들에게 저장한다. --%>
<%
	ApplicationContext ctx = 
		WebApplicationContextUtils.getWebApplicationContext( application );
	
	BBsDAO bbsDao = ctx.getBean( BBsDAO.class );

	bbsDao.addAns(vo);

	//원래 있던 view.jsp로 강제 이동
	response.sendRedirect("view.jsp?cPage="+vo.getcPage()+"&b_idx="+vo.getB_idx());
%>										

