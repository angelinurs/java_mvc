package webBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import webBoard.Service.FactoryService;
import webBoard.vo.BbsVO;
import webBoard.vo.CommentVO;

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
	
	public static boolean insertBBS( BbsVO vo ) {
		
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
	
	public static int updateHitCount( String idx, String count ) {
		// idx -> 게시물 번호
		// count 조회수
		int rval = 0;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<>();
		
		map.put( "no", idx );
		map.put( "count", count );
		
		rval = ss.update( "bbs.updateHitCount", map );
		
		if( rval > 0 ) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		ss.close();
		
		return rval;
	}
	
	public static boolean insertComment( CommentVO vo ) {
		boolean value = false;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int count = ss.insert( "comment.insert", vo );
		
		if( count > 0 ) {
			ss.commit();
		}	else {
			ss.rollback();
		}
		
		ss.rollback();
		
		value = ( count > 0 );
		
		return value;
	}
	
	public static boolean editBBS( String title,  String content, String fname, String oname, String ipAddress, String b_idx ) {
		boolean rval = false;
		
		Map<String, String> map = new HashMap<>();
		if( title != null ) map.put( "subject", title );
		if( content != null ) map.put( "content", content );
		if( fname != null ) map.put( "fname", fname );
		if( oname != null ) map.put( "fname", fname );
		if( ipAddress != null ) map.put( "ip", ipAddress );
		if( b_idx != null ) map.put( "b_idx", b_idx );
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int result = ss.update( "bbs.updateBBS", map );
		
		if( result > 0 ) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		ss.close();
				
		rval = ( result > 0 );
		
		return rval;
	}
	
	public static boolean deleteBBS( String idx ) {
		boolean rval = false;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int result = ss.update( "bbs.deleteBBS", idx );
		
		if( result > 0 ) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		rval = ( result > 0 );
		
		return rval;
	}
	
}
