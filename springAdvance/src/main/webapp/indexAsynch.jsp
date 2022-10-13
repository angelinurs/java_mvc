<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#table{
				width: 600px;
				border-collapse: collapse;
			}
			#table th, #table td {
				border: 1px solid black;
				padding: 4px;
			}
			#table thead tr{
				background-color: #dedede;
			}
			
			div#search_win{
				width: 250px;
				height: 90px;
				padding: 5px;
				border: 1px solid black;
				background-color: #fff;
				border-radius: 5px;
				position:absolute;
				top: 120px;
				left: 200px;
				text-align: right;
				display: none;
			}
			
			div#search_win input[type=text] {
				width: 100px;
				padding: 4px;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<header>
				<h1>전체 사원</h1>
			</header>
			<article>
				<header>
					<button type="button" class="s_btn" >이름 검색 </button>&nbsp;&nbsp;
					<button type="button" class="s_btn" >사번 검색 </button>&nbsp;&nbsp;
					<button type="button" class="s_btn" >입사일 검색 </button>
				</header>
				<section>
					<table id="table">
						<caption>사원정보</caption>
						<colgroup>
							<col width="80px" />
							<col width="*" />
							<col width="80px" />
							<col width="80px" />
						</colgroup>
						<thead>
							<tr>
								<th>사번</th>
								<th>이름</th>
								<th>입사일</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
<%
%>						
						</tbody>
					</table>
				</section>
			</article>
			
			<div id="search_win">
				<form method="post" action="searchAsynch.jsp">
					<input type="hidden" name="type" id="type" />
					
					<%--
						사번 검색시 보여질 영역
					 --%>
					<div id="s_empno">
						<label for="u_empno">검색할 사번:</label>
						<input type="text" id="u_empno" name="u_empno" />
					</div>
					
					<%--
						이름 검색시 보여질 영역
					 --%>
					<div id="s_name">
						<label for="u_name">검색할 이름:</label>
						<input type="text" id="u_name" name="u_name" />
					</div>
					
					<%--
						입사일 검색시 보여질 영역
					 --%>
					<div id="s_hdate">
						<label for="u_hdate">검색할 입사일:</label>
						<input type="text" id="u_hdate" name="u_hdate" />
					</div>
					
					<%--
						입사일 검색시 보여질 영역
					 --%>
					<div id="btn">
						<input type="button" id="search_btn" value="검색" />&nbsp;
						<input type="button" id="cancel_btn" value="취소" />
					</div>
					
				</form>
			</div>
		</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$( function() {
				$( ".s_btn" ).bind( "click", function(){
					let txt = $(this).text().split(" ")[0];
					/* console.log( txt ); */
					
					$( "#search_win div" ).css( "display", "none" );
					
					if( txt == "이름"  ) {
						$( "#search_win div#s_name" ).css( "display", "block" );
						$( "#type" ).val( "1" );
					}
					if( txt == "사번"  ) {
						$( "#search_win div#s_empno" ).css( "display", "block" );
						$( "#type" ).val( "0" );
					}
					if( txt == "입사일"  ) {
						$( "#search_win div#s_hdate" ).css( "display", "block" );
						$( "#type" ).val( "2" );
					}
					
					$( "#btn" ).css( "display", "block" );
					$( "#search_win" ).css( "display", "block" );
				});
				
				$( "#search_btn" ).bind( "click", function() {
					// document.forms[0].submit();
					
					$.ajax({
						url: "searchAsynch.jsp",
						data: $( "form" ).serialize(),
						type: "post",
						dataType: "html"
					}).done( function( res ) {
						$( "tbody" ).html( res );
						
					});
				});
				
				$( "#cancel_btn" ).bind( "click", function() {
					$( "#search_win" ).css( "display", "none" );
				});
			});
		</script>
	</body>
</html>