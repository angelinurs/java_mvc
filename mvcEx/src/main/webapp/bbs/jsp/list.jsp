<%@page import="bbs.util.Paging"%>
<%@page import="bbs.vo.BbsVO"%>
<%@page import="bbs.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="bbs/css/table.css" /> 
		<link rel="stylesheet" href="bbs/css/paging.css" /> 
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
<%
	// paging 을 위해 request 에서 "page" 라는 이름으로 저장된 객체를 얻어낸다.
	Object obj2 = request.getAttribute( "page" );
	Paging pvo = null;
	
	if( obj2 != null ) {
		pvo = ( Paging )obj2;
		
		// 더 이상 이동을 할 수 없는 경우. (ex. prev or next)
		if( pvo.getStartPage() < pvo.getPagePerBlock() ) {
%>
								<li class="disable">&lt;</li>
<% } else {	// 이동을 할 수 있는 경우. (ex. prev or next) %>
								<li><a href="bbsCon?type=list&cPage=<%=pvo.getStartPage() - pvo.getPagePerBlock() %>">&lt;</a></li>
<%
		}

		for( int idx= pvo.getStartPage(); idx <= pvo.getEndPage(); idx++ ) {
			if( pvo.getNowPage() == idx ) { 
%>
								<li class="now"><%=idx%></li>

<% 			} else { %>
								<li><a href="bbsCon?type=list&cPage=<%=idx %>"><%=idx %></a></li>
<%
			} // end of if
		} // end of for
		
		// 다음 블록으로 이동하는 기능을 부여할지 말지를
		// endPage 가 totalPage 보다 작을 경우에만 부여
		if( pvo.getEndPage() < pvo.getTotalPage() ) {
			
%>						
								<li><a href="bbsCon?type=list&cPage=<%=pvo.getStartPage() + pvo.getPagePerBlock() %>">&gt;</a></li>
<% 		} else { %>
								<li class="disable">&gt;</li>
<% 		}
	}	
%>
                              </ol>
                          </td>
						  <td>
							<input type="button" value="글쓰기"
								onclick="javascript:location.href='bbsCon?type=write&cPage=<%=pvo.getNowPage() %>'"/>
						  </td>
                      </tr>
				</tfoot>
	
				<tbody>
<%

	// 게시물 목록 가져오기
	Object obj = request.getAttribute( "ar" );

	if( obj != null ) {
		BbsVO[] ar = (BbsVO[])obj; 

		for( BbsVO vo : ar ) {
%>				
					<tr>
						<td><%=vo.getB_idx() %></td>
						<td style="text-align: left">
						<%--
							MVC 환경에서 제목을 클릭했을 때, view.jsp 로 바로 이동하는 것이 아니라
							컨트롤러에 type 의 parameter 값을 "view" 로 전달하여
							ViewAction 이 수행하고 view.jsp 로 forward 가 되어야 한다.
							이때 필요한 parameter 는  cPage, b_idx 가 필요하다.
						 --%>
							<a href="bbsCon?type=view&cPage=<%=pvo.getNowPage() %>&b_idx=<%=vo.getB_idx() %>">
							<%=vo.getSubject() %>
							<%
								out.print( ( vo.getCommentList() != null && vo.getCommentList().size() > 0 )? "(" + vo.getCommentList().size() + ")": "(0)" ); 
							%>
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
				
			</table>
			
		</div>
	
	</body>
</html>