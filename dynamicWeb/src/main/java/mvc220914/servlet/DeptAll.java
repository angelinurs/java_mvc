package mvc220914.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mvc220914.vo.DeptVO;

/**
 * Servlet implementation class DeptAll
 */
@WebServlet("/DeptAll")
public class DeptAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SqlSessionFactory factory;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptAll() {
        super();
        
        try {
        	Reader r = Resources.getResourceAsReader( "mvc220914/config/config.xml" );
        	
        	factory = new SqlSessionFactoryBuilder().build( r );
        	
        	r.close();
        } catch ( IOException ioe ) {
			ioe.printStackTrace();
		} 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SqlSession ss = factory.openSession();
		
		List<DeptVO> list = ss.selectList( "dept.all" );
		
		response.setContentType( "text/html; charset=utf-8;" );
		
		PrintWriter out = response.getWriter();
		
		out.write( "<ul>" );
		for( DeptVO vo : list ) {
			out.write("<li>" + vo.getDept_no() + "&nbsp:&nbsp");
			out.write( vo.getDept_name() + "</li>");
		}

		out.write( "</ul>" );
		out.close();
		
		ss.close();
		
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
