package report.kohyeryeon.r0002;

public class Test04 {
	//initNum으로 시작해서 maxNum으로 종료되는 반목문을 사용하여 배열변수 a값을 집어넣고
	//배열변수 a를 출력해주시면 됩니다. 출력은 main함수에서 출력해주세요.
	public int[] getArrayVar(int initNum, int maxNum){
		int[] a = new int[maxNum-initNum];
		for(int i=initNum-initNum;i<maxNum-initNum;i++){
			a[i] = i+1;
		}
		return a;
	}
	
	public void printArrayVar(int[] a){
		for(int i=0;i<a.length;i++){  //a.length 방개수이므로 5개!
			System.out.println("a의" + i + "번째 방의 값 =" + a[i]);
		}
	}
	
	public void revPrintArrayVar(int[] a){
		for(int i=a.length-1;i>=0;i--){  //a.length 방개수이므로 5개!
			System.out.println("a의" + i + "번째 방의 값 =" + a[i]);
		}
	}
	public static void main(String[] args){
		Test04 num1 = new Test04();
		int[] a = num1.getArrayVar(0, 5);
		num1.printArrayVar(a);
		//num1.revPrintArrayVar(a);
		
	}
}
