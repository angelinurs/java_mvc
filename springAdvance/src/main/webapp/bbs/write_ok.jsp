<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="bbs.dao.BBsDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 요청한 곳의 폼객체가 파일이 첨부되어 encType이 multipart/form-data로
	// 지정됐다면 일반적인 request로 파라미터를 받을 수 없다.
	// cos.jar에 있는 MultipartRequest객체를 생성하여 받아야 한다.
	
	ApplicationContext ctx = 
		WebApplicationContextUtils.getWebApplicationContext( application );

	BBsDAO bbsDao = ctx.getBean( BBsDAO.class );
	
	//먼저 파일이 저장될 위치를 절대경로로 준비가 되어 있어야 한다.
	String realPath = application.getRealPath("/bbs/bbs_upload");

	MultipartRequest mr = new MultipartRequest(request, realPath, 1024*1024*5,
			"utf-8", new DefaultFileRenamePolicy());
	// 이때 첨부된 파일이 있다면 서버 bbs_upload폴더에 업로드가 된다.
	
	// 나머지 파라미터들을 받아야 한다.
	String title = mr.getParameter("title");
	String writer = mr.getParameter("writer");
	String content = mr.getParameter("content");
	
	//저장된 파일명을 얻기위해 업로드된 파일객체를 얻어내자!
	File f = mr.getFile("file");
	
	//만약! 파일첨부를 하지 않았다면 f는 null이다.
	String fname = "";
	String oname = "";
	if(f != null){
		//파일첨부가 된 경우
		fname = f.getName();//현재 저장된 파일명
		oname = mr.getOriginalFileName("file");
		//만약 파일명이 변경되지 않았다면 fname과 oname은 같다.
	}
	
	//글쓴이의 ip알아내기
	String ip = request.getRemoteAddr();
	
	//DB에 저장!!!
	bbsDao.add(title, writer, content, fname, oname, ip);
	
	response.sendRedirect("list.jsp");
%>    




