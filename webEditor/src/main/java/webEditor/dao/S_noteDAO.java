package webEditor.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import webEditor.Service.FactoryService;
import webEditor.vo.S_note;

public class S_noteDAO {
	public static boolean createSnote( S_note vo ) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		
		int result = ss.insert( "s_note.insert", vo );
		
		if( result > 0 ) {
			ss.commit();
		} else {
			ss.rollback();
		}
		
		ss.close();
		
		return ( result > 0)? true: false;
	}
}
