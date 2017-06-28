package report.kohyeryeon.r0005;

public class Exwm2 {
	//반복문0부터4까지 작성하여 Cal(int ina)라고 선언된 생성자를 호출하여 1부터 5까지 출력을 해보시기바랍니다.
	
	public static void main(String[] args){
		Cal[] c = new Cal[5];
		//System.out.println(c[0]);
		// Cal c0 = null;
		
		for(int i=0;i<=4;i++){
			c[i] = new Cal(i+1);  //null이 들어가있어서 new를 써줘서 초기화해준다.
		}
		for(int i=0;i<=4;i++){
			System.out.println(c[i].ina);
		}
	}	
}
