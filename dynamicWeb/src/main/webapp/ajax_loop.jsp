<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	for( int idx=0; idx < 5; idx++ ) {
%>
		<%-- 현재 영역은 for 안에 속하지만 html 코드 영역이다. --%>
		<tr>
			<td><%=idx+1 %></td>
			<td><%=idx+2 %></td>
			<td><%=idx+3 %></td>
		</tr>
<%
	}
%>