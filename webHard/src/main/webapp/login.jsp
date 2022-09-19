<%@page import="mybatis.vo.MemVO"%>
<%@page import="mybatis.dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding( "utf-8" );
	response.setContentType( "text/html; charset=utf-8;" );
	
	String m_id = request.getParameter( "m_id" );
	String m_pw = request.getParameter( "m_pw" );
	
	MemVO mvo =  MemDAO.login(m_id, m_pw);
	
	session.setAttribute( "mvo", mvo );
 %>