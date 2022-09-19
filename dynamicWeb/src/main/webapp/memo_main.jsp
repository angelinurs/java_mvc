<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/overcast/jquery-ui.css">
		<style type="text/css">
			#main_table table {
				border-collapse: collapse;
				width: 600px;
			}
			#main_table th  {
				border: 1px solid #000;
				padding: 4px;
				background-color: #efefef;
			}
			#main_table td  {
				border: 1px solid #000;
				padding: 3px;
			}
			
			#main_table thead td {
				text-align: right;
				border: none;
			}
			
			#main_table table caption {
				height: 0;
				text-indent: -9999px;
			}
			
			#insert_table {
				display: none;
				border-collapse: collapse;
			}
			
			#insert_table th  {
				text-align: left;
				margin: 0;
			}
			
			#insert_table input[type=text]  {
				width: 180px;
			}
		</style>
	</head>
	<body>
		<section>
			<article id="main_table">
				<table>
					<thead>
						<tr>
							<td colspan="6">
								<button type="button" id="input_frm_btn" name="input_frm_btn" >Add Book info</button>
							</td>
						</tr>
						<tr>
							<th>No</th>
							<th>Title</th>
							<th>Content</th>
							<th>PW</th>
							<th>Author</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody> </tbody>
				</table>
			</article>
			<article id="insert_table" title="Input Book Information" >
				<table>
					<thead>
						<tr>
							<th><label for="b_title">Title</label></th>
							<td>
								<input type="text" id="b_title" name="b_title" />
							</td>
							
						</tr>
						<tr>
							<th><label for="b_content">Content</label></th>
							<td>
								<textarea id="b_content" name="b_content" rows="5" cols="20" ></textarea>
							</td>
							
						</tr>
						<tr>
							<th><label for="b_pw">PW</label></th>
							<td>
								<input type="text" id="b_pw" name="b_pw" />
							</td>
							
						</tr>
						<tr>
							<th><label for="b_author">Author</label></th>
							<td>
								<input type="text" id="b_author" name="b_author" />
							</td>
							
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="button" id="add_btn" name="add_btn" >Add Book</button>
							</td>
						</tr>
					</thead>
					<tbody> </tbody>
				</table>
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
				$.ajax({
					url: "memo_all.jsp",
					type: "post"
				}).done( function( res ) {
					$( "#main_table table>tbody" ).empty();
					$( "#main_table table>tbody" ).append( res );
				});
				
				$( "#main_table #input_frm_btn" ).bind( "click", function() {
					$( "#insert_table" ).dialog( {
						width: 350
					});
				});
				
				$( "#insert_table #add_btn" ).bind( "click", function() {
					var title =  $( "#b_title" ).val();
					var content = $( "#b_content" ).val();
					var pw = $( "#b_pw" ).val();
					var author = $( "#b_author" ).val();
					var date = $( "#b_date" ).val();
					
					var params = "title=" + encodeURIComponent( title ) +
							     "&content=" + encodeURIComponent( content ) +
							     "&pw=" + encodeURIComponent( pw ) +
							     "&author=" + encodeURIComponent( author ) +
							     "&date=" + encodeURIComponent( date );
					
					$.ajax({
						url: "memo_insert.jsp",
						data: params,
						type: "post"
					}).done( function( res ) {
						location.reload();
					}).fail( function( err ) {
						console.log( err );
					});
				});
			});
		</script>
	
	</body>
</html>