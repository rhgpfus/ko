package report.kohyeryeon.r0007;

import java.util.Scanner;

public class Exem7 {
	private int a;
	private int b;
	private int result;
	
	Scanner scan = new Scanner(System.in);
	
	public void numA(){
		this.a = Integer.parseInt(scan.nextLine());
	
	}        // a값을 받는 함수.
	public void numB(){
		this.b = Integer.parseInt(scan.nextLine());
	}        //b값을 받는 함수.
	
	public void loop(){
		for(int i=a;i<=b;i++){
			this.result += i;
		}
	}
	public int getResult(){
		return result;
	}
	
}