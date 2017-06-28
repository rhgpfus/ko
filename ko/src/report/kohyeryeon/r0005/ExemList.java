package report.kohyeryeon.r0005;

import java.util.ArrayList;

public class ExemList {
	public static void main(String[] args){
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		ArrayList<String> list3 = new ArrayList<String>();
		ArrayList<Cal> list = new ArrayList<Cal>();   //ArrayList는 List안의 작은 개념
		for(int i=0;i<3;i++){
			Cal c = new Cal(i);
			list.add(c);  //add는 함수! 밑에있는 get도 함수!
//			System.out.println(c.ina); 나온다! 배열과 유사하다???
		}
		int a;
		String b;
		list2.add(3);
		list3.add("b");
		list2.get(0);
		list3.get(0);
		
		for(int i=0;i<3;i++){
			Cal c2 = list.get(i);   //0번째 인덱스값 1을 꺼내서 c2에 넣엇당!
			System.out.println(c2.ina);  //ina는 앞에 만든 Cal클래스에서 적용되서 답이 나온당!
		}
	}

}
