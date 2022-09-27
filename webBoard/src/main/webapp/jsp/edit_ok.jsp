<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.net.InetAddress"%>
<%@page import="webBoard.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--
	enctype="multipart/form-data" 로 전송하게 되면,
	요청받는 write_ok.jsp 에서 일반적인 request.getParameter(); 로 받을 수 없다.
	때문에 useBean 을 이용해 한번에 vo 에 넣는게 안된다. 
 -->
<!-- 
<jsp:useBean id="vo" class="webBoard.vo.BbsVO" scope="page" />
<jsp:setProperty property="*" name="vo"/>
 -->

<%

	String realPath = application.getRealPath( "/bbs_upload" );

	// 아래의 라인을 실행 됨과 동시에 upload 가 자동으로 이루어진다.
	MultipartRequest multi = new MultipartRequest( request, realPath, 1024*1024*5, 
											"utf-8", new DefaultFileRenamePolicy() );
	
	String title = multi.getParameter( "subject" );
	String writer = multi.getParameter( "writer" );
	String content = multi.getParameter( "content" );
	
	String cPage = multi.getParameter( "cPage" );
	String idx = multi.getParameter( "idx" );
	
	// upload 된 file 서버상의 경로 확인
	File f = multi.getFile( "file" );
	
	String fname = null;
	String oname = null;
	
	if( f != null ) {
		fname = f.getName();
		oname = multi.getOriginalFileName( "file" );
	} 
	
	String ipAddress =  request.getRemoteAddr();
	if(ipAddress.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
	    InetAddress inetAddress=InetAddress.getLocalHost();
	    ipAddress = inetAddress.getHostAddress();
	}
	
	BbsDAO.editBBS( title, content, fname, oname, ipAddress, idx );
	
	// response.sendRedirect( "view.jsp?cPage="+ cPage + "&idx=" + idx );
%>
<body onload="exec()">
	<form action="view.jsp" method="post">
		<input type="hidden" name="cPage" value="<%=cPage %>" />
		<input type="hidden" name="idx" value="<%=idx %>" />
	</form>

	<script>
		function exec() {
			document.forms[0].submit();
		}
	</script>
</body>