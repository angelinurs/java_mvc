package sign_inOut.dao;

import org.apache.ibatis.session.SqlSession;

import sign_inOut.Service.FactoryService;
import sign_inOut.vo.MemVO;

public class MemDAO {
	
	// 회원가입 기능
	public static int registry( MemVO mvo )	{
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int result = ss.insert( "member.add", mvo );
		
		if( result > 0 ) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		ss.close();
		
		return result;
	}
	
//	public static boolean check_id( String m_id ) {
//		SqlSession ss = FactoryService.getFactory().openSession();
//		MemVO vo = ss.selectOne( "member.findById", m_id );
//		ss.close();
//		
//		return ( vo == null ) ? true: false;
//	}
//	
//	public static MemVO login( String m_id, String m_pw )	{
//		Map<String, String> map = new HashMap<>();
//		
//		map.put( "m_id", m_id );
//		map.put( "m_pw", m_pw );
//		
//		SqlSession ss = FactoryService.getFactory().openSession();
//		MemVO mvo =  ss.selectOne( "member.login", map );
//		ss.close();
//		
//		return mvo;
//	}
}
