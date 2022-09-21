<%@page import="sign_inOut.dao.MemDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding( "utf-8" );
	response.setContentType( "text/html; charset=utf-8" );
%>
	<jsp:useBean id="mvo" class="sign_inOut.vo.MemVO" scope="page" />
	<jsp:setProperty property="*" name="mvo" />
<%
	int result  = MemDAO.registry( mvo );
%>