package memo_220916.service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {
	private static SqlSessionFactory memo_factory;
	
	static {
		Reader r = null;
		
		try {
			r = Resources.getResourceAsReader( "memo_220916/config/config.xml" );
			memo_factory = new SqlSessionFactoryBuilder().build( r );
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

	public static SqlSessionFactory getMemo_factory() {
		return memo_factory;
	}
	
}