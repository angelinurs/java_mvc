package bbs.util;

public class Paging {

	int nowPage = 1; //현재 페이지

	int numPerPage = 10;// 한 페이지당 보여질 게시물 수
	int totalCount = 0;// 총 게시물의 수
	
	//한 블럭당 보여질 페이지 수(페이지 묶음)
	int pagePerBlock = 5;
	
	int totalPage = 0;// 전체 페이지 수
	
	int begin, end, startPage, endPage;
	
	public Paging() {} // 기본생성자
	public Paging(int numPerPage, int pagePerBlock) {
		this.numPerPage = numPerPage;// 한 페이지당 보여질 게시물 수를 변경
		this.pagePerBlock = pagePerBlock;//한 블럭당 보여질 페이지 수를 변경
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) { //현재 페이지 값 변경
		this.nowPage = nowPage;			// begin, end, startPage, endPage값들 변경해야 함
		
		// 현재 페이지 값이 변경될 때 표현할 게시물들이 변경되어야 한다.
		// 즉, begin과 end값이 변경되어야 한다.
		
		//현재페이지(nowPage) 값이 총 페이지 값(totalPage)을
		// 넘지 못하게 하자!
		if(nowPage > totalPage)
			nowPage = totalPage;
		
		// 각 페이지의 시작과 끝(begin, end)지정한다.
		//   현재페이지가 1: begin:1, end: 10
		//   현재페이지가 2: begin:11, end: 20
		//   현재페이지가 3: begin:21, end: 30
		//   현재페이지가 4: begin:31, end: 40
		//   현재페이지가 5: begin:41, end: 50

		begin = (nowPage-1)*numPerPage+1;
		end = nowPage*numPerPage;
		
		//현재페이지 값에 의해 블럭의 시작페이지 값 구하기
		startPage = ((nowPage-1)/pagePerBlock)*pagePerBlock+1;
		
		//블록의 마지막 페이지 값 구하기
		endPage = startPage + pagePerBlock - 1;
		
		// endPage가 총 페이지 수보다 더 크다면
		// 총 페이지 수보다 더 큰 페이지 값이 표현 되는것은 맞지 않다.
		// 즉, endPage가 totalPage보다 크면 totalPage값으로 변경하자!
		if(endPage > totalPage)
			endPage = totalPage;
	}

	public int getNumPerPage() { return numPerPage; }
	public void setNumPerPage(int numPerPage) { this.numPerPage = numPerPage; }

	public int getTotalCount() { return totalCount; }

	public void setTotalCount(int totalCount) { // 총 게시물 수가 변경될 때
		this.totalCount = totalCount;
		
		//총 게시물 수가 변경되면 총 페이지 수도 변경되어야 한다.
		totalPage = (int)Math.ceil((double)totalCount/numPerPage);
	}

	public int getPagePerBlock() { return pagePerBlock; }
	public void setPagePerBlock(int pagePerBlock) { this.pagePerBlock = pagePerBlock; }

	public int getTotalPage() { return totalPage; }
	public void setTotalPage(int totalPage) { this.totalPage = totalPage; }

	public int getBegin() { return begin; }
	public void setBegin(int begin) { this.begin = begin; }

	public int getEnd() { return end; }
	public void setEnd(int end) { this.end = end; }

	public int getStartPage() { return startPage; } 
	public void setStartPage(int startPage) { this.startPage = startPage; }

	public int getEndPage() { return endPage; } 
	public void setEndPage(int endPage) { this.endPage = endPage; }
}
