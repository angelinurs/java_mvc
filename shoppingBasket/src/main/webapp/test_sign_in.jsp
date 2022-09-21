<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<link rel="stylesheet" href="css/sign_in.css">
	</head>
<body>
<%
	Object obj = session.getAttribute( "mvo" );
	if( obj == null ) {
%>
	<div id="log_fail" class="">
		
		<form action="" method="post">
			<table>
				<colgroup>
					<col width="50px"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<td><label for="s_id">ID:</label></td>
						<td>
							<input type="text" id="s_id" name="u_id"/>
						</td>
					</tr>
					<tr>
						<td><label for="s_pw">PW:</label></td>
						<td>
							<input type="password" id="s_pw" name="u_pw"/>
						</td>
					</tr>
					<tr>
						<td>
							<p class="btn">
								<a href="javascript:exe()">
									로그인
								</a>
							</p>							
						</td>
						<td class="txt_r">
							<p class="btn">
								<a href="javascript:reg()">
									회원가입
								</a>
							</p>							
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
<%
	} else {
		// MemVO vo = (MemVO)obj;
%>
	<div id="log_suc" class="">
		
		<!-- 
		<p>(마루치)님 환영</p>
		 -->
		<p><%="vo.getM_name()" %> 님 환영</p>
		<p class="btn">
			<a href="logout.jsp">로그아웃</a>
		</p>
		<p class="btn">
			<a href="javascript:memo()">메모장</a>
		</p>
	</div>
	

	<form>
		<input type="hidden" name="res" id="res" value=""/>
	</form>
<%
	}
%>

		
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
			crossorigin="anonymous">
	</script>
	
	<script>
	function reg()	{
		// 아래와 같이 하면 왼쪽에 회원 가입 창이 나타난다.
		// location.href = "reg.jsp";
		// 현재창의 부모영역( parent ) 에서 이름이 right 인 곳에 위치가 변하게 해야한다.
		parent.right.location.href = "reg.jsp";
	}	
	
	function exe() {
		let m_id = $( "#s_id" ).val().trim();
		let m_pw = $( "#s_pw" ).val().trim();
		
		if( m_id.length < 1 ) {
			$( "#s_id" ).val( "" );
			$( "#s_id" ).focus();
			return;
		}
		
		if( m_pw.length < 1 ) {
			$( "#s_pw" ).val( "" );
			$( "#s_pw" ).focus();
			return;
		}
		
		let param = "m_id=" + encodeURIComponent( m_id ) +
					"&m_pw=" + encodeURIComponent( m_pw );
		$.ajax( {
			url: "login.jsp",
			data: param,
			type: "post"
		}).done( function(res){
			$( "#log_suc>p:first-child" ).text( m_id );
			parent.location.reload(); 
		});
	}
	</script>
</body>
</html>