package servlet_Ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic04_vo.Vo;

/**
 * Servlet implementation class Basic04_http_session_vo
 */
@WebServlet("/Basic04_http_session_vo")
public class Basic04_http_session_vo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Basic04_http_session_vo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding( "utf-8" );
		response.setContentType( "text/html; charset=utf-8;" );
		
		String id = request.getParameter( "id" );
		
		HttpSession session = request.getSession();
		
		Vo vo = new Vo();
		vo.setId( id );
		vo.setName( "Alex" );
		
		session.setAttribute( "test_vo", vo );
		
		PrintWriter out = response.getWriter();
		
		out.write( "<h2>저장완료</h2>" );
		out.write( "<a href='Basic04_http_session_vo_2'>[Next Servlet]</a>" );
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
