package ex1.vo;

public class Test3 {
	private String name;
	private int age;
	private boolean adult;
	
	public Test3() { }
	
	public Test3(String name, int age) {
		this.name = name;
		this.age = age;
		this.adult = ( age > 19 );
	}
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public int getAge() { return age; }
	public void setAge(int age) { this.age = age; }
	
	public boolean isAdult() { 
		return ( age > 19 ); 
	}
	public void setAdult(boolean adult) { this.adult = ( age > 19 ); }
	
	
}
