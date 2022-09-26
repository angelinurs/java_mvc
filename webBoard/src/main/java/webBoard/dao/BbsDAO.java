package webBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import webBoard.Service.FactoryService;
import webBoard.vo.BbsVO;

public class BbsDAO {
	
	public static int getTotalCount() {
		int count = 0;
		SqlSession ss = FactoryService.getFactory().openSession();
		
		count = ss.selectOne( "bbs.total_count");
		ss.close();
		
		return count;
	}
	
	public static BbsVO[] readAll( int from, int to ) {
		
		BbsVO[] voList = null;
		
		Map<String, String> map = new HashMap<>();
		map.put( "from", String.valueOf( from ) );
		map.put( "to", String.valueOf( to ) );

		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<BbsVO> list =  ss.selectList( "bbs.list", map );
		
		if( list != null && !list.isEmpty() ) {
			voList = new BbsVO[ list.size() ];
			list.toArray( voList );
		}
		
		ss.close();
		
		return voList;
	}
	
	public static boolean insertBBS( BbsVO vo) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int result =  ss.insert( "bbs.insert", vo );
		
		if( result > 0 ) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		ss.close();
		
		return ( result > 0 )? true: false;
	}
	
	public static BbsVO searchById( String idx ) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		BbsVO vo =  ss.selectOne( "bbs.searchById", idx );
		
		ss.close();
		
		return vo;
	}
	
}
