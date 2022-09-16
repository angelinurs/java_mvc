<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter( "no" );
	String sep = request.getParameter( "sep" );
	String name = request.getParameter( "name" );
	String contact = request.getParameter( "contact" );
%>
<tr>
	<td><%=no%></td>
	<% if( sep.equals("admin") ) { %>
		<td class="sep_red"><%=sep%></td>
	<% } else { %>
		<td><%=sep%></td>
	<% } %>
	<td><%=name%></td>
	<td><%=contact%></td>
</tr>