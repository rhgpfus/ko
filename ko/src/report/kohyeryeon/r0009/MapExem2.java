package report.kohyeryeon.r0009;

import java.util.HashMap;

public class MapExem2 {
	HashMap<String, Integer> hm;
	//HashMap<String, Integer> 까지가 데이터타입! 
	
	MapExem2(){
		hm = new HashMap<String, Integer>();
	}

	public static void main(String[] args){
		MapExem2 me = new MapExem2();
		me.hm.put("1",1);
	}
	
}
