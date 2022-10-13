package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import mybatis.vo.EmpVO;

public class EmpDAO {
	
	// config 파일에서 DAO 를 정의 할 때,
	// <property 를 정의하면서 반드시 setSs(...) 를 통해 저장되도록 한다.
	// setter injection
	private SqlSessionTemplate ss;
	
	
	public void setSs(SqlSessionTemplate ss) {
		this.ss = ss;
	}

	public EmpVO[] getAll()	{
		EmpVO[] ar = null;
		
		List<EmpVO> list = ss.selectList( "emp.all" );
		
		if( list != null && !list.isEmpty() ) {
			ar = new EmpVO[ list.size() ];
			list.toArray( ar );
		}
		
		// 여기서는 ss 를 close 하면 
		// 다른 검색이나 추가 할 때 사용할 수 없다.
		// 그래서 close 를 하면 안된다.
		// ss.close();
		
		return ar;
	}
	
	public EmpVO[] searchByFname( String fname )	{
		EmpVO[] ar = null;
		
		List<EmpVO> list = ss.selectList( "emp.searchByFname", fname );
		
		if( list != null && !list.isEmpty() ) {
			ar = new EmpVO[ list.size() ];
			list.toArray( ar );
		}
		
		// 여기서는 ss 를 close 하면 
		// 다른 검색이나 추가 할 때 사용할 수 없다.
		// 그래서 close 를 하면 안된다.
		// ss.close();
		
		return ar;
	}
	
	public EmpVO[] searchByMap( Map<String, String> map )	{
		EmpVO[] ar = null;
		
		List<EmpVO> list = ss.selectList( "emp.searchByMap", map );
		
		if( list != null && !list.isEmpty() ) {
			ar = new EmpVO[ list.size() ];
			list.toArray( ar );
		}
		
		// 여기서는 ss 를 close 하면 
		// 다른 검색이나 추가 할 때 사용할 수 없다.
		// 그래서 close 를 하면 안된다.
		// ss.close();
		
		return ar;
	}
}
