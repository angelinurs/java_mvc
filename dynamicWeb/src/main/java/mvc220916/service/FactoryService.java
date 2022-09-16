package mvc220916.service; 

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
	private static SqlSessionFactory factory;
	
	static {
		Reader r = null;
		try {
			r = Resources.getResourceAsReader("mvc220916/config/config.xml");
			if( r == null ) System.out.println( "r is null" );
			factory = new SqlSessionFactoryBuilder().build(r);
		} catch (Exception e) {
			e.printStackTrace(); 
		} finally {
			try {
				if(r != null)
					r.close();
			} catch (Exception e2) { }
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
