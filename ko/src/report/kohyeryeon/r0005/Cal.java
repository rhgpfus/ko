package report.kohyeryeon.r0005;

public class Cal {
	//인트타입의 2개의 파라메터 변수를 받는 생성자를 하나 만들어 주세요.
	//클래스안에 인트타입 변수 2개를 선언해주고. 클래스안에잇는 변수2개에 생성자에서 받은
	//파라메터 변수의 값을 대입하여 pirntPlus()를 함수에서 2개의 변수를 더한 값을 출력해주세요.
	//클래스 안에 스트링타입의 연산자를 저장하는 변수를 선언. 생성자에서 연산자를 저장하는 로직을 만들고
	//printCal()이라는 함수를 만들어 해당함수를 호출하였을때 알맞은 연산이 되는 프로그램을 만들어주세요.
	
	int ina;  //맴버변수
	int inb;
	String str;
	
	Cal(int ina){
		System.out.println(ina+ "인트형변수 파라메타를 한개를 가진 생성자를 호출하셨네요!");
		this.ina = ina;
	}
	Cal(int ina,int inb,String str){      //생성자는 무조건 클래스이름과 같아야한다!!! public빼도된다.
		this.str = str;
		this.ina = ina;
		this.inb = inb;
	}
	
	void printCal(){
		if(str.equals("+")){
			System.out.println("2개의 변수를 더한 값 : " + (ina+inb));
		}else if(str.equals("-")){
			System.out.println("2개의 변수를 뺀 값 : " + (ina-inb));
		}else if(str.equals("*")){
			System.out.println("2개의 변수를 곱한 값 : " + (ina*inb));
		}else if(str.equals("/")){
			System.out.println("2개의 변수를 나눈 값 : " + (ina/inb));
		}else{
			System.out.println("틀렷엉!!");
		}
	}
//---------------------------------------------------------------------------------------	
//	public void pirntPlus(){         //중복되는 변수명이 없어서 그냥 밑에 (ina+inb) 이렇게 써도된다.
//		System.out.println("2개의 변수를 더한 값 : " + (ina+inb));  //맨 위에 맴버변수를 바라보게된다.
//	}
//	public void pirntminus(){  
//		System.out.println("2개의 변수를 뺀 값 : " + (ina-inb));
//	}
//	public void pirntMultiply(){  
//		System.out.println("2개의 변수를 곱한 값 : " + (ina*inb));
//	}
//	public void pirntDividing(){  
//		System.out.println("2개의 변수를 나눈 값 : " + (ina/inb));
//	}
//---------------------------------------------------------------------------------------	
	public static void main(String[] args){
		Cal ca = new Cal(10,20,"/");
		ca.printCal();
//---------------------------------------------------------------------------------------		
//		ca.pirntPlus();        //틀린건 아니지만 쓸데없이 길다. 위에도 마찬가지.
//		ca.pirntminus();
//		ca.pirntMultiply();
//		ca.pirntDividing();
//---------------------------------------------------------------------------------------		
	}
}
