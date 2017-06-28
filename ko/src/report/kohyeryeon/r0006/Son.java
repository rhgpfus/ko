package report.kohyeryeon.r0006;

public class Son extends Father{ //다중 상속이 되지않는다!
	
	int a;  //맴버변수 맴버필드
//	int getAge(){  //함수의 재정의 라고한다!
//		age = 25;
//		return age; //오버라이딩~위에서 아빠꺼를 가져오기때문에~
//	}
	public static void main(String[] args){
		Son s = new Son();
		s.a = 3;
		System.out.println(s.getaddress());
		System.out.println(s.getAge());  //아빠꺼를 먼저 읽고 
                                        //아들꺼에있는 getAge함수를 호출! 함수를 재정의해서 25가 읽힘.
		                                  //위에 줄이 재정의 되서 값은 25가 된다.
		
		System.out.println(s.getName()); //아빠 이름.
		
		s.setName("박경훈");
		System.out.println(s.getName());
		
//		Father f = new Father();
//		System.out.println(f.address);
	}

}
