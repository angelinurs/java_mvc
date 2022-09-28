package ex1.action;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ex1.dao.EmployeeDAO;
import ex1.vo.EmpVO;

public class SearchAction implements Action {

	@Override public String execute(HttpServletRequest req, HttpServletResponse res) {
		
		// emp_list.jsp -> search button 누르면 당도하는 곳.
		
		return "/ex1/emp_search.jsp";
	}

}
