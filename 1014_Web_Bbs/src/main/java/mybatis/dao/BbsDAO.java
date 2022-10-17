package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import mybatis.vo.BbsVO;

public class BbsDAO {

	@Autowired
	private SqlSessionTemplate ss;
	
	//총 게시물의 수를 반환
	public int getTotalCount() {
		return ss.selectOne("bbs.total_count");	
		
	}
	
	//한 페이지에 보여질 게시물들 반환
	public BbsVO[] getList(int begin, int end) {
		BbsVO[] ar = null;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		List<BbsVO> list = ss.selectList("bbs.list", map);
		if(list != null && list.size() > 0) {
			ar = new BbsVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	//게시글 저장
	public int add(String subject, String writer, String content,
			String fname, String oname, String ip) {
		int cnt = 0;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("writer", writer);
		map.put("content", content);
		map.put("file_name", fname);
		map.put("ori_name", oname);
		map.put("ip", ip);
		
		cnt = ss.insert("bbs.add", map);
				
		return cnt;
	}
	
	//게시글의 기본키를 받아서 해당 게시글 반환
	public BbsVO getBbs(String b_idx) {
		return ss.selectOne("bbs.get_bbs", b_idx);
	}
}




