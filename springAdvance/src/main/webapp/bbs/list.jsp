<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="bbs.vo.BbsVO"%>
<%@page import="bbs.dao.BBsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	  
	#bbs table th,#bbs table td {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	    text-decoration: none;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
		
</style>
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
	ApplicationContext ctx = 
		WebApplicationContextUtils.getWebApplicationContext( application );

	BBsDAO bbsDao = ctx.getBean( BBsDAO.class );
	
	int nowPage = 1; //현재 페이지

	int numPerPage = 10;// 한 페이지당 보여질 게시물 수
	int totalCount = bbsDao.getTotalCount();// 총 게시물의 수 
	
	//한 블럭당 보여질 페이지 수(페이지 묶음)
	int pagePerBlock = 5;
	
	int totalPage = 0;// 전체 페이지 수
	/*
	totalPage = totalCount/numPerPage; // 102/10 ---->  10.
	if(totalCount%numPerPage != 0)
		totalPage++;
	
	Math클래스에 ceil함수는 결과인 소수점을 가장 가까운 높은 정수로
	전환하는 기능을 가졌다.
	*/
	totalPage = (int)Math.ceil((double)totalCount/numPerPage);//11

	//현재 페이지값을 파라미터로 받는다.
	String cPage = request.getParameter("cPage");
	if(cPage != null){
		nowPage = Integer.parseInt(cPage);
		
		//혹시나.. 현재페이지(nowPage) 값이 총 페이지 값(totalPage)을
		// 넘지 못하게 하자!
		if(nowPage > totalPage)
			nowPage = totalPage;
	}

	// 각 페이지의 시작과 끝(begin, end)지정한다.
	//   현재페이지가 1: begin:1, end: 10
	//   현재페이지가 2: begin:11, end: 20
	//   현재페이지가 3: begin:21, end: 30
	//   현재페이지가 4: begin:31, end: 40
	//   현재페이지가 5: begin:41, end: 50

	int begin = (nowPage-1)*numPerPage+1;
	int end = nowPage*numPerPage;
	
	//현재페이지 값에 의해 블럭의 시작페이지 값 구하기
	int startPage = ((nowPage-1)/pagePerBlock)*pagePerBlock+1;
	
	//블록의 마지막 페이지 값 구하기
	int endPage = startPage + pagePerBlock - 1;
	
	// endPage가 총 페이지 수보다 더 크다면
	// 총 페이지 수보다 더 큰 페이지 값이 표현 되는것은 맞지 않다.
	// 즉, endPage가 totalPage보다 크면 totalPage값으로 변경하자!
	if(endPage > totalPage)
		endPage = totalPage;
	
	BbsVO[] ar = bbsDao.getList(begin, end);
	if(ar != null){
		for(BbsVO vo : ar){
%>			
				<tr>
					<td><%=vo.getB_idx() %></td>
					<td style="text-align: left">
						<a href="view.jsp?cPage=<%=nowPage%>&b_idx=<%=vo.getB_idx() %>">
							<%=vo.getSubject() %>
						<%
							if(vo.getC_list() != null && vo.getC_list().size() > 0){
								//원글안에 있는 댓글이 있다면
						%>
								(<%=vo.getC_list().size() %>)
						<%		
							}
						%>	
						</a>
					</td>
					<td><%=vo.getWriter() %></td>
					<td><%=vo.getWrite_date() %></td>
					<td><%=vo.getHit() %></td>
				</tr>
<%
		}//for의 끝
	}//if문의 끝
%>
			</tbody>
			
			<tfoot>
                      <tr>
                          <td colspan="4">
                              <ol class="paging">
               
<% 
	if(startPage < pagePerBlock){ // 더 이상 이전을 할 수 없는 경우
%>
		<li class="disable">&lt;</li>
<%		
	}else{ //이전 기능을 수행할 수 있는 경우
%>                                  
		<li><a href="list.jsp?cPage=<%=startPage-pagePerBlock%>">&lt;</a></li>
<%
	}
	for(int i=startPage; i<=endPage; i++){
		
		if(nowPage == i){ //i가 현재페이지 값과 같을 때
%>
			<li class="now"><%=i %></li>
<%			
		}else{  //i가 현재페이지 값과 다를 때
%>         
			<li><a href="list.jsp?cPage=<%=i%>"><%=i %></a></li>
<%
		}
	}
	
	//다음 블록으로 이동하는 기능을 부여해야 할지? 하지 말아야 할지?를
			//endPage가 totalPage보다 작을 경우만에 부여하자!
	if(endPage < totalPage){
%> 
		<li><a href="list.jsp?cPage=<%=startPage+pagePerBlock%>">&gt;</a></li>
<%
	}else{
%>
		<li class="disable">&gt;</li>
<%		
	}
%>	
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