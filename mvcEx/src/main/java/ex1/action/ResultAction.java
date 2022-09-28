package ex1.action;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ex1.dao.EmployeeDAO;
import ex1.vo.EmpVO;

public class ResultAction implements Action {

	@Override public String execute(HttpServletRequest req, HttpServletResponse res) {
		
		String cPage = req.getParameter( "cPage" );
		String searchType = req.getParameter( "searchType" );
		String searchValue = req.getParameter( "searchValue" );
		
		int nowPage = 1;
		
		if( cPage != null ) {
			nowPage = Integer.parseInt( cPage );
		}
		
		int begin = 1;
		int end = 10;
		
		EmpVO[] ar = EmployeeDAO.searchList(begin, end, searchType, searchValue );
		
		req.setAttribute( "ar", ar );
		
		return "/ex1/emp_list.jsp";
	}

}
