<%@page import="webBoard.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String idx = request.getParameter( "idx" );
	String cPage = request.getParameter( "cPage" );
	
	boolean result = BbsDAO.deleteBBS( idx );

%>

<body onload="exec()">
	<form action="list.jsp" method="post">
		<input type="hidden" name="cPage" value="<%=cPage %>" />
<% if( !result ) { %>
		<input type="hidden" name="idx" value="<%=idx %>" />
<%	} %>
	</form>

	<script>
		function exec() {
			document.forms[0].submit();
		}
	</script>
</body>
