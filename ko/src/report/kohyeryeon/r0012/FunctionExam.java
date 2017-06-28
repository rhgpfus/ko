package report.kohyeryeon.r0012;

import java.util.Scanner;

public class FunctionExam {
	
	int[] arrNum = new int[10];
	Scanner scan = new Scanner(System.in);
	int i = 0;
	
	int getString(){
		try{
			System.out.println((i+=1) + "번째 숫자를 입력하세요.");
			return Integer.parseInt(scan.nextLine());
		}
		catch(Exception e){
			i--;
			System.out.println("다시쓰렴~");
			return getString();
			
		}
	}
	
	public static void main(String[] args){
		FunctionExam fe = new FunctionExam();
		Scanner scan = new Scanner(System.in);
		
		for(int i=0;i<fe.arrNum.length;i++){
			fe.arrNum[i] = fe.getString();
		}
		
		for(int i=0;i<fe.arrNum.length;i++){
			System.out.println(fe.arrNum[i]);
		}
	}	

}
