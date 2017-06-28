package report.kohyeryeon.r0011;

import java.util.Scanner;

public class ExceptionExam3 {
	
	final int initNum;
	int[] arrNum;
	
	ExceptionExam3(int initNum){
		this.initNum = initNum;
	}
	
	public static void main(String[] args){
		ExceptionExam3 ee3 = new ExceptionExam3(3);
		ee3.arrNum = new int[ee3.initNum];
		Scanner scan = new Scanner(System.in);
		
		for(int i=0;i<ee3.arrNum.length;i++){
			try{
				String str = scan.nextLine();
				ee3.arrNum[i] =Integer.parseInt(str);
			}
			catch(Exception e){
				System.out.println("다시쓰렴~");
				i--;
			}
		}
		for(int i=0;i<ee3.arrNum.length;i++){
			System.out.println(ee3.arrNum[i]);
		}
	}	
}


