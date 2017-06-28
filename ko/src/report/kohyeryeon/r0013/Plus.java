package report.kohyeryeon.r0013;

public class Plus implements InterfaceExam {
	//구현하는 클래스!
	@Override //@를 어노테이션 이라고 부른다. 지워도 상관은 없다.
	public String getString() { 
		
		// TODO Auto-generated method stub //주석이라고도하고 커맨드라고도 한다.
		return "Test의 getString()함수 호출!!";
	}
	public void setString(String str) {
		System.out.println("Test 의 setString()함수 호출!!" + str);
	}
	public int cal(int a, int b) {
		return a+b;
	}
	
//	public int getint() {
//		System.out.println("Test 의 getint()함수 호출!!");
//		return 0;
//	}
//	public void setint(int str) {
//		System.out.println("Test 의 setint()함수 호출!!" + str);
//	}

}
