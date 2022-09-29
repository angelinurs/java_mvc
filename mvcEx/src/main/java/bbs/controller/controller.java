package bbs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.action.Action;

/**
 * Servlet implementation class controller
 */
@WebServlet(
		urlPatterns = { "/bbsCon" }, 
		initParams = { 
				@WebInitParam(name = "param", value = "/WEB-INF/bbs_action.properties")
		})
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Action> actionMap;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controller() {
        super();
        
        actionMap = new HashMap<>();
    }

	@Override public void init() throws ServletException {
		// 생성자 다음에 수행하는 함수
		// 첫 요청자에 의해 단 한번만 수행하는 곳
		
		// "/WEB-INF/bbs_action.properties" 등록
		String path = getInitParameter( "param" );
		
		// 현재 서블릿이 생성될 때 맴버변수인 path 를 가지고 절대 경로화 시킨다.
		// 절대 경로화 시키기 위후ㅐ서 우린 jsp 에서 application 을 사용한다.
		// 여긴 jsp 가 아니기 때문에 application 즉, ServletContext 를 생성하면 된다.
		ServletContext application = getServletContext();
		
		String realPath = application.getRealPath( path );
		
		// 절대 경로화 시킨 이유는 
		// 해당 파일의 내용 ( class 경로 ) 를 stream 을 이용하여
		// 읽어와서 Properties 객체에 담기 위함이다.
		Properties props = new Properties();
		
		// Properties 의 load() method 를 이용하여 내용들을 읽기한다.
		// 이때, 필요한 것이 InputStream 이다.
		
		FileInputStream fis = null;
		try {
			File f = new File( realPath );
			fis = new FileInputStream( f );
			
			// action.properties 파일의 내용들을 읽어서
			// 비어있던 Properties object 에 key 와 value 를 저장한다.
			props.load( fis );
			
		} catch ( IOException ioe ) {
			ioe.printStackTrace();
		} finally {
			try {
				if( fis != null ) fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		/*
		 * 생성할 객체들의 경로가 모드
		 * Properties object 에 저장되었다.
		 * 하지만, 현제 컨트롤러 입장에서 생성할 객체가 몇개이며,
		 * 어떤 객체인지 알지 못한다.
		 * Properties 에 저장된 key 들을 모두 가져와서 반복자로 수행해야 한다.
		 */
		
		Iterator<Object> it = props.keySet().iterator();
		
		while( it.hasNext() ) {
			String key = String.valueOf( it.next() );
			
			String value = props.getProperty( key );
			
			try {
				Object obj = Class.forName( value ).newInstance();
				
				actionMap.put( key, (Action)obj );
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "utf-8" );
		
		String type = request.getParameter( "type" );
		
		if( type == null ) {
			type = "list";
		}
		
		Action action = actionMap.get(type);
		
		String viewPath = action.execute(request, response);
		
		if( viewPath == null ) {
			response.sendRedirect( "bbsCon" );
		} else {
			RequestDispatcher disp = request.getRequestDispatcher( viewPath );
			disp.forward( request, response );
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
