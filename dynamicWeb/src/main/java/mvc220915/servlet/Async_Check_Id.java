package mvc220915.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mvc220915.vo.MemberVO;

/**
 * Servlet implementation class Async_Check_Id
 */
@WebServlet("/Async_Check_Id")
public class Async_Check_Id extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SqlSessionFactory factory;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Async_Check_Id() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "utf-8" );
		response.setContentType( "text/plain; charset=utf-8;" );
		
		String id =  request.getParameter( "u_id" );
		
		Reader r = Resources.getResourceAsReader( "mvc220915/config/config.xml" );
		
		factory = new SqlSessionFactoryBuilder().build( r );
		
		SqlSession ss = factory.openSession();
		
		MemberVO mvo = ss.selectOne( "member.findById", id);
		
		ss.close();
		
		PrintWriter out = response.getWriter();
		out.print(  "{ \"msg\" :\"" + ( ( mvo == null )? "0": "1" ) + "\", \"color\" : \"" + ( ( mvo == null )? "red": "blue" ) + "\"}" );
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
