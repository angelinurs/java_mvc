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
			table tbody>tr:last-child>td {
				border: none;
				text-align: right;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<header>
				<h1>사원 추가 FORM</h1>
			</header>
			<section>
				<form name="frm" action="EmployeeControll" method="post">
					<table summary="사원 추가">
						<caption>사원 추가 테이블</caption>
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
								<th>사번</th>
								<th>이름</th>
								<th>성씨</th>
								<th>생일</th>
								<th>성별</th>
								<th>입사일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="text" name="emp_no" />
								</td>
								<td>
									<input type="text" name="first_name" />
								</td>
								<td>
									<input type="text" name="last_name" />
								</td>
								<td>
									<input type="text" name="hire_date" />
								</td>
								<td>
									<input type="text" name="gender" />
								</td>
								<td>
									<input type="text" name="birth_date" />
									<input type="hidden" name="type" value="add_employee" />
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<button type="button" onclick="javascript:add( this.form );" > 추가하기 </button>
								</td>
							</tr>				
						</tbody>
					</table>
				</form>
			</section>
		</div>
	<script>
		function add( frm ) {
			frm.submit();
		}
	</script>
	
	</body>
</html>