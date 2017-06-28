package report.kohyeryeon.r0009;

import java.util.ArrayList;
import java.util.Collections;

public class ListExem {
	
	public static void main(String[] args){
		
		ArrayList<String> arrList = new ArrayList<String>();
		for(int i=0;i<=3;i++){
			arrList.add("" + i);   //합하다?더하다.
		}
		
		//Collections.sort(arrList);   //오름차순~
		Collections.reverse(arrList);   //내림차순~
		for(int i=0;i<arrList.size();i++){     //size()는 arrList안에잇는 함수.
			System.out.println(arrList.get(i));
		}
		
	}

}
