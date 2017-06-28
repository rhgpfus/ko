package report.kohyeryeon.r0002;

public class Test02 {

	public void pirntMultipleTable(int[] a, int[] b) {
		for (int i = 0; i < a.length; i++) {
			for(int j =0; j < b.length; j++){
				System.out.print(a[i] + "X" + b[j] + "=" + (b[j]*a[i]) + ",");
			}
			System.out.println();
		}
	}
		
	public static void main(String[] args) {
		int[] a = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }; // 배열 공간을 4개 줫다. 배열변수는 4야!
		int[] b = { 1, 2, 3, 4, 5, 6, 7, 8, 9 }; // 방안에 값이 각각 들어간다. 방번호는 0부터
		Test02 num1 = new Test02();
		num1.pirntMultipleTable(a, b);
	}
	// for(int i=0;i<b.length;i++){
	// System.out.println("방" + (i+1)+ "번째 방의 값 =" + b[i]);

	// System.out.println("a의 길이 =" + a.length);
	// System.out.println("b의 길이 =" + a.length); //length>>속성값 자리
	// System.out.println("a의 길이 =" + a.length);

}