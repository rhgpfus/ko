package report.kohyeryeon.r0002;

public class Test03 {
	public static void main(String[] args){
		
		int[] a = new int[6];
		for(int i=0;i<a.length;i++){
			a[i] = (i+1);
		}
		System.out.println("a의 첫번째 값 :" + a[0]);
		System.out.println("a의 마지막 값 :" + a[a.length-1]);
	}

}
