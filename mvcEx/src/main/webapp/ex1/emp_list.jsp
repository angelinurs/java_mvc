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
				<h1>사원 목록</h1>
			</header>
			<section>
				<table summary="사원 목록">
					<caption>사원 목록 테이블</caption>
					<colgroup>
						<col width="80px" />
						<col width="120px" />
						<col width="120px" />
						<col width="120px" />
						<col width="50px" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<td colspan="6">
								<button type="button" onclick="javascript:search();" >검색</button>
								<button type="button" onclick="javascript:add();" > 추가</button>
							</td>
						</tr>
						<tr>
							<th>사번</th>
							<th>이름</th>
							<th>성씨</th>
							<th>생일</th>
							<th>성별</th>
							<th>입사일</th>
						</tr>
					</thead>
					<tbody>
<%
	Object obj = request.getAttribute( "ar" );
	EmpVO[] ar = null;

	if( obj != null ) {
		ar = (EmpVO[])obj;
		
		for( EmpVO evo : ar ) {
%>
						<tr>
							<td><%=evo.getEmp_no() %></td>
							<td><%=evo.getFirst_name() %></td>
							<td><%=evo.getLast_name() %></td>
							<td><%=evo.getHire_date() %></td>
							<td><%=evo.getGender() %></td>
							<td><%=evo.getBirth_date() %></td>
						</tr>
<%
		}
	}
%>					
					</tbody>
				<script>
					function search()	{
						location.href="EmployeeControll?type=search";
					}
					
					function add() {
						location.href="EmployeeControll?type=add";
					}
				</script>
				</table>
			</section>
		</div>
	
	</body>
</html>