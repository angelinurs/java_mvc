<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>EL form 연습</h1>
		<form action="ex2_ok.jsp" method="post">
			<label for="s_id">ID:</label>
			<input type="text" id="s_id" name="u_id" />
			<br />
			<label for="s_pw">PW:</label>
			<input type="password" id="s_pw" name="u_pw" />
			<br />
			<input type="hidden" name="cPage" value="5" />
			
			<label for="s_phone">PHONE:</label>
			<select id="s_phone" name="phone" >
				<option value="010">010</option>
				<option value="017">017</option>
				<option value="011">011</option>
			</select>
			<label for="s_phone2">-</label>
			<input type="text" id="s_phone2" name="phone" />
			<label for="s_phone3">-</label>
			<input type="text" id="s_phone3" name="phone" />
			<br />
			
			<button type="button" onclick="javascript:sendData( this.form )">보내기</button>
		</form>
		
	<script>
		function sendData( frm ) {
			frm.submit();
		}
	</script>
	</body>
</html>