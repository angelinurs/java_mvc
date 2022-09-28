package properties_test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GreetAction implements ToAction {
	
	public String execute( HttpServletRequest req, HttpServletResponse res ) {
		req.setAttribute( "msg", "환영합니다." );
		
		// 뷰 페이지 경로 반환
		return "/jsp/page1.jsp";
	}
}
