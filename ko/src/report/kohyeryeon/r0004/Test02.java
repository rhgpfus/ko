package report.kohyeryeon.r0004;



public class Test02 {
	public void pirntPlustResult(int a, int b){
		System.out.println("더한 결과값 :" + (a + b));
	}
	
	public int getPlustResult(int a, int b){
		return a+b;
	}
	
	public static void main(String[] args){
		Test02 num1 = new Test02();
		num1.pirntPlustResult(1, 3);
		
		int result = num1.getPlustResult(1,3);
		System.out.println("더한 결과값 :" + result);

		
	}
	
	
}
