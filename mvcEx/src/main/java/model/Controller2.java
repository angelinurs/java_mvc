package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.model.DateAction;
import model.model.GreetAction;
import model.model.HiAction;

/**
 * Servlet implementation class Controller2
 */
@WebServlet("/Controller2")
public class Controller2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String type = request.getParameter( "type" );
		
		String viewPath = null;
		
		/*
		 * - type 이 null 이거나 greet 이면 GreetAction call
		 * - type 이 Hi 이면 HiAction call
		 * - type 이 그렇지 않으면 DateAction call
		 */
		
		if( type == null || type.equalsIgnoreCase( "greet") ) {
			GreetAction action = new GreetAction();
			
			viewPath = action.execute(request, response);
		} else if( type.equalsIgnoreCase( "str" ) ) {
			HiAction action = new HiAction();
			
			viewPath = action.execute(request, response);
		} else {
			DateAction action = new DateAction();
			
			viewPath = action.execute(request, response);
		}
		
		RequestDispatcher disp =  request.getRequestDispatcher(viewPath);
		
		disp.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
