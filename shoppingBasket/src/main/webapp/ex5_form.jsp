<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%--
			아이디, 비밀번호, 이름, 취미를 입력하는 form
		 --%>
		 <form action="ex5.jsp" id="frm">
		 	<table>
		 		<tbody>
		 			<tr>
		 				<td>
		 					<label for="uid">ID :</label>
		 				</td>
		 				<td>
		 					<input type="text" id="uid" name="id" />
		 				</td>
		 			</tr>
		 			
		 			<tr>
		 				<td>
		 					<label for="upw">Password :</label>
		 				</td>
		 				<td>
		 					<input type="password" id="upw" name="pw" />
		 				</td>
		 			</tr>
		 			
		 			<tr>
		 				<td>
		 					<label for="uname">name :</label>
		 				</td>
		 				<td>
		 					<input type="text" id="uname" name="name" />
		 				</td>
		 			</tr>
		 			
		 			<tr>
		 				<td>
		 					<label for="hobby">Hobby :</label>
		 				</td>
		 				<td>
		 					<label for="reading">Reading </label>
		 					<input type="checkbox" id="reading" name="hobby" value="reading">
		 					<label for="walking">Walking </label>
		 					<input type="checkbox" id="walking" name="hobby" value="walking">
		 					<label for="driving">Driving </label>
		 					<input type="checkbox" id="driving" name="hobby" value="driving">
		 					
		 				</td>
		 			</tr>
		 			
		 			<tr>
		 				<td col="2">
		 					<input type="submit" id="submit" value="submit" />
		 				</td>
		 			</tr>
		 			
		 		</tbody>
		 	</table>
		 </form>
	</body>
</html>