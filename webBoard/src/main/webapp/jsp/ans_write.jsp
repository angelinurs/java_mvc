<%@page import="webBoard.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding( "utf-8" ); %>

<jsp:useBean id="vo" class="webBoard.vo.CommentVO" />
<jsp:setProperty property="*" name="vo" />

<%
	BbsDAO.insertComment(vo);
	response.sendRedirect( "view.jsp?cPage=" + vo.getcPage() + "&idx=" + vo.getB_idx() );
%>