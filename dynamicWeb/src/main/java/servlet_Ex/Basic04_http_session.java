package servlet_Ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Basic04_signup_id
 */
@WebServlet("/Basic04_http_session")
public class Basic04_http_session extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Basic04_http_session() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding( "utf-8" );
		response.setContentType( "text/html; charset=utf-8" );
		
		String id = request.getParameter( "id" );
		String pw = request.getParameter( "pw" );
		
		
		// get HttpSession
		HttpSession session = request.getSession();
		
		// store in HttpSession
		session.setAttribute( "user_id", id );
		session.setAttribute( "user_name", "Alex" );
		
		PrintWriter out = response.getWriter();
		
		out.write( "<h2>저장완료</h2>" );
		out.write( "<a href='Basic04_http_session2'>[Next Servlet]</a>" );
		
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
