<%@page import="bbs.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="bbs.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String cPage = request.getParameter( "cPage" );

	if( cPage == null ) {
		cPage = "1";
	}

	Object obj = request.getAttribute( "vo" );
	
	BbsVO vo = null;
	if( obj != null ) {
		vo = (BbsVO)obj;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="bbs/css/table.css" />
	</head>
	<body>
		<div id="bbs">
<%
	
%>
			<form method="post" >
				<table summary="게시판 글보기">
					<caption>게시판 글보기</caption>
					<tbody>
						<tr>
							<th>제목:</th>
							<td><%=vo.getSubject() %></td>
						</tr>
<% if( vo.getFile_name() != null ) { %>
						<tr>
							<th>첨부파일:</th>
							<td><a href="javascript:down( '<%=vo.getFile_name() %>' );">
								<%=vo.getFile_name() %>
							</a></td>
						</tr>
<% } %>
						<tr>
							<th>이름:</th>
							<td><%=vo.getWriter() %></td>
						</tr>
						<tr>
							<th>내용:</th>
							<td><%=vo.getContent() %></td>
						</tr>
						
						<tr>
							<td colspan="2">
								<input type="button" value="수정"
									 onclick="javascript:backList( 'edit' )" />
								<input type="button" value="삭제"
									 onclick="javascript:del();" />
								<input type="button" value="목록"
									 onclick="javascript:backList( 'list' )" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<form method="post" action="ans_write.jsp">
				이름:<input type="text" name="writer"/><br/>
				내용:<textarea rows="4" cols="55" name="content"></textarea><br/>
				비밀번호:<input type="password" name="pwd"/><br/>
				
				
				<input type="hidden" name="b_idx" value="<%=vo.getB_idx() %>">
				<input type="hidden" name="cPage" value="${cPage}"/>
				<input type="submit" value="저장하기"/> 
			</form>
			
			댓글들<hr/>
<%
	List<CommentVO> commentList = vo.getCommentList();
	for( CommentVO cvo : commentList ) {
%>			
				<div>
					이름:<%=cvo.getWriter() %> &nbsp;&nbsp;
					날짜:<%=cvo.getWrite_date() %><br/>
					내용:<%=cvo.getContent() %>
				</div>
				<hr/>
<%	} %>
		
			
			</div>
			<form name="frm" method="post">
				<input type="hidden" name="cPage" value"${cPage}"/>
				<input type="hidden" name="idx" value="<%=vo.getB_idx() %>"/>
				<input type="hidden" name="f_name" />
			</form>
	
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
			crossorigin="anonymous">
	</script>
	<script>
	function backList( page )	{
		// Case 01. get method.
		// location.href="list.jsp?cPage=${cPage }";
		
		// Case 02. post method
		let frm = document.createElement("form");
		frm.setAttribute("method", "POST");
		frm.setAttribute("action", page + "?cPage=${cPage }&idx=<%=vo.getB_idx() %>" );
		document.body.appendChild( frm );
		frm.submit();
	}
	
	function down( fname ) {
		document.frm.f_name.value = fname;
		document.frm.action = "download";
		document.frm.submit();
	}
	
	function del() {
		if( confirm( "Are you sure?" ) ) {
			document.frm.action = "delete";
			document.frm.submit();
			
		}
	}
	</script>
	</body>
</html>