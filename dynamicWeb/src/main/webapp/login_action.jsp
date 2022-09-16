<%@page import="java.io.PrintWriter"%>
<%@page import="mvc220915.vo.MemberVO"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactoryBuilder"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.io.Resources"%>
<%@page import="java.io.Reader"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	SqlSessionFactory factory;
	int fail_count = 0; // login fail count
	// MemberVO mvo = null;
%>
    
<%
	request.setCharacterEncoding( "utf-8" );
	response.setContentType( "text/plain; charset=utf-8" );
	
	Map<String, String> map = new HashMap<>();
	
	map.put( "id", request.getParameter( "id" ) );
	map.put( "pw", request.getParameter( "pw" ) );
	
	if( factory == null ) {
		Reader r = Resources.getResourceAsReader( "mvc220915/config/config.xml" );
		factory = new SqlSessionFactoryBuilder().build( r );
		
		r.close();
	}
		
	SqlSession ss = factory.openSession();
	
	MemberVO mvo = ss.selectOne( "member.findByIdAndPw", map );
	
	ss.close();
	
	session = request.getSession();
	
	if( mvo != null ) {
		session.setAttribute( "mvo", mvo );
		fail_count = 0;
	} else {
		fail_count++;
	}
	
	session.setAttribute( "fail", String.valueOf( fail_count ) );
	
%>
<jsp:forward page="login_main.jsp"/>