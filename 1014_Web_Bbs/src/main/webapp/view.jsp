<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="mybatis.vo.CommVO"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.dao.BbsDAO"%>
<%@page import="mybatis.vo.BbsVO"%>
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
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
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
	
		
</style>

</head>
<body>
<%
	//요청시 한글처리
	request.setCharacterEncoding("utf-8");

	ApplicationContext ctx = 
	WebApplicationContextUtils.getWebApplicationContext(application);

	BbsDAO bbsDao = ctx.getBean(BbsDAO.class);	
	
	//파라미터 받기
	String cPage = request.getParameter("cPage"); // 다시 목록으로 돌아갈 때 필요함
	String b_idx = request.getParameter("b_idx"); // 해당 글의 기본키 - DB에서 검색할 조건
	
	BbsVO vo = bbsDao.getBbs(b_idx);
	if(vo != null){
%>
	<div id="bbs">
	<form method="post" >
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><%=vo.getSubject() %></td>
				</tr>
<%
			if(vo.getFile_name() != null){ //첨부된 파일이 있을 경우에만
%>
				<tr>
					<th>첨부파일:</th>
					<td><a href="javascript:down('<%=vo.getFile_name()%>')">
						<%=vo.getFile_name() %>
					</a></td>
				</tr>
<%
			}
%>				
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
						<input type="button" value="수정" onclick="edit()"/>
						<input type="button" value="삭제" onclick="del()"/>
						<input type="button" value="목록" onclick="goList()"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<form method="post" action="ans_write.jsp">
		이름:<input type="text" name="writer"/><br/>
		내용:<textarea rows="4" cols="55" name="content"></textarea><br/>
		비밀번호:<input type="password" name="pwd"/><br/>
		
		<%-- 원글의 정보 --%>
		<input type="hidden" name="b_idx" value="<%=b_idx%>">
		<input type="hidden" name="cPage" value="<%=cPage%>"/>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>"/>
		<input type="submit" value="저장하기"/> 
	</form>
	
	댓글들<hr/>
	<%
		List<CommVO> c_list = vo.getC_list();
		for(CommVO cvo : c_list){
	%>
		<div>
			이름:<%=cvo.getWriter() %> &nbsp;&nbsp;
			날짜:<%=cvo.getWrite_date() %><br/>
			내용:<%=cvo.getContent() %>
		</div>
		<hr/>
<%
		}
%>
	
	</div>
<%
	}//if문의 끝
%>	

	<form name="frm" method="post">
		<input type="hidden" name="cPage" value="<%=cPage %>"/>
		<input type="hidden" name="b_idx" value="<%=b_idx %>"/>
		<input type="hidden" name="f_name" />
	</form>


	<script>
		function goList(){
			//location.href="list.jsp?cPage=<%=cPage%>";
			
			document.frm.action = "list.jsp";
			document.frm.submit();
		}
		
		function edit(){
			document.frm.action = "edit.jsp";
			document.frm.submit();
		}
		
		function del(){
			if(confirm("정말 삭제하시겠습니까?")){
				document.frm.action = "del.jsp";
				document.frm.submit();
			}
		}
		
		function down(fname){
			document.frm.f_name.value = fname;
			document.frm.action = "download.jsp";
			document.frm.submit();
		}
	</script>
</body>
</html>










