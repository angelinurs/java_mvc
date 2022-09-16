<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/overcast/jquery-ui.css">
		<style type="text/css">
			table {
				border-collapse: collapse;
				width: 600px;
			}
			th  {
				border: 1px solid #000;
				padding: 4px;
				background-color: #efefef;
			}
			td  {
				border: 1px solid #000;
				padding: 3px;
			}
			
			thead td {
				text-align: right;
				border: none;
			}
			
			table caption {
				height: 0;
				text-indent: -9999px;
			}
		
		
		</style>
	</head>
	<body>
		<section id="wrap">
			<article>
				<h1>부서목록</h1>
				<table>
					<caption>부서테이블</caption>
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="150px" />
						<col width="150px" />
					</colgroup>
					<thead>
						<tr>
							<td colspan="4">
								<button type="button" id="all_btn">전체</button>
								<button type="button" id="dept_btn">부서검색</button>
							</td>
						</tr>
						<tr>
							<th>부서번호</th>
							<th>부서명</th>
							<th>부서장 사번</th>
							<th>부서장 이름</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<span id="search_window" style="display: none; margin: 0; padding: 0;">
					<input type='text' id='keyword' name='keyword' value='Marketing' />
					<button type='button' id='search_btn' name='search_btn'>Search</button>
				</span>
			</article>
		</section>
		
		 <!-- jquery CDN -->
    	<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
	        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
	        crossorigin="anonymous"></script>
        
	    <!-- jquery UI CDN -->
	    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js" 
	    	integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0=" 
	    	crossorigin="anonymous"></script>
	
		<script>
			$( function() {
				$( "#all_btn" ).bind( "click", function(){
					$.ajax({
						url: 'static_factory_departments.jsp',
						type: 'post'
					}).done( function( data ) {
						$( '#wrap tbody' ).empty();
						$( '#wrap tbody' ).append( $(data) );
					}).fail( function( err ) {
						console.log( err );
					})
					
				});
			});
			
			$( function() {
				// search_dept -> first
				$( "#dept_btn" ).bind( "click", function(){
					
					$( "#search_window" ).dialog();
				});
				
				// search_dept -> second
				$( "#search_btn" ).bind( "click", function(){
					var keyword = $( "#search_window #keyword" ).val();
					
					var param = "keyword=" + encodeURIComponent( keyword );
					
					$.ajax({
						url: 'static_factory_by_dept_name.jsp',
						type: 'post',
						data: param
					}).done( function( data ) {
						$( '#wrap tbody' ).empty();
						$( '#wrap tbody' ).append( $(data) );
					}).fail( function( err ) {
						console.log( err );
					})
					
				});
			});
		</script>
	</body>
</html>