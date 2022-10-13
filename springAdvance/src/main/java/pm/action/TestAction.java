package pm.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import pm.vo.TestVO;

public class TestAction {
	/*
	 * 다음과 같이 어노테이션을 사용하려면 
	 * applicationContext.xml 의 첫 부분에서
	 * <context:annotation-config />
	 */
	
	// 어노테이션 효과로 대입되므로 setter가 없어도 된다.
	@Autowired
	// 자동으로 vo2 라는 bean 객체에 대입
	@Qualifier("vo2")
	private TestVO tvo;

	public TestVO getTvo() { return tvo; }
}
