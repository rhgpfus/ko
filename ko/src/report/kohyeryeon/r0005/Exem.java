package report.kohyeryeon.r0005;

public class Exem {
	//Robot클래스가 가지고있는 3가지 함수를 호출해서 결과값을 출력해주세요.
	//단 로봇의 이름은 지로봇 나이는 10살입니다. cal클래스를 사용하여 더하기 빼기 곱하기 나누기 연산값을 출력해주세요.
	//단 첫번째 변수는 10 두변째 변수는 2입니다.
	
	
	
	
	
	public static void main(String[] args){
		String[] a = {"+","-","*","/"};
//		Robot ro = new Robot("지로봇",10);
//		ro.doKick();
//		ro.doRun();
//		ro.doChange();
		
//		Cal ca = new Cal(10,1,"+");
//		ca.printCal();
//		ca = new Cal(9,2,"+");          //아래도 된다. 굳이 new를 쓸필요가없다???
//		ca.printCal();
//		ca = new Cal(8,3,"+");
//		ca.printCal();
//		ca = new Cal(7,4,"+");
//		ca.printCal();
		Cal ca;
		for(int i=0;i<4;i++){
			ca = new Cal(10,2,a[i]);
			ca.printCal();
		}
		System.out.println("");
		
//		for(int i=1;i<=10;i++){
//			ca = new Cal(i,(11-i),"+");
//			ca.printCal();
//			System.out.println(i + "," + (11-i));
//		}
		
		
		
//		ca.str= "-";
//		ca.printCal();
//		ca.str= "*";
//		ca.printCal();
//		ca.str= "/";
//		ca.printCal();
	}

}
