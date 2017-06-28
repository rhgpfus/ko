package report.kohyeryeon.r0006;

public class NewExem {
	
	public static void main(String[] args){
		String str1 = "a"; //"a"라고 저장되어있는 주소값을 가지고있음.
		String str2 = "a"; //"a"라고 저장되어있는 똑같은 주소값을 가지고있음.
		//String 클래스를 쓰는데 new를 쓰지않아도 오류나지않는 이유는 이미 내장되어있는 것을 불러오기때문. 
		System.out.println(str1==str2);
		str1 = new String("b");   // new를 해야지 새로운 주소값을 생성!! 주소값을 비교
		str2 = new String("b");
		str1 = str2;
		System.out.println(str1==str2);
		
		//이해하장~
	}

}
