package servlet_Ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Basic02
 */
@WebServlet("/Basic02")
public class Basic02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Basic02() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding( "utf-8" );
		response.setContentType( "text/html; charset=utf-8" );
		
		String u_id =  request.getParameter( "id" );
		String u_pw =  request.getParameter( "pw" );
		
//		Map<String, String[]> u_info = request.getParameterMap();
		
		PrintWriter out = response.getWriter();
		
		if( u_id.equalsIgnoreCase( "admin" ) ) {
			
			out.print("<strong> 관리자 </strong>");
		} else {
			
			out.print("<strong> 일반회원 </strong>");
			out.print("<br />");
			out.print("<strong> ID : " + u_id + "</strong>");
			out.print("<br />");
			out.print("<strong> PW : " + u_pw + "</strong>");
		}
		
		
		out.close();
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
