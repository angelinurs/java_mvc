package model.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HiAction {

	public String execute( HttpServletRequest req, HttpServletResponse res ) {
		req.setAttribute( "str", "Nice to meet you." );
		
		// 뷰 페이지 경로 반환
		return "/jsp/page3.jsp";
	}
	

}
