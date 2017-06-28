package report.kohyeryeon.r0008;

import report.kohyeryeon.r0007.Exem9;

public class Exem10 extends Exem9 {
	
	public Exem10(int a, int b) {
		//super(a,b);  //Exem9꺼 가져오는거.
		this.a = a;
		this.b = b;
		
	}

	public static void main(String[] args){
		Exem10 e10 = new Exem10(1,2);
		e10.getPlus();
		int a = e10.printResult();
		System.out.println(e10.printResult());

	
	
	
	
	
	}
}
