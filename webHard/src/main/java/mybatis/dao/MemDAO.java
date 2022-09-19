package mybatis.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.Service.FactoryService;
import mybatis.vo.MemVO;

public class MemDAO {
	
	// 회원가입 기능
	public static int registry( String m_id, String m_name, String m_pw, String[] m_phone, String m_addr )	{
		
		StringBuffer sb = new StringBuffer();
		int index = 0;
		for( String num : m_phone ) {
			
			sb.append( num );
			if( index < m_phone.length - 1)
				sb.append( "-" );
			index++;
		}
		
		Map<String, String> map = new HashMap<>();
		
		map.put( "m_id", m_id );
		map.put( "m_pw", m_pw );
		map.put( "m_name", m_name );
		map.put( "m_phone", sb.toString() );
		map.put( "m_addr", m_addr );
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int result = ss.insert( "member.add", map );
		
		if( result > 0 ) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		return result;
	}
	
	public static boolean check_id( String m_id ) {
		SqlSession ss = FactoryService.getFactory().openSession();
		MemVO vo = ss.selectOne( "member.findById", m_id );
		ss.close();
		
		return ( vo == null ) ? true: false;
	}
	
	public static MemVO login( String m_id, String m_pw )	{
		Map<String, String> map = new HashMap<>();
		
		map.put( "m_id", m_id );
		map.put( "m_pw", m_pw );
		
		SqlSession ss = FactoryService.getFactory().openSession();
		MemVO mvo =  ss.selectOne( "member.login", map );
		ss.close();
		
		return mvo;
	}
}
