package bbs.action;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnsWriteAction implements Action {

	@Override public String execute(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter( "writer" );
		String content = request.getParameter( "content" );
		String pwd = request.getParameter( "pwd" );
		String b_idx = request.getParameter( "b_idx" );
		
		String ipAddress = request.getRemoteAddr();
		
		return null;
	}

}
