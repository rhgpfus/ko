package report.kohyeryeon.r0007;

public class Exem5 {
	//private접근제어자를 사용하여 int a,b,c 3개의 변수를 선언해주세요.
	//Exem5 생성자에서 위의 3개의 변수의 값을 바꿔주세요.
	//a,b,c 의 값을 리턴하는 함수 3개를 만들어주세요.
	//Exem6 클래스를 생성하여 Exem5에 선언된 a,b,c의 값을 받아 출력하는 예제를 작성해주세요.
	
	private int a = 4;
	private int b = 7;
	private int c = 463;
	
	Exem5(int a,int b,int c){
		this.a = a;
		this.b = b;
		this.c = c;
	}
	
	public int getA(){
		return this.a;
	}
	public int getB(){
		return this.b;
	}
	public int getC(){
		return this.c;
	}
	
	
	
	
	
	
}
