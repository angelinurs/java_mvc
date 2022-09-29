package bbs.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SaveImgAction implements Action {

	@Override public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println( "saveimg");
		try {
			ServletContext application = request.getServletContext();
			
			String realPath = application.getRealPath( "/bbs/editor_img" );
			
			MultipartRequest multi = new MultipartRequest(request, realPath, 1024*1024*5, 
										"utf-8", new DefaultFileRenamePolicy() );
			
			File f = multi.getFile( "upload" );
			String fname = null;
			String oname = multi.getOriginalFileName( "upload" );
			
			if( f != null ) {
				fname = f.getName();
			}
			
			request.setAttribute( "fname", fname );
			request.setAttribute( "c_path", request.getContextPath() );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bbs/jsp/saveImg.jsp";
	}

}
