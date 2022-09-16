package mvc220914.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mvc220914.vo.EmpVO;

/**
 * Servlet implementation class Search_emp
 */
@WebServlet("/Search_emp")
public class Search_emp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SqlSessionFactory factory;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search_emp() {
        super();
        
        Reader r = null;
		try {
			r = Resources.getResourceAsReader( "mvc220914/config/config.xml" );
			factory = new SqlSessionFactoryBuilder().build( r );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
				try {
					if( r != null ) r.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "utf-8" );
		response.setContentType( "text/html; charset=utf-8;" );
		
		String type = request.getParameter( "type" ).trim();
		String keyword = request.getParameter( "keyword" ).trim();
		
		EmpVO evo = new EmpVO();
		switch( type ) {
		case "1": 
			evo.setEmp_no( keyword );
			break;
		case "2": 
			evo.setFirst_name( keyword );
			break;
		case "3": 
			evo.setHire_date( keyword) ;
			break;
		}
		
		SqlSession sql = factory.openSession();
		
//		List<EmpVO> list = sql.selectList( "emp.findBykeyword", evo );
		
		Map<String, String> map = new HashMap<>();
		map.put( "searchType", type );
		map.put( "searchValue", keyword );
		
		List<EmpVO> list = sql.selectList( "emp.findBykeyword", map );
		sql.close();
		
		System.out.println( list.size() );
		
		StringBuffer sb = new StringBuffer();
		if( list.size() > 0 ) {
			sb.append( "<table>" );
			for( EmpVO vo : list ) {
				sb.append( "<tr>" );
				
				sb.append( "<td>" );
				sb.append( vo.getEmp_no() );
				sb.append( "</td>" );
				
				sb.append( "<td>" );
				sb.append( vo.getFirst_name() );
				sb.append( "</td>" );
				
				sb.append( "<td>" );
				sb.append( vo.getLast_name() );
				sb.append( "</td>" );
				
				sb.append( "<td>" );
				sb.append( vo.getGender() );
				sb.append( "</td>" );
				
				sb.append( "<td>" );
				sb.append( vo.getBirth_date() );
				sb.append( "</td>" );
				
				sb.append( "<td>" );
				sb.append( vo.getHire_date() );
				sb.append( "</td>" );
				
				sb.append( "</tr>" );
				
			}
			sb.append( "</table>" );
		} else {
			sb.append( "<Pre> no one employee about search keyword!! </Pre>" );
		}
		
		PrintWriter out = response.getWriter();
		out.write( sb.toString() );
		out.flush();
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
