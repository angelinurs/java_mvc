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
	BeanFactory bf = new ClassPathXmlApplicationContext( "beansConfig.xml" );

	// EmpDAO 를 찾아온다.
	EmpDAO e_dao = (EmpDAO)bf.getBean( "empDAO" );
	
	// 전체 사원을 가져오기
	EmpVO[] ar = e_dao.getAll();
	
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