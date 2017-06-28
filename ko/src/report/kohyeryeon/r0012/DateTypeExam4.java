package report.kohyeryeon.r0012;

import java.util.ArrayList;
import java.util.HashMap;

public class DateTypeExam4 {
	
	public static void main(String[] args){
		ArrayList<HashMap> numList = new ArrayList<HashMap>();
		
		HashMap hm1 = new HashMap();
		hm1.put("클래스","A");
		hm1.put("이름","홍길동");
		hm1.put("나이","20");
		hm1.put("성별","남자");
		numList.add(hm1);
		
		HashMap hm2 = new HashMap();
		hm2.put("클래스","B");
		hm2.put("이름","길정이");
		hm2.put("나이","25");
		hm2.put("성별","남자");
		numList.add(hm2);
		
		HashMap hm3 = new HashMap();
		hm3.put("클래스","C");
		hm3.put("이름","윤정이");
		hm3.put("나이","22");
		hm3.put("성별","여자");
		numList.add(hm3);
		
		HashMap hm4 = new HashMap();
		hm4.put("클래스","D");
		hm4.put("이름","동동이");
		hm4.put("나이","5");
		hm4.put("성별","여자");
		numList.add(hm4);
		
		for(int i=0;i<numList.size();i++){
			
			HashMap resultHm = numList.get(i);
			//System.out.println(numList.get(i));
			System.out.print(resultHm.get("클래스") + ",");
			System.out.print(resultHm.get("이름") + ",");
			System.out.print(resultHm.get("나이") + ",");
			System.out.println(resultHm.get("성별"));
		}
	}
}
