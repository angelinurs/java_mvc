package bbs.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bbs.dao.BbsDAO;
import bbs.vo.BbsVO;

public class ViewAction implements Action {
	// 한번이라도 읽은 게시물들이 저장됨.
	List<BbsVO> r_list;
	
	// 현재 읽기한 게시물이 읽었던 게시물인지 아닌지 를 판단하는 기능
	public boolean checkBBS( BbsVO vo ) {
		boolean value = true;
		
		for( BbsVO bvo : r_list) {
			if( vo.getB_idx().equalsIgnoreCase( bvo.getB_idx() ) ) {
				value = false;
				break;
			}
		}
		
		return value;
	}

	@Override public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// take parameter
		
		String cPage = request.getParameter( "cPage" );
		String b_idx = request.getParameter( "b_idx" );
		
		// 한번 읽기를 한 게시물은 ArrayList 에 저장하여 session에 read_list 라는 
		// 이름으로 저장
		HttpSession session = request.getSession();
		Object obj = session.getAttribute( "read_list" );
		
		if( obj == null ) {
			r_list = new ArrayList<>();
			session.setAttribute( "read_list", r_list );
		} else {
			r_list = (ArrayList<BbsVO>)obj;
		}
		
		BbsVO vo = BbsDAO.searchById( b_idx );
		
		// 이전에 봤던 게시물인지 아닌지 확인
		if( checkBBS( vo ) ) {
			BbsDAO.updateHitCount(b_idx);
			r_list.add( vo );
		}
		
		// view.jsp 에서 표현할 값들을 request 에 저장
		request.setAttribute( "vo", vo );
		request.setAttribute( "cPage", cPage );
		
		return "/bbs/jsp/view.jsp";
	}

}
