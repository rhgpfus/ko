package report.kohyeryeon.r0009;

public class Son extends Father{
	
	public String toString(){ //toString 오버라이딩으로 많이 사용된다.
		return "아부지 아들입니다.";
	}  //함수의 재정의를 하지않으면 아빠꺼를 불러온다.
	
	public static void main(String[] args){
		Father f = new Father();
		System.out.println(f);
		Son s = new Son(); //맨 앞에 Son이 Father이여도 상관이 없다! 
		System.out.println(s);
	}
}
