<%@page import="ex1.vo.Test6"%>
<%@page import="ex1.vo.Test5"%>
<%@page import="ex1.vo.Test4"%>
<%@page import="ex1.vo.Test3"%>
<%@page import="ex1.vo.Test2"%>
<%@page import="ex1.vo.Test1"%>
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
	// 준비된 환경설정 파일( config.xml ) 로드
	// 이때 config.xml 에 정의된 모든 bean 들이 생성된다.
	BeanFactory bf = new ClassPathXmlApplicationContext( "config.xml" );
	
	// Test1 이라는 클래스가 t1 이라는 이름을 가지면서 생성되었다는 뜻이므로 
	// 우리 불러서 쓰면 된다.
	Test1 t1 = (Test1)bf.getBean( "t1" );
	Test2 t2 = (Test2)bf.getBean( "t2" );
	Test3 t3 = (Test3)bf.getBean( "t3" );
	Test4 t4 = (Test4)bf.getBean( "t4" );
	
	// 임의의 object 를 ( 여기서는 Test2 ) 맴버변수로 가지는 t5
	Test5 t5 = (Test5)bf.getBean( "t5" );
	Test6 t6 = (Test6)bf.getBean( "t6" );
%>	
	<h3><%=t1.getMsg() %></h3>
	
	<div>
		<h3><%=t2.getKey() %>!! <%=t2.getValue() %>!!</h3>
	</div>
	<div>
		<hr/>
		<h3><%=t3.getName() %>!! <%=t3.getAge() %>!!</h3>
		<h3><%=( t3.isAdult() )? "성인입니다." : "청소년입니다." %></h3>
	</div>
	<div>
		<hr/>
		<h3><%=t4.getName() %>!! <%=t4.getAge() %>!!</h3>
		<h3><%=( t4.isAdult() )? "성인입니다." : "청소년입니다." %></h3>
	</div>
	<div>
		<hr/>
		<h3><%=t5.getTt().getKey() %>!! <%=t5.getTt().getValue() %>!!</h3>
	</div>
	<div>
		<hr/>
		<h3><%=t6.getT3().getName() %>!! <%=t6.getT3().getAge() %>!! <%=t6.getValue() %></h3>
	</div>
	</body>
</html>