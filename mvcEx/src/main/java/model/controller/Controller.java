package model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// type 이라는 파라미터를 받는다.
		String type = request.getParameter( "type" );
		
		// 이동할 view 의 경로를 저장할 변수
		String viewPath = null;
		
		if( type == null || type.equalsIgnoreCase( "greet" ) ) {
			// 모델작업이 필요하지만 오늘은 생략
			request.setAttribute( "msg", "안녕하세요." );
			
			viewPath = "/jsp/view1.jsp";
		} else if( type == null || type.equalsIgnoreCase( "hi" ) ) {
			request.setAttribute( "str", "nice to meet you." );
			
			viewPath = "jsp/view2.jsp";
		} else {
			viewPath = "jsp/default.jsp";
		}
		
		// MVC 환경에서는 view page 이동은 forward 를 한다.
		RequestDispatcher disp = request.getRequestDispatcher( viewPath );
		// 그래서 forward 로 이동한다.
		disp.forward( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
