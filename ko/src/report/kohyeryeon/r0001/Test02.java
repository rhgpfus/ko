package report.kohyeryeon.r0001;

public class Test02 {
	
	int a = 0;
	int b = 0;
	int c = 0;
	public void printLoop(){
		for(int i=a;i<=b;i++){	
			System.out.print(i);
			if(i%c==0){
				System.out.println(i+",");
		}else{
//			System.out.print(i);//int�� ���ǽ�
		}
	}
	}
	public void printLoopReverse(){
		int x = 0;
		for(int i=a;i>=b;i--){
			
			x++;  //�ڵ忡 ���� ����.
			System.out.print(i+",");
			if(x%c==0){
				System.out.println("");
			}else{
			}
		}
	}
	public static void main(String[] args){
		Test02 num1 = new Test02();
		num1.a=1;
		num1.b=100;
		num1.c=10;
		num1.printLoop();
		
		
		num1.a=100;
		num1.b=1;
		num1.printLoopReverse();
		
	}

}
