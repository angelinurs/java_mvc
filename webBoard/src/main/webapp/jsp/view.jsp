<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="webBoard.vo.BbsVO"%>
<%@page import="webBoard.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String cPage =  request.getParameter( "cPage" );
	
	if( cPage == null ) {
		cPage = "1";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="../css/table.css" />
	</head>
	<body>
		<div id="bbs">
<%
	request.setCharacterEncoding( "utf-8" );
	String idx = request.getParameter( "idx" );
	
	BbsVO vo =  BbsDAO.searchById( idx );
	
%>
			<form method="post" >
				<table summary="게시판 글보기">
					<caption>게시판 글보기</caption>
					<tbody>
						<tr>
							<th>제목:</th>
							<td><%=vo.getSubject() %></td>
						</tr>
		
						<tr>
							<th>첨부파일:</th>
							<td><a href="#">
								<%=vo.getFile_name() %>
							</a></td>
						</tr>
						
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
								<input type="button" value="수정"/>
								<input type="button" value="삭제"/>
								<input type="button" value="목록"
									 onclick="javascript:location.href='list.jsp?cPage=<%=cPage %>';" />
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<form method="post" action="ans_write.jsp">
				이름:<input type="text" name="writer"/><br/>
				내용:<textarea rows="4" cols="55" name="comm"></textarea><br/>
				비밀번호:<input type="password" name="pwd"/><br/>
				
				
				<input type="hidden" name="b_idx" value="">
				<input type="hidden" name="index" value=""/>
				<input type="submit" value="저장하기"/> 
			</form>
			
			댓글들<hr/>
			
				<div>
					이름:글쓴이 &nbsp;&nbsp;
					날짜:날짜<br/>
					내용:댓글 내용
				</div>
		
			
			</div>
	
	<script>
	function backList()	{
		location.href="list.jsp?cPage=<%=cPage %>";
	}
	</script>
	</body>
</html>