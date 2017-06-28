package report.kohyeryeon.r0006;

public class Exem2 {
	
	int printFour(int num){
		for(int i=1;i<10;i++){
			if(i==num){
				return i;
			}
		}
		return -1;
	}
	
	
	public static void main(String[] args){
		Exem2 e2 =new Exem2();
		int str = e2.printFour(11);
		System.out.println(str);
		
		

	}
}