package model.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import properties_test.ToAction;

public class GenAction implements ToAction {

	@Override public String execute(HttpServletRequest req, HttpServletResponse res) {
		req.setAttribute( "msg", "연습 페이지" );
		return "/jsp/test_page.jsp";
	}

}
