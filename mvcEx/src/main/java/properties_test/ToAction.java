package properties_test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ToAction {
	public String execute( HttpServletRequest req, HttpServletResponse res );
}
