<%@page import="mvc220915.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log-in Main Page</title>
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	</head>
	
	<body>

<%!
	int fail_count = 0;
%>
<%
	Object obj = session.getAttribute( "mvo" );
	
	if( obj == null) {
		Object fail =  session.getAttribute( "fail" );
		if( fail != null ) {
			fail_count =  Integer.parseInt( String.valueOf( fail ) );
		}
%>		
		<div id="before">
			<form action="login_action.jsp" method="post" id="login_frm">
				<table>
					<tbody>
						<tr>
							<td>
								<label for="uid">ID : </label>
							</td>
							<td>
								<input type="text" id="uid" name="id" />
							</td>
						</tr>
						<tr>
							<td>
								<label for="upw">PW : </label>
							</td>
							<td>
								<input type="password" id="upw" name="pw" />
							</td>
						</tr>
						<tr>
							<td colspan="1">
								<button type="button" id="btn">Sign In</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<span id="fail_msg"></span>
		</div>
		
<%
	} else {
		MemberVO mvo = (MemberVO)obj;
%>
		<div id="msg_diag">
			<h1><%= mvo.getM_name() %>(<%= mvo.getM_id() %>) 님 로그인이 정상적으로 되셨습니다. </h1>
			<br />
			<button type="button" id="logout" name="logout">logout</button>
		</div>

<% } %>
	
	<!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" 
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
        crossorigin="anonymous"></script>
    
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"
		integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0=" 
		crossorigin="anonymous"></script>    
    
    <script>
    	$( function() {
    		if( <%= fail_count %> > 0 ) {
    			$( "#fail_msg" ).text( "Log in 에 실패했습니다." );
    			$( "#fail_msg" ).dialog();
    		}
    		
			$( "#btn" ).bind( "click", function() {
				/*
				let id = $( "#uid" ).val();
				let pw = $( "#upw" ).val();
				
				let param = "id=" + encodeURIComponent( id ) +
							"&pw=" + encodeURIComponent( pw );
				
				$.ajax({
					url: "login_action.jsp",
					type: "post",
					datatype: "json",
					data: param
				}).done( function( res ) {
					console.log( res );
				}).fail( function( err ) {
					console.log( err );
				})
				*/
				
				$( "#login_frm" ).submit();
				
			});
			
			$( "#logout" ).bind( "click", function() {
				location.href="login_out_action.jsp";
			});
		});
    	
    </script>
    
	</body>
</html>