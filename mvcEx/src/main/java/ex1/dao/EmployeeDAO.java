package ex1.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import ex1.Service.FactoryService;
import ex1.vo.EmpVO;

public class EmployeeDAO {
	public static EmpVO[] getList( int begin, int end )	{
		
		EmpVO[] ar = null;
		
		Map<String, Integer> map = new HashMap<>();
		map.put( "begin", begin );
		map.put( "end", end );
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<EmpVO> list = ss.selectList( "employee.list", map );
		
		if( list != null && !list.isEmpty() ) {
			ar = new EmpVO[ list.size() ];
			list.toArray( ar );
		}
		ss.close();
		
		return ar;
	}
	
	public static EmpVO[] searchList( int begin, int end, String searchType, String searchValue )	{
		EmpVO[] ar = null;
		
		/*
		Map<String, Integer> map = new HashMap<>();
		map.put( "begin", begin );
		map.put( "end", end );
		*/
		
		Map<String, String> map = new HashMap<>();
		
		String key = null;
		if( searchType.equalsIgnoreCase( "0" ) ) 
			key = "no";
		else if( searchType.equalsIgnoreCase( "1" ) )
			key = "name";
		else if( searchType.equalsIgnoreCase( "2" ) )
			key = "from_date";
		
		map.put( key, searchValue );
		
		
		System.out.println( map.toString() );
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<EmpVO> list = ss.selectList( "employee.search", map );
		
		System.out.println( list.size() );
		
		if( list != null && !list.isEmpty() ) {
			ar = new EmpVO[ list.size() ];
			list.toArray( ar );
		}
		ss.close();
		
		return ar;
	}
	
	public static boolean addEmployee( EmpVO evo ) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int result = ss.insert( "employee.insert", evo );
		
		if( result > 0) {
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
		
		return (result > 0);
	}
}
