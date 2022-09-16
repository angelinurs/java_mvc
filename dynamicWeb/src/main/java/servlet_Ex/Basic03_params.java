package servlet_Ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Basic03_params
 */
@WebServlet("/Basic03_params")
public class Basic03_params extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Basic03_params() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "utf-8" );
		response.setContentType( "text/html; charset=utf-8;" );
		
		Map<String, String[]> params = request.getParameterMap();
		
		StringBuffer sb = new StringBuffer();
		
		Iterator<String> it = request.getParameterNames().asIterator();
		
		while( it.hasNext() ) {
			String key = it.next();
			
			sb.append( key ).append( " : " );
			if( key.equalsIgnoreCase( "hobby" ) ) {
				String[] hobbies = params.get(key);
				
				sb.append( String.join( ", ", hobbies ) );
				
			} else {
				sb.append( params.get(key)[0] );
			}
			sb.append( "<br />" );
			
		}
		
		PrintWriter out = response.getWriter();
		
		out.print( sb.toString() );
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
