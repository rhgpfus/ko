package report.kohyeryeon.r0004;

import java.util.Scanner;

public class CarPoint2 {
	public static void main(String[] args){
		Scanner scanner = new Scanner(System.in);
		int result = 0;
		int result2 = 0;
		int[] num = new int[6];
		for(int i=0;i<num.length;i++){
			System.out.println((i+1) + "번째 학생의 점수를 입력해주세요.");
			String numStr = scanner.nextLine();
			num[i] = Integer.parseInt(numStr);
			result += num[i];//   << result=result + num[i]를 줄여씀. 총 더한 값.
			result2 = result/6; 
			
		}
		System.out.println("입력하신 학생들의 점수 총점은 : " + (result));
		System.out.println("입력하신 학생들의 점수 평균은 : " + (result2));
		
		for(int i=0;i<num.length;i++){
			System.out.println("입력하신" + (i+1) + "번째 학생의 점수 :" + num[i]);
		}
		for(int i=0;i<num.length;i++){
			int tmp;
			
		}
		
	}

}
