package test.Listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */
@WebListener
public class MyListener extends ContextLoaderListener implements ServletContextListener {
	// 부모에 의해서 WEB-INF/applicationContext.xml 을 로드 한다.
	// 현재 리스너는 톰갯이 준비되기 전에 움직인다.
}
