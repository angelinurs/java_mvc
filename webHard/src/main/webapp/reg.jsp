<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<style>
			.btn{
				width: 70px;
				height: 20px;
				text-align: center;
				padding:0px;		
			}
			.btn a{
				display: block;
				width: 100%;
				padding: 4px;
				height: 20px;
				line-height: 20px;
				background: #27a;
				color: #fff;
				border-radius: 3px;
				text-decoration: none;
				font-size: 12px;
				font-weight: bold;
			}
			.btn a:hover{
				background: #fff;
				color: #27a;
				border: 1px solid #27a;
			}
			
			div#wrap{
				width: 400px;
				margin: 30px auto;
			}
			
			table th, table td{
				padding: 3px;
			}
			table tbody td>input{
				width: 120px;
				border: 1px solid #27a;
				border-radius: 3px;
				padding: 4px;
			}
			.txt_r{ text-align: right; }
			.phone{ width: 50px; }
			
			.success{ color: #00f; font-weight: bold; font-size: 11px;}
			.fail{ color: #f00; font-weight: bold; font-size: 11px; }
			
			div#box{
				display: inline-block;
				width: 65px;
				height: 20px;
				padding: 0;
				margin: 0;
				margin-left: 3px;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<form action="registry.jsp" method="post">
				<table>
					<colgroup>
						<col width="100px"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<th><label for="s_id">ID:</label></th>
							<td>
								<input type="text" id="s_id" name="id"/>
								<div id="box"></div>
							</td>
						</tr>
						<tr>
							<th><label for="s_pw">PW:</label></th>
							<td>
								<input type="text" id="s_pw" name="pw"/>
							</td>
						</tr>
						<tr>
							<th><label for="s_name">NAME:</label></th>
							<td>
								<input type="text" id="s_name" name="name"/>
							</td>
						</tr>
						<tr>
							<th><label for="s_addr">ADDR:</label></th>
							<td>
								<input type="text" id="s_addr" name="addr"/>
							</td>
						</tr>
						<tr>
							<th><label for="s_phone">PHONE:</label></th>
							<td>
								<input type="text" id="s_phone" name="phone" class="phone"/>
								- <input type="text" name="phone" class="phone"/>
								- <input type="text" name="phone" class="phone"/>
							</td>
						</tr>
						<!-- 
						<tr>
							<th>
								<label for="s_email">EMAIL:</label>
							</th>
							<td>
								<input type="text" id="s_email" name="email"/>
							</td>
						</tr>					
						 -->
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
		
		let chk = $( "#chk" ).hasClass( "success" );
		
		if( !chk ) {
			alert( "아이디를 확인하세요" );
			$( "#s_id" ).focus();
			return;
		}
		
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