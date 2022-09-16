package servlet_Ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Basic04_http_session2
 */
@WebServlet("/Basic04_http_session2")
public class Basic04_http_session2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Basic04_http_session2() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "utf-8" );
		response.setContentType( "text/html; charset=utf-8;" );
		
		HttpSession session = request.getSession();
		
		Iterator<String> it = session.getAttributeNames().asIterator();
		
		StringBuffer sb = new StringBuffer();
		
		while( it.hasNext() ) {
			String ss_name = it.next();
//			System.out.println( ss_name + " : " + session.getAttribute( ss_name ) );
			sb.append( "<strong>" + ss_name + "</strong>" );
			sb.append( "&nbsp:&nbsp;" );
			sb.append( "<strong>" + session.getAttribute( ss_name ) + "</strong>" );
			sb.append( "<br />" );
		}
		
		PrintWriter out = response.getWriter();
		
		out.write( sb.toString() );
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
