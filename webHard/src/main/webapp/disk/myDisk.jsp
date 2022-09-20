<%@page import="java.io.File"%>
<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
public int getUsed( File path ) {
	
	int size = 0;
	for( File f : path.listFiles() ) {
		if( f.isDirectory() ) {
			size += getUsed( f );
		} 
		if( f.isFile() ) {
			size += f.length();
		}
	}
	
	return size;
}
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 600px;
		border: 1px solid #27a;
		border-collapse: collapse;
	}
	table th, table td{
		border: 1px solid #27a;
		padding: 4px;
	}
	table th{ background-color: #bcbcbc; }
	.title { background-color: #bcbcbc; width: 25%; }
	
	.btn{
		display: inline-block;
		width: 70px;
		height: 20px;
		text-align: center;
		padding:0px;	
		margin-right: 20px;	
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
	
	#f_win{
		width: 220px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
	#f_win2{
		width: 300px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
</style>
</head>
<body>

<%
	int totalSize = 1024 * 1024 * 10;
	int useSize = 0;

	
	// check login 
	Object obj = session.getAttribute( "mvo" );
	
	if( obj != null ) {
		MemVO mvo = (MemVO)obj;
		
		String dir = request.getParameter( "cPath" );
		
		String fname = request.getParameter( "f_name" );
		String undeleted = request.getParameter( "undeleted" );
		String notEmpty = request.getParameter( "notEmpty" );
		
		if( undeleted != null && notEmpty != null && notEmpty.equalsIgnoreCase( "true" ) ) {
			%>
			<script>
				alert( '<%=undeleted %> is not Empty' );
			</script>
			<%
		}
		
		if( dir == null ) {
			dir = mvo.getM_id();
		} else {
			if( fname != null && fname.trim().length() > 0 ) {
				dir = dir + "/" + fname;
			}
		}
		String path = application.getRealPath( "/members/" + mvo.getM_id() );
		useSize = getUsed( new File( path) );
		
		session.setAttribute( "cPath", dir );
%>
	<h1>My Disk service</h1>
	<hr/>
	(<span class="m_id"><%=mvo.getM_name() %></span>)님의 디스크
	&nbsp;[<a href="javascript:home()">Home</a>]
	<hr/>
	
	<table summary="사용량을 표시하는 테이블">
		<tbody>
			<tr>
				<th class="title">전체용량</th>
				<td><%=totalSize/1024 %> KB</td>
			</tr>
			<tr>
				<th class="title">사용량</th>
				<td><%=useSize/1024 %> KB</td>
			</tr>
			<tr>
				<th class="title">남은용량</th>
				<td><%=(totalSize-useSize)/1024 %> KB</td>
			</tr>
		</tbody>
	</table>
	<hr/>
		<div id="btn_area">
			<p class="btn">
				<a href="javascript:selectFile()">
					파일올리기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:makeFolder()">
				
					폴더생성
				</a>
			</p>
			<p class="btn">
				<a href="javascript:exe()">
					파일생성
				</a>
			</p>
		</div>		
	<hr/>
	
	<label for="dir">현재위치:</label>
	<span id="dir"><%=dir %></span>
	
	<table summary="폴더의 내용을 표현하는 테이블">
		<colgroup>
			<col width="50px"/>
			<col width="*"/>
			<col width="80px"/>
		</colgroup>
		<thead>
			<tr>
				<th>구분</th>
				<th>폴더 및 파일명</th>
				<th>삭제여부</th>
			</tr>
		</thead>
		<tbody>
		<%
			// members 디렉터리에서 로그인 한 자신의 폴더를 홈디렉토리로 지정
			// 그 안에 있는 모든 파일 또는 디렉토리들을 표현한다.
			
			// 현재 위치( dir ) 값과 아이디가 다를때만 상위 이동 가능
			
			if( !dir.equals( mvo.getM_id() ) ) {
				// 상위 폴더의 경로를 얻어내기
				int endIndex = dir.lastIndexOf( "/" );
				String parentDir = dir.substring( 0, endIndex );
		%>
		
			<tr>
				<td>↑</td>
				<td colspan="2">
					<a href="javascript:goUp('<%=parentDir%>')">
						상위로...
					</a>
				</td>
				
			</tr>
			
		<%
			}
		
			// 현재 위치 값( dir )을 가지고 절대경로로 만든다.
			String realPath = application.getRealPath( "/members/" + dir );
			
			File s_file = new File( realPath );
			
			// 생성된 File 객체 안에 존재하는 하위 요소들을 모두 얻어낸다.
			File[] sub_list = s_file.listFiles();
			
			for( File f : sub_list ) {
		%>
			<tr>
				<td>
			<% if( f.isFile() ) { %>
					<img src="../images/file.png"/>
			<% } else { %>
					<img src="../images/folder.png"/>
			<% } %>
				</td>
				<td>

			<% if( f.isDirectory() ) { %>
					<a href="javascript: gogo('<%=f.getName() %>')">
						<%=f.getName() %>
					</a>

			<% } else { %>
					<a href="javascript:down('<%=f.getName() %>')">
						<%=f.getName() %>
					</a>
			<% } %>
				</td>
				<td>
					<p class="btn">
						<a href="javascript:deleteFile('<%=f.getName() %>')">
							삭제하기
						</a>
					</p>
				</td>
			</tr>
		<% } %>

		</tbody>
	</table>
	
	<form name="ff" method="post">
		<input type="hidden" name="f_name"/>
		<input type="hidden" name="cPath" value="<%=dir%>"/>
	</form>
	
	
	<div id="f_win">
		<form action="makeFolder.jsp" method="post" name="frm">
			<input type="hidden" name="cPath" value="<%=dir%>"/>
			<label for="f_name">폴더명:</label>
			<input type="text" id="f_name" name="f_name"/><br/>
			<p class="btn">
				<a href="javascript:newFolder()">
					만들기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	

	<div id="f_win2">
		<form action="upload.jsp" method="post" name="frm2"
		enctype="multipart/form-data">
		
			<label for="selectFile">첨부파일:</label>
			<input type="file" id="selectFile" 
				name="upload"/><br/>
				
			<p class="btn">
				<a href="javascript:upload()">
					보내기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin2()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	
<% } else { %>
	<script>
		parent.location.href = "../index.jsp";
	</script>
<% } %>
	<script>
	
		function gogo( folderName ) {
			document.ff.f_name.value = folderName;
			
			document.ff.action = "myDisk.jsp";
			document.ff.submit();
		}
		
		function goUp( folderName ) {
			document.ff.cPath.value = folderName;
			
			document.ff.action = "myDisk.jsp";
			document.ff.submit();
		}
		
		function makeFolder()	{
			document.getElementById( "f_win" ).style.display = "block";
		}
		
		function closeWin()	{
			document.getElementById( "f_win" ).style.display = "none";
		}
		
		function newFolder()	{
			let fname = document.frm.f_name.value.trim();
			
			if( fname.length < 1 ) {
				alert( "Input folder name" );
				document.frm.fname = "";
				document.frm.fname.focus();
				return;
			}
			document.frm.submit();
		}
		
		function selectFile()	{
			document.getElementById( "f_win2" ).style.display = "block";
		}
		function closeWin2()	{
			document.getElementById( "f_win2" ).style.display = "none";
		}
		
		function upload()	{
			let select_fname = document.getElementById( "selectFile" ).value;
			
			if( select_fname.trim().length < 1 ) {
				alert( "파일을 선택하세요." );
				return;
			}
			
			document.frm2.submit();
		}
		
		function down( fname ) {
			// 파일을 클릭했을 때, 다운로드를 위해 들어오는 곳
			// 현재문서에 이름이 ff인 폼객체안에 있는 이름이 f_name 의 값을 
			// 인자로 전달되어 온 파일이름으로 지정한다.
			document.ff.f_name.value = fname;
			
			document.ff.action = "download.jsp";
			document.ff.submit();
			
			// submit 을 하고 난후 파일명이 남아서 발생할수 있는 오류 제거
			document.ff.f_name.value = ""; 
		}
		
		function deleteFile( fname ) {
			document.ff.f_name.value = fname;
			
			document.ff.action = "delete.jsp";
			document.ff.submit();
			document.ff.f_name.value = ""; 
		}
	</script>
</body>
</html>