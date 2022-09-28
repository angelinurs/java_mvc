<%@page import="ex1.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			table {
				width: 600px;
				border-collapse: collapse;
			}
			table th, table td {
				border: 1px solid #000;
				padding: 4px;
			}
			table caption {
				text-indent: -9999px;
				height: 0;
			}
			table thead>tr:first-child>td {
				border: none;
				text-align: right;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<header>
				<h1>검색 페이지</h1>
			</header>
			<section>
				<form action="EmployeeControll" method="post" >
					<%--
						검색 결과를 처리하는 action 을 지정.
					 --%>
					<input type="hidden" name="type" value="result" />
					
					<select name="searchType" >
						<option value="0">사번</option>
						<option value="1">이름</option>
						<option value="2">입사일</option>
					</select>
					
					<input type="text" name="searchValue" />
					
					<button type="button" onclick="sendData( this.form )" >검색</button>
				</form>
			</section>
		</div>
	<script>
		function sendData( frm ) {
			let str = frm.searchValue.value;
			
			if( str.trim().length < 1 ) {
				alert( "검색할 문자열을 입력하세요." );
				
				frm.searchValue.value="";
				frm.searchValue.focus();
				
				return;
			}
			
			frm.submit(); // EmployeeControll?type=result&searchType=0&searchValue=10001
		}
	</script>
	</body>
</html>