package Common;

public class Exam {
	
	public static void main(String[] args){
		DBConn db = new DBConn();
		db.a = 3;
		
		System.out.println(db.a);
		System.out.println(DBConn.a);  //클래스이름.클래스변수이름
		
		
	}

}
