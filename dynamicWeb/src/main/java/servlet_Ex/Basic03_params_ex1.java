package servlet_Ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Basic03_params_ex1
 */
@WebServlet("/Basic03_params_ex1")
public class Basic03_params_ex1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Basic03_params_ex1() {
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
			String[] values = params.get(key); 
			
			
			if( key.contentEquals( new StringBuffer( "fname" ) ) ) {
				sb.append( "친구 : " );
				List<String> friends = new ArrayList<>();
				for( int idx=0; idx < values.length; idx++ ) {
					if( values[ idx ].trim().length() > 0 ) {
						friends.add( values[ idx ].trim() );
					}
				}
				sb.append( String.join( ", ", friends ) );
			} else {
				sb.append( "지역 : " ).append( values[0] );
			}
			sb.append( "<br />" );
		}
		
		PrintWriter out  = response.getWriter();
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
