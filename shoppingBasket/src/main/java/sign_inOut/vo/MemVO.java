package sign_inOut.vo;

public class MemVO {
	String m_id;
	String m_pw;
	String m_name;
	String[] m_phone;
	String phone;
	String m_addr;
	String m_email;
	
	public String getM_id() { return m_id; }
	public void setM_id(String m_id) { this.m_id = m_id; }
	
	public String getM_pw() { return m_pw; }
	public void setM_pw(String m_pw) { this.m_pw = m_pw; }
	
	public String getM_name() { return m_name; }
	public void setM_name(String m_name) { this.m_name = m_name; }
	
	public String[] getM_phone() { return m_phone; }
	public void setM_phone(String[] m_phone) { 
		this.setPhone( String.join( "-", m_phone) );
		this.m_phone = m_phone; 
	}
	
	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
	
	public String getM_addr() { return m_addr; }
	public void setM_addr(String m_addr) { this.m_addr = m_addr; }
	
	public String getM_email() { return m_email; }
	public void setM_email(String m_email) { this.m_email = m_email; }
}
