<%@page import="webBoard.vo.BbsVO"%>
<%@page import="webBoard.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String cPage = request.getParameter( "cPage" );
	
	if( cPage == null ) 
		cPage = "1";
%>
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

				<tbody>
<%

	// 현재 page
	int nowPage = 1;
	// 한 page 당 보여질 게시물 수 
	int numPerPage = 10;
	// 한 block 당 보여질 page number 갯수
	int pagePerBlock = 5;
	
	// 촐 개시물 수
	int totalCount = BbsDAO.getTotalCount();

	// Case 01.
	// int totalPage = totalCount / numPerPage;
	// if( ( totalPage % numPerPage ) != 0 ) totalPage++;
	
	// Case 02.
	int totalPage = ( int )Math.ceil( ( double )totalCount / numPerPage );
	
	if( cPage != null ) {
		nowPage = Integer.parseInt( cPage );
		// 만약  현재 페이지 값이 총 페이지 값을 넘는다면
		
		if( nowPage > totalPage ) {
			nowPage = totalPage;
		}
	}
	
	// 각 페이지의 시작과 끝 구하기
	int begin = ( nowPage-1 ) * numPerPage + 1;
	int end = nowPage * numPerPage;

	
	// * 현재 페이지 값에 의해 블럭의 시작페이지 값 구하기
	int startPage = ( ( nowPage - 1 ) / pagePerBlock ) * pagePerBlock + 1;
	
	// block 의 마지막 page 값 구하기
	int endPage = startPage + pagePerBlock - 1;
	
	// endPage 가 totalPage 보다 크다면
	if( endPage > totalPage )	{
		endPage = totalPage;
	}
	
	BbsVO[] list =  BbsDAO.readAll( begin, end );

	
%>
<%
	if( list != null) {
		for( BbsVO vo : list ) {
%>				
					<tr>
						<td><%=vo.getB_idx() %></td>
						<td style="text-align: left">
							<a href="view.jsp?idx=<%=vo.getB_idx()%>&cPage=<%=cPage %>">
							<%=vo.getSubject() %>
							</a>
						</td>
						<td><%=vo.getWriter() %></td>
						<td><%=vo.getWrite_date() %></td>
						<td><%=vo.getHit() %></td>
					</tr>
<%
		} // end of for loop
	} else {
%>
					<tr>
						<td colspan="5">검색 결과 없음</td>
					</tr>
<% } %>
				</tbody>
				
				<tfoot>
                      <tr>
                          <td colspan="4">
                              <ol class="paging">
<%
		if( startPage < pagePerBlock ) {  // preview 기능을 할 경우
%>
								<li class="disable">&lt;</li>
<%
		} else {	// preview 기능을 못활 경우
%>
								<li><a href="list.jsp?cPage=<%=startPage-pagePerBlock %>">&lt;</a></li>
<%
		}

		for( int idx=startPage; idx <= endPage; idx++ ) {
			if( nowPage == idx ) { 
%>
								<li class="now"><%=idx%></li>

<% 			} else { %>
								<li><a href="list.jsp?cPage=<%=idx %>"><%=idx %></a></li>
<%
			} // end of if
		} // end of for
		
		if( endPage < totalPage ) {
			
%>						
								<li><a href="list.jsp?cPage=<%=startPage+pagePerBlock %>">&gt;</a></li>
<% 		} else { %>
								<li class="disable">&gt;</li>
<% 		}  %>
                              </ol>
                          </td>
						  <td>
							<input type="button" value="글쓰기"
								onclick="javascript:location.href='write.jsp?cPage=<%=nowPage %>'"/>
						  </td>
                      </tr>
				</tfoot>
				
			</table>
			
		</div>
	
	</body>
</html>