package report.kohyeryeon.r0003;

public class ArrayExam4 {
	//int배열변수를 선언해주시고 자리수는 10개짜리로 만들어주세요.
	//for에서 각각의 index에 2의 배수의 값을 넣어주세요.
	//반대로 출력 ex)0번쨰방에 20 1번째방에 18...
	public static void main(String[] args){
		int[] num1 = new int[10];
//		for(int i=1;i<=10;i++){
//			num1[i-1] = i*2;
//		}
		for(int i=1;i<=10;i++){
			num1[10-i] = i*2;
		}
		
		for(int i=1;i<=10;i++){
			System.out.print(num1[i-1] + ",");
		}

	}
	
	
	

}
