package servlet_Ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.chrono.ChronoLocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Basic03_params_async
 */
@WebServlet("/Basic03_params_async")
public class Basic03_params_async extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Basic03_params_async() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "utf-8" );
		response.setContentType( "application/json; charset=utf-8" );
		
		String name = request.getParameter( "name" );
		String b_date = request.getParameter( "b_date" );
		LocalDate birth = LocalDate.parse( b_date, DateTimeFormatter.ISO_DATE );
		LocalDate today = LocalDate.now();
		
		long age = ChronoUnit.YEARS.between( birth, today ) + 1;
		
		StringBuffer sb = new StringBuffer();
		sb.append( "{\n \"name\" : \"" ).append( name ).append( "\",\n" );
		sb.append( "\"birth\" : \"" ).append( birth ).append( "\",\n" );
		sb.append( "\"today\" : \"" ).append( today ).append( "\",\n" );
		sb.append( "\"age\" : \"" ).append( age ).append( "\"\n}" );
		
		System.out.println( sb.toString() );
		
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
