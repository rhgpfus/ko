package report.kohyeryeon.r0010;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MapExam extends HashMap{
//	MapExam(){}
	
	public String put(String key){
		if(!containsKey(key)){   //
			put(key,"test");
			return "잘들어갓엉";
		}
		return "이미 잇엉";
	}
	public String toString(){  
		String result = "";
		List<String> keys = new ArrayList<>(keySet());
		for(int i=0;i<keys.size();i++){
			String key = keys.get(i);
			Object value = (Object)get(key);
			result += "[" + key + "," + value + "]\n";
		}
		if(result.equals("")){
			result = "야 아무것도 없어 임마";
		}
		return result;     //result 는 지역변수.
	}
	
	public static void main(String[] args){
		MapExam me = new MapExam();
		String result = me.put("A군");
		System.out.println(me);
		System.out.println(result);
		String result2 = me.toString();
		
		
	}
	
}
