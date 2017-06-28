package report.kohyeryeon.r0007;

import report.kohyeryeon.r0006.RExem2;

public class Exem3 {
	
	//r0006패키지에 있는 RExem2의 변수의 값을 변환하고 출력해주세요.
	//단 RExem2의 변수의 접근제어자를 바꾸시면 안됩니다.
	//함수를 선언하여 해당 문제를 풀어주시기 바랍니다.
	
	public static void main(String[] args){
		RExem2 re = new RExem2();
		System.out.println(re.getA());  //변경전
		re.setA(5); //a값을 5로 변경함 
		System.out.println(re.getA()); //변경한 값을 출력.
	}

}
