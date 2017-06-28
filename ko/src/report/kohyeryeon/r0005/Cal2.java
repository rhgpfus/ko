package report.kohyeryeon.r0005;

public class Cal2 {
	//int형 변수 2개를 맴버변수로(클래스안에서 생성해야된다는겁니다.)
	//스트링형 변수 1개를 생성해주세요.
	//위에 인트형 변수는 num1,num2 스트링형변수는 operator
	//printPlus(), printMinus(), pirntMultiply(), pirntDividing()
	//Cal2(int num1, int num2, String operator)의 생성자를 선언하여
	//각각의 맴버변수에 대입해주세요.
	//그리고 위의 함수를 호출했을때 원하는 결과값을 출력해주세요.
	
	int a;           //맴버변수!!!!!!!!!!!!
	int b;
	String operator;
	
	Cal2(int num1, int num2, String operator){
		this.a = num1;
		this.b = num2;
		this.operator = operator;
	}
	
	void print(){
		for(int i=1;i<=4;i++){
			if(i==1){
				System.out.println("더한 값 :" +(a + b));
			}else if(i==2){
				System.out.println("곱한 값 :" +(a * b));
			}else if(i==3){
				System.out.println("나눈 값 :" + (a / b));
			}else if(i==4){
				System.out.println("뺀 값 :" + (a - b));
			}else{}
		}
	}
//	void printPlus(){	
//		if(operator.equals("+")){
//			System.out.println("더한 값 :" +(a + b));
//		}
//	}
//	void pirntMultiply(){
//		if(operator.equals("*")){
//			System.out.println("곱한 값 :" +(a * b));
//		}
//	}
//	void pirntDividing(){
//		if(operator.equals("/")){
//			System.out.println("나눈 값 :" + (a / b));
//		}
//	}
//	void printMinus(){
//		if(operator.equals("-")){
//			System.out.println("뺀 값 :" + (a - b));
//		}
//	}
	public static void main(String[] args){
		Cal2 ca = new Cal2(1,2,"+");   //"+"넣엇다고 꼭 더하기하는 계산연산자를 나오게할필요는없따!!
		ca.print();
//		ca.printPlus();
//		ca.pirntMultiply();
//		ca.pirntDividing();
//		ca.printMinus();
	}

}
