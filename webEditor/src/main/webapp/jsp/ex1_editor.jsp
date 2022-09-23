<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="../css/summernote-lite.css">
		<style>
			div.is_hidden {
            display: none;
	        }
	        
	        input[type=checkbox]:checked + .is_hidden {
	            display: block;
	            transition-duration: 1s;
	        }
	        
	        table caption {
	        	text-indent: -9999px;
	        	hight: 0;
	        }
	        
	        .btn {
	        	width: 70px;
	        	height: 20px;
	        	text-align: center;
	        	padding: 0;
	        }
	        
	        .btn a {
	        	display: block;
	        	width: 100%;
	        	height: 100%;
	        	padding: 4px;
	        	line-height: 20px;
	        	background: #27a;
	        	color: #fff;
	        	border-radius: 4px;
	        	text-decoration: none;
	        	font-weight: bold;
	        	font-size: 12px;
	        }
	        
	        .btn a:hover{
	        	color: #27a;
				background: #fff;
				border: 1px solid #27a;
	        }
		</style>
	</head>
	<body>
	
		<header>Editor exercise</header>
		
		<section>
			<article id="art_1">
				<header>&lt; start 1. &gt;</header>
				<label for="toggleBox">show</label>
	            <input type="checkbox" id="toggleBox" />
	            <div class="is_hidden">
					<form action="">
						<textarea rows="12" cols="50" id="content_0" name="s_content"></textarea>
					</form>
				</div>
			</article>
			<article id="art_2">
				<header>&lt; Image attach &gt;</header>
				<label for="toggleBox">show</label>
	            <input type="checkbox" id="toggleBox" />
	            <div class="ishidden">
					<form action="" method="post" name="frm">
						<table>
							<cation>게시판 테이블</cation>
							<colgroup>
								<col width="100px" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th>
										<label for="title">제목 : </label>
									</th>
									<td>
										<input type="text" id="title" name="title" />
									</td>
								</tr>
								
								<tr>
									<th>
										<label for="part">구분 : </label>
									</th>
									<td>
										<select id="part" name="part">
											<option>-- 선택하세요 --</option>
											<option value="language">Programming</option>
											<option value="db">Database</option>
											<option value="system">System</option>
										</select>
									</td>
								</tr>
								
								<tr>
									<th>
										<label for="interest">관심분야 : </label>
									</th>
									<td>
										<input type="checkbox" id="interest1" name="interest" value="blockchain" />블록체인 &nbsp;&nbsp;
										<input type="checkbox" id="interest2" name="interest" value="iot" />사물인터넷 &nbsp;&nbsp;
										<input type="checkbox" id="interest3" name="interest" value="metabus" />메타버스 &nbsp;&nbsp;
										<input type="checkbox" id="interest4" name="interest" value="smartcar" />스마트카 &nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<th>
										<label for="content_1">내용:</label>
									</th>
									<td>
										<textarea rows="12" cols="50" id="content_1"
											name="content"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: right">
										<p class="btn">
											<a href="javascript:sendData()">보내기</a>
										</p>
									</td>
								</tr>
								
							</tbody>
							
						</table>
					</form>
				</div>
			</article>
		</section>
	
	<script src="https://code.jquery.com/jquery-3.6.1.min.js" 
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
			crossorigin="anonymous">
	</script>
	<script src="../js/summernote-lite.js"></script>
	<script src="../js/lang/summernote-ko-KR.js"></script>
	<script>
		$(function() {
			$( "#content_0" ).summernote({
				lang: 'ko-KR',
				callbacks:{ 
					// 이미지가 Editor 에 추가 될때 만다 수행하는 곳
					// 이미지를 첨부하면 배열로 인식된다.
					// 이것을 서버로 비동기식 통신을 수행하면
					// 서버에 업로드를 시킬수 있다.
					onImageUpload: function( files, editor ) {
						for( var idx = 0; idx < files.length; idx++ ) {
							console.log( files[idx] );
						}
						
					}
				}
			});
			
			$( "#content_1" ).summernote({
				lang: 'ko-KR',
				height: 300,
				maxHeight: 400,
				callbacks:{ 
					// 이미지가 Editor 에 추가 될때 만다 수행하는 곳
					// 이미지를 첨부하면 배열로 인식된다.
					// 이것을 서버로 비동기식 통신을 수행하면
					// 서버에 업로드를 시킬수 있다.
					onImageUpload: function( files, editor ) {
						for( var idx = 0; idx < files.length; idx++ ) {
							sendImage(files[idx], editor ); // 이미지를 서버로 보낸다.
						}
						
					}
				}
			});
		});
		
		function sendImage( file, editor ) {
			// 서버로 이미지 파일을 보내기 위해 폼객체 생성
			let frm = new FormData(); // <form enctype="multipart/form-data"  <-- 이것 만드는 명령어
			
			// 보내고자 하는 파일 자원을 폼에 파라미터로 등록
			// "upload" 라는 이름으로 파일자원을 등록했다.
			frm.append( "upload", file );
			
			// 비동기식 통신
			$.ajax({
				url: "saveImage.jsp",
				data: frm,
				type: "POST",
				
				// 두개다 false 로 지정해야 일반적 데이터 전송이 아닌
				// 파일 첨부임을 명시함. 
				// 파일 첨부시 아래의 두 라인은 무조건 있어야 함.
				contentType: false,
				processData: false,
				
				dataType: "json"
			}).done( function( res ){
				// 이미지가 서버의 uoload_img 폴더에 저장 성공시
				// 이미지 경로를 "img_url" 이라는 이름으로 res 에 json 으로 바인딩되어 넘어온다.
				
				// Case 01.
				// let image = $( "<img>" ).attr( "src", res.img_url );
				// $( "#content_1" ).summernote( "insertNode", image[0] );
				
				$( "#content_1" ).summernote( "editor.insertImage", res.img_url );
				
			});
		};
		
		function sendData()	{
			let title = $( "#art_2 #title" ).val();
			
			if( title.trim().length < 1 ) {
				alert( "제목을 입력하세요" );
				$( "#art2 #title" ).val();
				$( "#art2 #title" ).focus();
				
				return;
			}
			
			/*
			let part = $( "#art_2 #part option:selected" ).val();
			let interests = $( "#art_2 input[name=interest]:checked" ).val();
			let content = $( "#art_2 #content" ).val();
			
			let params = "title=" + encodeURIComponent( title ) +
						"&part=" + encodeURIComponent( part ) +
						"&interest=" + encodeURIComponent( interest ) +
						"&content=" + encodeURIComponent( content );
			*/
			
			// console.log( params );
			document.frm.action="insert.jsp";
			document.frm.submit();
			
		}
	</script>
	</body>
</html>