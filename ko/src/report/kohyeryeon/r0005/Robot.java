package report.kohyeryeon.r0005;

public class Robot {
	
	//-----------------속성--------------------------
	String name;               
	int age;
	
	
	public Robot(String name, int age){
		this.name = name;    //앞에 this.을 붙이면 위에잇는 네임과 에이쥐를 바라보게된다.
		this.age = age;          //안붙이면 새로 생성된 네임과 에이쥐를 바라보게된다.
	}
	
	//-----------------기능---------------------------
	void doKick(){             
		System.out.println(age + "살짜리 " + name + "이 발차기를 하였습니다.");
	}
	
	void doRun(){
		System.out.println(age + "살짜리 " + name + "이 달리기를 하였습니다.");
	}
	
	void doChange(){
		System.out.println(age + "살짜리 " + name + "이 변신을 하였습니다.");
	}
	//-----------------------------------------------
	public static void main(String[] args){
		Robot go = new Robot("고로봇",4);
		go.doKick();
		go.doRun();
		go.doChange();
		
		
	}
}
