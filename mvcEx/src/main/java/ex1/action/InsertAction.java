package ex1.action;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ex1.dao.EmployeeDAO;
import ex1.vo.EmpVO;

public class InsertAction implements Action {

	@Override public String execute(HttpServletRequest req, HttpServletResponse res) {
		
		System.out.println( "=== invoke : 1 ====" );
		String cPage = req.getParameter( "cPage" );
		
		String emp_no = req.getParameter( "emp_no" );
		String first_name = req.getParameter( "first_name" );
		String last_name = req.getParameter( "last_name" );
		String hire_date = req.getParameter( "hire_date" );
		String gender = req.getParameter( "gender" );
		String birth_date = req.getParameter( "birth_date" );
		
		EmpVO evo = new EmpVO();
		evo.setEmp_no(emp_no);
		evo.setFirst_name(first_name);
		evo.setLast_name(last_name);
		evo.setHire_date(hire_date);
		evo.setGender(gender);
		evo.setBirth_date(birth_date);
	
//		<input type="hidden" name="type" value="add_employee" />
		
		int nowPage = 1;
		
		if( cPage != null ) {
			nowPage = Integer.parseInt( cPage );
		}
		
		int begin = 1;
		int end = 10;
		
		boolean resultOfinsert = EmployeeDAO.addEmployee( evo );
		
		req.setAttribute( "result", resultOfinsert );
		
		return null;
	}

}
