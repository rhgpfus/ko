package report.kohyeryeon.r0010;

import java.util.ArrayList;
import java.util.HashMap;

public class MapExam2 extends HashMap{
	//HashMap을 상속받아주세용. 키타입은 String, 벨류타입은  Integer로 선언해주세요.
	//키는 아무거나 넣으셔도 되지만 벨류는 반드시 숫자만 입력!
	//총 10개의 키값을 생성해주세요.
	//toString()함수를 오버라이딩해서 해당 해쉬맵이 가지고있는 전체숫자를 더한값을 출력해주세요.

	public String toString(){
		String result = "";
		int a = 0;
		ArrayList<String> keyList = new ArrayList<String>(keySet());
		for(int i=0;i<keyList.size();i++){
			String key = keyList.get(i);
			Integer value = (Integer)get(key);
			a +=  value;
			
		}return a+result;
	}
	
	public static void main(String[] args){
		MapExam2 me2 = new MapExam2();
		String result = me2.toString();
		me2.put("A군", 1);
		me2.put("B군", 1);
		me2.put("C군", 1);
		me2.put("D군", 1);
		System.out.println(me2);
		
		
	}
	
}
