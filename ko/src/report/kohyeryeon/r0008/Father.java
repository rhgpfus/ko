package report.kohyeryeon.r0008;

import java.util.Scanner;

public class Father {
	Scanner scan;                //선언만 해놓자!
	String str1, str2;
	int initNum , maxNum;
	//int[] a;
	int[] a = new int[10];
	Father(){  //아빠의 기본생성자!
		scan = new Scanner(System.in);  //초기화시키는것은 따로!
//		inputFromScanner1();
//		inputFromScanner2();
//		getLoop();	
		scoreLoop();
	}
	int[] scoreLoop(){
		for(int i=1;i<=10;i++){
			 this.str1 = scan.nextLine();
			 a[i-1] = Integer.parseInt(this.str1);
		}return a;
	}
	void scoreLoop(int i){
		
	}
	void scoreLoop(int a, String b){
				
	}	
	
//	void inputFromScanner1(){
//		this.str1 = scan.nextLine();
//		this.initNum = Integer.parseInt(this.str1);
//	}
//	void inputFromScanner2(){
//		this.str2 = scan.nextLine();
//		this.maxNum = Integer.parseInt(this.str2);
//	}
//	int[] getLoop(){
//		a = new int[(this.maxNum-this.initNum)+1];
//		for(int i=this.initNum;i<=this.maxNum;i++){
//			a[i-this.initNum] = i;
//		}
//		return a;
//	}
	void printResult(){
		for(int i=0;i<a.length;i++)
		System.out.println(a[i]);
	}
}
