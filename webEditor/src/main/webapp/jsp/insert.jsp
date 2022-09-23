<%@page import="webEditor.dao.S_noteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding( "utf-8" );
%>
<jsp:useBean id="vo" class="webEditor.vo.S_note" scope="page" />
<jsp:setProperty property="*" name="vo"/>
<%
	boolean result = S_noteDAO.createSnote(vo);
%>
<%=(result)? "완료":"실패" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><%=vo.getTitle() %></li>
		<li><%=vo.getPart() %></li>
		<li><%=vo.getM_interest() %></li>
		<li><%=vo.getContent() %></li>
	</ul>

</body>
</html>