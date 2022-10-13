package ex1.vo;

public class Test6 {
	private Test3 t3;
	private int value;
	
	public Test6(Test3 t3, int value) {
		this.t3 = t3;
		this.value = value;
	}

	public Test3 getT3() { return t3; }
	public void setT3(Test3 t3) { this.t3 = t3; }

	public int getValue() { return value; }
	public void setValue(int value) { this.value = value; }
}
