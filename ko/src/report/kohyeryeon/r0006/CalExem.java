package report.kohyeryeon.r0006;

import java.util.Scanner;

public class CalExem {
	
	
	public static void main(String[] args){
		Scanner scan = new Scanner(System.in);
		int[] a = new int[10];
		int result = 0;
		
		for(int i=0;i<a.length;i++){
			System.out.println("학생" + (i+1) + "의 점수를 입력해주세요.");
			String str = scan.nextLine();         
			a[i] = Integer.parseInt(str);
			result += a[i];
		}
		System.out.println("학생들의 총점 :" + result);
		System.out.println("학생들의 평균 :" + result/10);
		
		for(int i=0;i<10;i++){
			for(int j=i+1;j<=10;j++){
				if(j<10 && a[i]<a[j]){
					int tmp = a[i];
					a[i] = a[j];
					a[j] = tmp;
				}
			}
		}
		for(int i=0;i<10;i++){
		System.out.println(a[i]);
		}
	}
}
