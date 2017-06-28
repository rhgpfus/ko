package report.kohyeryeon.r0007;

public class Exem9 {
//a와b값을 초기화 하는 Exem9생성자를 만들어주세요.
//a와b값을 더하기,빼기,나누기,곱하기 하는 함수를 각각 4개 작성해주세요.
//해당연산결과는 printResult()라는 함수를 호출했을때 나오게 프로그램을 작성해주시면됩니다.
//호출은 Exem10이라는 클래스에서!
	
	protected int a;  //protected를 쓰면 int a를 상속자가 쓸수있게 허락함.
	protected int b;
	protected int result;
	public Exem9(){}
	public Exem9(int a, int b){
		this.a = a;
		this.b = b;
	}
	
	protected void getPlus(){
		result = a+b;
	}
	protected void getMinus(){
		result = a-b;
	}
	protected void getDivision(){
		result = a/b;
	}
	protected void getMultipl(){
		result = a*b;
	}
	protected int printResult(){
		return result;
		
	}
}
