package bbs.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.dao.BbsDAO;
import bbs.util.Paging;
import bbs.vo.BbsVO;

public class ListAction implements Action {

	@Override public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 페이징 처리를 위한 객체생성
		Paging page = new Paging();
		
		// 전체 페이지 값을 구해야 begin, end 의 값을 구할 수 있다.
		// 그래서 먼저 전체 페이지 수를 구하기 앞서 총 게시물 수를 알아야 한다.
		int total_count = BbsDAO.getTotalCount();
		// 총 게시물 수를 page 객체에 넣어주면,
		// 전체 page 수가 구해진다.
		page.setTotalCount( total_count );
		
		// 현재 page 값 parameter 로 받기
		String cPage = request.getParameter( "cPage" );
		if( cPage != null ) {
			int p = Integer.parseInt(cPage);
			// 이때 게시물을 추출할 범위 ( begin, end ) 그리고
			// 시작페이지와 끝 페이지 값이 모두 구해진다.
			page.setNowPage(p);
		} else {
			page.setNowPage( 1 );
//			page.setNowPage( page.getNowPage() );
		}
		
		// 화면에 표시할 게시물을 가져온다.
		BbsVO[] ar = BbsDAO.readAll( page.getBegin(), page.getEnd() );
		
		// view page 에서 표현활 수 있도록 request 에 저장해서 보낸다.
		request.setAttribute( "ar", ar );
		request.setAttribute( "page", page );
		
		return "/bbs/jsp/list.jsp";
	}

}
