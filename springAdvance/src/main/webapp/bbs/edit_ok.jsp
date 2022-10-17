<%@page import="bbs.dao.BBsDAO"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	ApplicationContext ctx = 
		WebApplicationContextUtils.getWebApplicationContext( application );
	BBsDAO bbsDao =  ctx.getBean( BBsDAO.class );
	
	//파일이 저장될 위치를 절대경로로 만든다.
	String realPath = application.getRealPath("/bbs/bbs_upload");

	MultipartRequest mr = new MultipartRequest(request, realPath, 1024*1024*5,
			"utf-8", new DefaultFileRenamePolicy());
	//이미 첨부파일은 서버에 업로드가 된 상태다.
	
	// 나머지 파라미터들 받기
	String title = mr.getParameter("title");
	String writer = mr.getParameter("writer");
	String content = mr.getParameter("content");
	String b_idx = mr.getParameter("b_idx");
	String cPage = mr.getParameter("cPage");
	
	//이미 업로드된 파일정보
	File f = mr.getFile("file");
	
	String fname = null;
	String oname = null;
	if(f != null){
		fname = f.getName();
		oname = mr.getOriginalFileName("file");
	}
	
	String ip = request.getRemoteAddr();//현재 PC의 IP얻기
	
	bbsDao.editBBS( title, content, fname, oname, ip, b_idx );
	
	
	//response.sendRedirect("view.jsp?b_idx="+b_idx+"&cPage="+cPage);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="exe()">
	<form action="view.jsp" method="post">
		<input type="hidden" name="cPage" value="<%=cPage %>"/>
		<input type="hidden" name="b_idx" value="<%=b_idx %>"/>
	</form>
	[<%=writer %>]
	<script>
		function exe(){
			//현재문서(document)에서 첫번째 폼(forms[0])을 서버로 보낸다.
			document.forms[0].submit();
		}
	</script>
</body>
</html>






