package properties_test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class controller
 */
@WebServlet("/prop_controller")
public class controller5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String path = "/WEB-INF/action.properties";
	
	// action.properties 에는 클래스의 경로를 가지고 있다.
	// 이것을 가져와서 객체로 생성한 후 저장할 곳을 생성한다.
	private Map<String, ToAction> actionMap;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controller5() {
        super();
        // TODO Auto-generated constructor stub
        
        actionMap = new HashMap<>();
    }
    

    // servlet 실행시 최초 한번 실행되는 init method 재 정의 하기
	@Override public void init() throws ServletException {
		// 생성자 다음에 수행하는 함수
		// 첫 요청자에 의해 단 한번만 수행하는 곳
		
		// 현재 서블릿이 생성될 때 맴버변수인 path 르 ㄹ가지고 절대경로화 시킨다.
		// 절대 경로화 시키기 위해서, ServletContext 를 생성하면 된다.
		// jsp 에서 application object 의 class 에 해당.
		
		ServletContext application = getServletContext();
		
		String realPath = application.getRealPath( path );
		
		// 위의 path를 이용하여, Stream 을 통해 
		// 해당 경로의 class 를 Properties Object 를 만든다.
		Properties props = new Properties();
		
		// 읽어올 stream 준비
		FileInputStream fis = null;
		try {
			File f = new File( realPath );
			
			fis = new FileInputStream( f );
			
			// stream 통해 읽어온 내용 key:value 로 저장
			props.load( fis );
		} catch ( IOException ioe ) {
			ioe.printStackTrace();
		} finally {
			try {
				if( fis != null ) fis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		Iterator<Object> it = props.keySet().iterator();
		
		while( it.hasNext() ) {
			String key = String.valueOf( it.next() );
			
			String value = props.getProperty( key );
			
			try {
				// Class 의 정확한 경로를 가지고
				// 새롭게 클래스를 생성한다.
				// 아래는 기존의 것을 지속으로 사용하므로 적합하지 않다.
				// Object obj = Class.forName(value);
				Object obj = Class.forName(value).newInstance();
				
				// 경로 문자열 기반으로 생성한 클래스극 기반으로 생성된 instance 를 가지고 map 생성
				actionMap.put( key, (ToAction)obj );
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
	}



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding( "UTF-8" );
		
		String type = request.getParameter( "type" );
		
		if( type == null ) {
			type = "greet";
		}
		
		ToAction action = actionMap.get( type );
		
		String viewPath = action.execute(request, response);
		
		if( viewPath == null ) {
			response.sendRedirect( "prop_controller" );
		} else {
			RequestDispatcher disp = request.getRequestDispatcher(viewPath);
			disp.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
