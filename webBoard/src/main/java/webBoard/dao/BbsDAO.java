package webBoard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import webBoard.Service.FactoryService;
import webBoard.vo.BbsVO;

public class BbsDAO {
	public static BbsVO[] readAll() {
		BbsVO[] voList = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<BbsVO> list =  ss.selectList( "bbs.all" );
		
		ss.close();
		
		voList = new BbsVO[ list.size() ];
		list.toArray( voList );
		
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
