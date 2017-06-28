package report.kohyeryeon.r0004;

public class Test03 {
	
	public int[] getPlusNum1(){  //getPlusNum1(안쪽을 int a 이렇게 써놔도 되고 안써놔도 된다.)
		int[] a = new int[5];
		for(int i=0;i<5;i++){
			a[i] = i+1;
		}
		return a;
	}
	
	public void getPlusNum2(int[] a){
		for(int i=0;i<a.length;i++){
			System.out.print("a[" + i + "] =" + a[i] + ",");
		}
	}
	public static void main(String[] args){
	
	Test03 te = new Test03();
	int[] result = te.getPlusNum1();
	te.getPlusNum2(result);
	
//결과값 a[0] = 1, a[1] = 2, a[2] = 3, a[3] = 4, a[4] =5
//	for(int i=0;i<5;i++){
//		a[i] = i+1;
//	}
//	for(int i=0;i<5;i++){
//		System.out.print("a[" + i + "] =" + a[i] + ",");
//	}
}
}