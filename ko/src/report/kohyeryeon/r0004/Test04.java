package report.kohyeryeon.r0004;

import java.util.Scanner;

public class Test04 {
	int result = 0;
	int result2 = 0;
	int[] num = new int[6];
	static Scanner scanner;
	
	public int getNum1(int a){  //리턴타입을 결정하고 적고, 리턴을 밑에 써주고 리턴하는 값과 리턴타입의 데이터타입을 같게할것!
		//(파라메터) 를 결정하고 적어준다.
		for(int i=0;i<num.length;i++){ 
			System.out.println((i+1) + "번째 학생의 점수를 입력해주세요.");
			String numStr = scanner.nextLine();
			num[i] = Integer.parseInt(numStr);
			result += num[i];      //   << result=result + num[i]를 줄여씀. 총 더한 값.
			         //result2 = result/6; 
		}return result;
	}
	
	
	public static void main(String[] args){
		scanner = new Scanner(System.in);
		Test04 te = new Test04();
		int te2 = te.getNum1(5);
		System.out.println("입력하신 학생들의 점수 총점은 : " + te2);
		//System.out.println("입력하신 학생들의 점수 평균은 : " + (result2));	
		}
		
//		for(int i=0;i<num.length;i++){
//			System.out.println("입력하신" + (i+1) + "번째 학생의 점수 :" + num[i]);
//		}
//		for(int i=0;i<num.length;i++){
//			int tmp;
//			
//		}
		
	}


