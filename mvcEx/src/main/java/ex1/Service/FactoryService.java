package ex1.Service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
	private static SqlSessionFactory factory;
	
	static {
		try {
			Reader r = Resources.getResourceAsReader( "ex1/config/config.xml" );
			factory = new SqlSessionFactoryBuilder().build( r );
			r.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
