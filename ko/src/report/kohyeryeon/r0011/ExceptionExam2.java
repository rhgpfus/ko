package report.kohyeryeon.r0011;

import java.util.Scanner;

public class ExceptionExam2 {
	
	//10개의 방을 가지고 있는 int형 배열변수 arrNum을
	//ExceptionExam2의 맴버변수로 선언해주세요.
	//for문을 돌며 Scanner클래스의 nextLine()함수를 사용하여 아무런 값을 입력해주세요.
	//단 for문을 돌며 문자값이 입력됬을때 에러메세지를 나오게해주세요.
	int[] arrNum = new int[10];
	
	
	public static void main(String[] args){
		ExceptionExam2 ee2 = new ExceptionExam2();
		Scanner scan = new Scanner(System.in);
		
		
		for(int i=0;i<10;i++){
			try{
				String str = scan.nextLine();
				ee2.arrNum[i] =Integer.parseInt(str);
			}
			catch(Exception e){
				System.out.println("다시쓰렴~");
				--i;
			}
		}
		for(int i=0;i<ee2.arrNum.length;i++){
			System.out.println(ee2.arrNum[i]);
		}
	}	
}
