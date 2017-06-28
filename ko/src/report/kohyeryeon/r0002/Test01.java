package report.kohyeryeon.r0002;

public class Test01 {
	
	public void printMultipleTable(int initNum, int maxNum){
		for (int i = initNum; i <= maxNum; i++) {
			int a= 1;
			for (a = 1; a < 9; a++) {
				System.out.print(i + "X" + a + "=" + (i * a) + ",");
			}
			System.out.println(i + "X" + a + "=" + (i * a));
		}
	}
	public static void main(String[] args){
		Test01 num1 = new Test01();
		num1.printMultipleTable(1,8 );   // 어려웡.
		
	}
}
