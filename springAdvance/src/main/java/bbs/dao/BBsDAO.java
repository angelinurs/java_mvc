package bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import bbs.vo.BbsVO;
import bbs.vo.CommVO;

public class BBsDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	// 총 게시물의 수를 반환
	public int getTotalCount()	{
		return ss.selectOne( "bbs.total_count" );
	}
	
	// 한 페이지에 보여질 게시물들 반환
	public BbsVO[] getList( int begin, int end ) {
		BbsVO[] ar = null;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put( "begin", begin );
		map.put( "end", end );
		
		List<BbsVO> list = ss.selectList( "bbs.list", map );
		
		if( list != null && !list.isEmpty() ) {
			ar = new BbsVO[ list.size() ];
			list.toArray( ar );
		}
		
		return ar;
	}
	
	public int add( String title, String writer, String content, String fname, String oname, String ip) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put( "title", title );
		map.put( "writer", writer );
		map.put( "content", content );
		map.put( "fname", fname );
		map.put( "oname", oname );
		map.put( "ip", ip );
		
		int rval = ss.insert( "bbs.add", map );
		
		return rval;
	}
	
	public BbsVO getBBS( String b_idx ) {
		return ss.selectOne( "bbs.getBBS", b_idx );
	}
	
	public int delBBS( String b_idx ) {
		return ss.update( "bbs.delBBS", b_idx );
	}
	
	public int editBBS( String subject, String content, String fname, 
					 String oname, String ip, String b_idx ) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put( "subject", subject );
		map.put( "content", content );
		map.put( "file_name", fname );
		map.put( "ori_name", oname );
		map.put( "ip", ip );
		map.put( "b_idx", b_idx );
		
		int rval = ss.update( "bbs.editBBS", map );
		
		return rval;
	}
	
	public int addAns( CommVO cvo ) {
		
		return ss.insert( "comm.addAns", cvo );
	}
	
}
