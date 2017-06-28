package report.kohyeryeon.r0003;

public class ArrayExam6 {
	
	
	
	//내가 한거~
	public int[] getExam(int num1,int num2){
		int[] a = new int[num2];
		for(int i=num1;i<=num2;i++){
			a[i-num1] = i*2;
		}
		return a;
	}
	
	public void getExam2(int[] a){
		for(int i=0;i<a.length;i++){
			System.out.print(a[i] + ",");
		}
	}
	public static void main(String[] args){
		ArrayExam6 ar = new ArrayExam6();
		int[] a = ar.getExam(2,5);
		
		ar.getExam2(a);
	}
	
	
	
	//쌤이 한거
//	public int[] getArrVar(int length, int initNum, int maxNum){
//		int[] a = new int[length];
//		for(int i =initNum;i<=maxNum;i++){
//			a[i] = (i+1)*2;
//		}
//		return a;
//	}
//	public void printArrVar(int[] a){
//		for(int i=1;i<=10;i++){
//			System.out.println(a[i-1]);
//		}
//	}
//	public static void main(String[] args){
//		ArrayExam6 ae = new ArrayExam6();
//		int[] a = ae.getArrVar(10, 0, 9);
//		ae.printArrVar(a);
//	}

}
