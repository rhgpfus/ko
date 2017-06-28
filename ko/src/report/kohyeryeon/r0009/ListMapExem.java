package report.kohyeryeon.r0009;

import java.util.ArrayList;
import java.util.HashMap;

public class ListMapExem {
	//스트링,인티져로 구성된 HashMap 변수를 선언해주세요.
	//HashMap변수명은 pointHm이라고 해주세요.
	//HashMap에 학생의 이름키값과 점수 벨류값을 10개 넣어주세요.
	//학생이름은 A군,B군,C군......으로 입력해주세요.
	//해당 pointHm을 ArrayList에 추가해주세요.
	//반복문을 사용하여 ArrayList에 추가된 pointHm을 출력해주세요.

	public static void main(String[] args){
		
		HashMap<String, Integer> pointHm = new HashMap<String, Integer>();
		pointHm.put("A군", 10);
		pointHm.put("B군", 20);
		pointHm.put("C군", 30);
		pointHm.put("D군", 40);
		pointHm.put("E군", 50);
		
		ArrayList<HashMap<String, Integer>> arr = new ArrayList<HashMap<String, Integer>>();
		//pointHm의 데이터타입이  HashMap<String, Integer> ArrayList<>안에 써야된다.
		for(int i=1;i<=5;i++){
		//	arr = pointHm.get(i);
			System.out.println(i);
		}
		
	}
	
}
