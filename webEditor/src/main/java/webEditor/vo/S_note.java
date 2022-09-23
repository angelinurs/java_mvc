package webEditor.vo;

public class S_note {
	String idx;
	String title;
	String part;

	String[] interest;
	String m_interest;
	
	String content;
	String reg_time;

	public String getIdx() { return idx; } 
	public void setIdx(String idx) { this.idx = idx; }

	public String getTitle() { return title; } 
	public void setTitle(String title) { this.title = title; }

	public String getPart() { return part; } 
	public void setPart(String part) { this.part = part; }

	public String[] getInterest() { return interest; } 
	public void setInterest(String[] interest) { 
		this.interest = interest;
		
		setM_interest( ( ( interest.length > 0) ? String.join( ", ", interest ): "" ) );
	}

	public String getM_interest() { return m_interest; } 
	public void setM_interest(String m_interest) { this.m_interest = m_interest; }

	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	
	public String getReg_time() { return reg_time; }
	public void setReg_time(String reg_time) { this.reg_time = reg_time; }
}
