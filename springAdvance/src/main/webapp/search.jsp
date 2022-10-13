<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="mybatis.vo.EmpVO"%>
<%@page import="mybatis.dao.EmpDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.beans.factory.BeanFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
<%
	request.setCharacterEncoding( "utf-8" );
	String type = request.getParameter( "type" );
	String uempno = request.getParameter( "u_empno" );
	String uname = request.getParameter( "u_name" );
	String uhdate = request.getParameter( "u_hdate" );
	
	Map<String, String> map = new HashMap<>();
	
	/* 
	if( type.equalsIgnoreCase( "0" ) ) {
		map.put( "emp_no", uempno );
	}
	else if( type.equalsIgnoreCase( "1" ) ) {
		map.put( "first_name", uname );
	}
	else if( type.equalsIgnoreCase( "2" ) ) {
		map.put( "hire_date", uhdate );
	}
	 */
	if( type != null ) {
		
		switch( Integer.parseInt( type ) ) {
			case 0:
				map.put( "emp_no", uempno );
				break;
			case 1:
				map.put( "first_name", uname );
				break;
			case 2:
				map.put( "hire_date", uhdate );
				break;
			default:
				break;
		}
	}

	// 이미 톰캣이 구동 되기 전에 리스너에 의해서 applicationContext.xml 이 
	// 로드 되어 그 안에 있던 bean 객체들이 모두 생성된 상태다. 그리고
	// 그 bean 객체들은 현재 프로젝트 즉, 현재 context( ServletContext )에 등록된 상태다.
	// BeanFactory bf = new ClassPathXmlApplicationContext( "beansConfig.xml" );

	ApplicationContext ctx = 
			WebApplicationContextUtils.getWebApplicationContext( application );

	// EmpDAO 를 찾아온다.
	//EmpDAO e_dao = (EmpDAO)bf.getBean( "empDAO" );
	// EmpDAO e_dao = (EmpDAO)ctx.getBean( "empDAO" );
	EmpDAO e_dao = ctx.getBean( EmpDAO.class );
	
	
	// 전체 사원을 가져오기
	EmpVO[] ar = e_dao.searchByMap( map );
	
	if( ar != null ) {
		
		out.println( "<ul>" );
		for( EmpVO evo : ar ) {
			out.println( "<li>" + evo.getEmp_no() + 
							" " + evo.getFirst_name() + 
							" " + evo.getHire_date() + "</li>" );
			
		}
		out.println( "<ul>" );
	}
%>
	
	</body>
</html>