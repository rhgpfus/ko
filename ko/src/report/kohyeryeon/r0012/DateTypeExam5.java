package report.kohyeryeon.r0012;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

public class DateTypeExam5 {
	Scanner scan = new Scanner(System.in);
	
	public HashMap getHashMap(){
		HashMap hm1 = new HashMap();
		System.out.print("클래스?");
		hm1.put("클래스",scan.nextLine());
		System.out.print("이름?");
		hm1.put("이름",scan.nextLine());
		System.out.print("나이?");
		hm1.put("나이",scan.nextLine());
		System.out.print("성별?");
		hm1.put("성별",scan.nextLine());
		return hm1;
	}
	
	public static void main(String[] args){
		Scanner scan = new Scanner(System.in);
		ArrayList<HashMap> numList = new ArrayList<HashMap>();
		DateTypeExam5 dte5 = new DateTypeExam5();
		
		for(int i=0;i<5;i++){
			HashMap hm2 = dte5.getHashMap();
			numList.add(hm2);
		}
		
		for(int i=0;i<numList.size();i++){
			HashMap resultHm = numList.get(i);
			System.out.print(resultHm.get("클래스") + ",");
			System.out.print(resultHm.get("이름") + ",");
			System.out.print(resultHm.get("나이") + ",");
			System.out.println(resultHm.get("성별"));
		}
	}
}
