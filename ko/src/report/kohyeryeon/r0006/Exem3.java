package report.kohyeryeon.r0006;

public class Exem3 {          //다시 계속 해보자~ 이해될떄까지~
	
	int getIndexFromArray(int[] arr, int num){
		for(int i=0;i<arr.length;i++){  // a의 값을 가진것을 arr에 넘겨줌. 
			if(arr[i]==num){ //arr.length a의 방개수 자체.
				return i;  //리턴만나면 아예 값을 넘겨주고 나가버린다!
			}
		}
		return -1;
	}
	
	
	
	public static  void main(String[] args){
		int[] a = new int[5];
		for(int i=0;i<5;i++){
			a[i] = (i+1)*10;
			
		}
		Exem3 e3 = new Exem3(); //호출하려면 무조건 이것을 쓸것.
		int idx = e3.getIndexFromArray(a, 30);
		System.out.println("30번째 방에 있는 인덱스의 키값은 : " + idx);
	}
	

}
