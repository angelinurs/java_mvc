<%@page import="webBoard.vo.BbsVO"%>
<%@page import="webBoard.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="../css/table.css" /> 
		<link rel="stylesheet" href="../css/paging.css" /> 
	</head>
	<body>
		
		<div id="bbs">
			<table summary="게시판 목록">
				<caption>게시판 목록</caption>
				<thead>
					<tr class="title">
						<th class="no">번호</th>
						<th class="subject">제목</th>
						<th class="writer">글쓴이</th>
						<th class="reg">날짜</th>
						<th class="hit">조회수</th>
					</tr>
				</thead>
				
				<tfoot>
                      <tr>
                          <td colspan="4">
                              <ol class="paging">
                                  
								<li><a href="#">이전으로</a></li>
								<li class="now">1</li>
								<li><a href="#">2</a></li>
								<li><a href="#">다음으로</a></li>
			
                              </ol>
                          </td>
						  <td>
							<input type="button" value="글쓰기"
								onclick="javascript:location.href='write.jsp'"/>
						  </td>
                      </tr>
				</tfoot>

				<tbody>
<%
	BbsVO[] list =  BbsDAO.readAll();

	if( list != null) {
		for( BbsVO vo : list ) {
%>				
					<tr>
						<td><%=vo.getB_idx() %></td>
						<td style="text-align: left">
							<a href="view.jsp?idx=<%=vo.getB_idx()%>">
							<%=vo.getSubject() %>
							</a>
						</td>
						<td><%=vo.getWriter() %></td>
						<td><%=vo.getWrite_date() %></td>
						<td><%=vo.getHit() %></td>
					</tr>
<%
		}
	} else {
%>
					<tr>
						<td colspan="5">검색 결과 없음</td>
					</tr>
<% } %>
				</tbody>
			</table>
			
		</div>
	
	</body>
</html>