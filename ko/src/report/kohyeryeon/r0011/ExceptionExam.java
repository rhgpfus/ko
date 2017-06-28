package report.kohyeryeon.r0011;

import report.kohyeryeon.r0010.MapExam2;

public class ExceptionExam {
	MapExam2 me2;
	public static void main(String[] args){
		ExceptionExam e = new ExceptionExam();
		
		System.out.println(e.me2);
		e.me2 = new MapExam2(); 
		e.me2.put("test", 1);
	}

}
