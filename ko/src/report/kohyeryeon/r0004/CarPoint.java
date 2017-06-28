package report.kohyeryeon.r0004;

import java.util.Scanner;

public class CarPoint {
	//스캐너클래스를 사용하요 6명의 학생의 정수를 직접 입력받아주세요
	//6명의 학생의 총점을 출력해주세요
	public static void main(String[] args){
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("1학생의 점수를 입력해주세요.");
		String input1 = scanner.nextLine();
		int num1 = Integer.parseInt(input1);
		System.out.println("1학생의 점수는 =" + num1);
		
		System.out.print("2학생의 점수를 입력해주세요.");
		String input2 = scanner.nextLine();
		int num2 = Integer.parseInt(input2);
		System.out.println("2학생의 점수는 =" + num2);
		
		System.out.print("3학생의 점수를 입력해주세요.");
		String input3 = scanner.nextLine();
		int num3 = Integer.parseInt(input3);
		System.out.println("3학생의 점수는 =" + num3);
		
		System.out.print("4학생의 점수를 입력해주세요.");
		String input4 = scanner.nextLine();
		int num4 = Integer.parseInt(input4);
		System.out.println("4학생의 점수는 =" + num4);
		
		System.out.print("5학생의 점수를 입력해주세요.");
		String input5 = scanner.nextLine();
		int num5 = Integer.parseInt(input5);
		System.out.println("5학생의 점수는 =" + num5);
		
		System.out.print("6학생의 점수를 입력해주세요.");
		String input6 = scanner.nextLine();
		int num6 = Integer.parseInt(input6);
		System.out.println("6학생의 점수는 =" + num6);
		
		
		System.out.println("입력하신 학생의 총점은 =" + (num1+num2+num3+num4+num5+num6));
		
	}

}
