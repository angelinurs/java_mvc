package bbs.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bbs.dao.BbsDAO;
import bbs.vo.BbsVO;

public class WriteAction implements Action {

	@Override public String execute(HttpServletRequest request, HttpServletResponse response) {
		String viewPath = "/bbs/jsp/write.jsp";
		
		// 요청한 곳으로부터 요청할 때 encType 을 얻는다.
		String c_type = request.getContentType();
		
		// get 방식일때는 encType 이 null 이다.
		// post 방식일때는 encType 이 application/...
		// 현재 우린 post 방식일 때는 파일첨부 때문에 encType 이 multipart/... 이다.
		
//		System.out.println( c_type );
		if( c_type != null && c_type.startsWith( "multipart") ) {
			
			//MultipartRequest 생성하여 첨부파일 업로드
			try {
				// cos 라이브러리에 있는 MultipartRequest object 를 생성하기 위해
				// 첨부된 파일이 저장될 위치를 절대경로화 시킨다.
				ServletContext application = request.getServletContext();
				
				String realPath = application.getRealPath( "/bbs/upload" );
				
				// 이때 첨부파일이 있었다면 알아서 upload 폴더에 저장된다.
				MultipartRequest multi = new MultipartRequest( request, realPath, 1024*1024*5, 
															"utf-8", new DefaultFileRenamePolicy() );
				// parameter 를 받고 db 에 저장
				String title = multi.getParameter( "subject" );
				String writer = multi.getParameter( "writer" );
				String content = multi.getParameter( "content" );
				String ip = request.getRemoteAddr();
				
				// 첨부파일이 있었는지 알아보자
				File f = multi.getFile( "file" );
				
				String oname = null;
				String fname = null;
				
				if( f != null ) {
					fname = f.getName();
					oname = multi.getOriginalFileName( "file" );
				}
				
				BbsVO vo = new BbsVO();
				vo.setSubject( title );
				vo.setWriter( writer );
				vo.setContent( content );
				vo.setFile_name( fname );
				vo.setOri_name( oname );
				vo.setIp( ip );
				
				// db 에 저장
				BbsDAO.insertBBS( vo );
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			viewPath = null;
		}
		
		return viewPath;
	}
}
