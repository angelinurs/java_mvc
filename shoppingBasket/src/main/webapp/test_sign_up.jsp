<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>test Sign up</title>
		
		<link rel="stylesheet" href="css/sign_up.css">
	</head>
	<body>
		<div id="wrap">
			<form action="test_registry.jsp" method="post">
				<table>
					<colgroup>
						<col width="100px"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<th><label for="s_id">ID:</label></th>
							<td>
								<input type="text" id="s_id" name="m_id"/>
								<div id="box"></div>
							</td>
						</tr>
						<tr>
							<th><label for="s_pw">PW:</label></th>
							<td>
								<input type="text" id="s_pw" name="m_pw"/>
							</td>
						</tr>
						<tr>
							<th><label for="s_name">NAME:</label></th>
							<td>
								<input type="text" id="s_name" name="m_name"/>
							</td>
						</tr>
						<tr>
							<th><label for="s_addr">ADDR:</label></th>
							<td>
								<input type="text" id="s_addr" name="m_addr"/>
							</td>
						</tr>
						
						<tr>
							<th><label for="s_phone">PHONE:</label></th>
							<td>
								<input type="text" id="s_phone" name="m_phone" class="phone"/>
								- <input type="text" name="m_phone" class="phone"/>
								- <input type="text" name="m_phone" class="phone"/>
							</td>
						</tr>
						
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" >
								<p class="btn">
									<a href="javascript:reg()">
										회원가입
									</a>
								</p>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
			crossorigin="anonymous">
	</script>
	
	<script>
	
	$( function(){
		$( "#s_id" ).bind( "keyup", function() {
			let m_id = $( "#s_id" ).val().trim();
			
			console.log( m_id );
			
			if( m_id.length > 3 ) {
				let param = "m_id=" + encodeURIComponent( m_id );
				$.ajax({
					url: "check_id.jsp",
					type: "post",
					data: param
				}).done( function( res ){
						$( "#box" ).html( res );
				}).fail( function( err ){
					console.log( err );
				});
			} else {
				$( "#box" ).html("");
			}
		});
	});
	
	function reg() {
		
		/*
		let chk = $( "#chk" ).hasClass( "success" );
		
		if( !chk ) {
			alert( "아이디를 확인하세요" );
			$( "#s_id" ).focus();
			return;
		}
		*/
		
		let pw = $( "#s_pw" ).val();
		let name = $( "#s_name" ).val();
		
		if( !pw ) {
			alert( "아이디를 확인하세요" );
			$( "#s_pw" ).focus();
			return;
		}
		
		if( !name ) {
			alert( "아이디를 확인하세요" );
			$( "#s_name" ).focus();
			return;
		}
		
		document.forms[0].submit();
	}
	</script>
	</body>
</html>