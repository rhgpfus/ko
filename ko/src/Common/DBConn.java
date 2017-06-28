package Common;

public class DBConn {
	
	static int a = 1;
	
	static int getint() throws Exception{
		int a = Integer.parseInt("str");
		return a;
	}

	
	public static void main(String[] args){
		DBConn db = new DBConn();
		try {
			int a = db.getint();
		}catch (Exception e){	
			e.printStackTrace();
		}
	}
}
