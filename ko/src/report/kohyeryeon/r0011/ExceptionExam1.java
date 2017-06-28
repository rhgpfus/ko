package report.kohyeryeon.r0011;

import java.util.Scanner;

public class ExceptionExam1 {
	static //ExceptionExam1의 맴버변수로 int num1, num2를 선언해주세요.
	//맴버변수 num1과 num2값을 계산하여 int값을 리턴하는
	//plus(), minus(), multiple(), division() 함수를 4개 선언하여 이름에 맞게 연산하여 리턴해주세요.
	//Scanner클래서의 nextLine()함수를 사용하여 num1의 값과 num2값을 대입해주세요.
	//숫자값을 입력하지 않앗을때는 Exception에서 "숫자를 입력해야지!!!"라는 문자열이 나와야합니다.
	//정상적으로 숫자 값을 입력했다면 위에 선언한 4개의 함수를 호출하여 값을 받아 출력하는 예제를 작성해주시기 바랍니다.
	int num1;
	int num2;
	int result = 0;
	
	int plus(int a, int b){
		result = num1 + num2;
		return result;
	}
	
	int minus(int a, int b){
		result = num1 - num2;
		return result;
	}
	
	int multiple(int a, int b){
		result = num1 * num2;
		return result;
	}
	
	int division(int a, int b){
		result = num1 / num2;
		return result;
	}
	public static void main(String[] args){
		
		try{
			ExceptionExam1 ee1 = new ExceptionExam1();
			Scanner scan = new Scanner(System.in);
			String str1 = scan.nextLine();
			ee1.num1 = Integer.parseInt(str1);
			String str2 = scan.nextLine();
			ee1.num2 = Integer.parseInt(str2);
			
			System.out.println(ee1.plus(ee1.num1,ee1.num2));
			
			System.out.println(ee1.minus(ee1.num1,ee1.num2));
			
			System.out.println(ee1.multiple(ee1.num1,ee1.num2));
			
			System.out.println(ee1.division(ee1.num1,ee1.num2));
			
		}catch(Exception e){
			System.out.println("슛자를ㄹㅇ비력해얒디");
		}finally{
			System.out.println("난무저곤실행대지!!!!!!!!!!");
		}
	}
	
}
