package shoppingBasket.Service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
	private static SqlSessionFactory factory;
	
	static {
		Reader r = null;
		try {
			r = Resources.getResourceAsReader( "shoppingBasket/config/config.xml" );
			factory = new SqlSessionFactoryBuilder().build( r );
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
				try {
					if( r != null ) r.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
