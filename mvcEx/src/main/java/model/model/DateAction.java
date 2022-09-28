package model.model;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import properties_test.ToAction;

public class DateAction implements ToAction {

	public String execute( HttpServletRequest req, HttpServletResponse res ) {
		
		Date now = new Date( System.currentTimeMillis() );
		
		req.setAttribute( "date", now.toString() );
		
		// 뷰 페이지 경로 반환
		return "/jsp/page2.jsp";
	}
}
