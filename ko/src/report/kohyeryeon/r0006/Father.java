package report.kohyeryeon.r0006;

public class Father {
	private String address = "서울시 강서구 가양동"; //private아빠만 쓸ㄲㅓ야!
	private int age = 65;
	private String name = "박철수";
	
	int getAge(){
		return age;
	}
	
	String getaddress(){
		return address;       //아빠만쓸수잇는 함수야!!
	}
	
	String getName(){
		return name;       //아빠만쓸수잇는 함수야!!
	}

	void setName(String name){
		this.name = name;
	}
}
