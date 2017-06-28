package report.kohyeryeon.r0006;

public class Home01 {
//	3. 1부터 100까지 반복하는 반복문(for문)을 사용해서 짝수일때만 결과값이 찍히게 만들어주세요.

	public static void main(String[] args){
		for(int i=1;i<=100;i++){
			if(i%2==0){
				System.out.println(i);
			}
		}
	}

}
