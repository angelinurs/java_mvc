<%@page import="java.net.InetAddress"%>
<%@page import="webBoard.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="vo" class="webBoard.vo.BbsVO" scope="page" />
<jsp:setProperty property="*" name="vo"/>

<%
	String ipAddress =  request.getRemoteAddr();
	if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
	    InetAddress inetAddress=InetAddress.getLocalHost();
	    ipAddress = inetAddress.getHostAddress();
	}
	
	vo.setIp( ipAddress );
	
	BbsDAO.insertBBS( vo );
%>

<ul>
	<li><%=ipAddress %></li>
	<li><%=vo.getSubject() %></li>
	<li><%=vo.getContent() %></li>
	<li><%=vo.getWriter() %></li>
</ul>
<%
	response.sendRedirect( "list.jsp" );
%>