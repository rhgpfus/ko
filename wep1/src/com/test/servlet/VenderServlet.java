package com.test.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.test.DTO.GoodsInfo;
import com.test.DTO.Page;
import com.test.DTO.VenderInfo;
import com.test.service.VenderService;
import com.test.service.Implement.VenderServiceImpl;


public class VenderServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;
	private VenderServiceImpl vs2 = new VenderServiceImpl();
	private VenderService vs;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{		
		request.setCharacterEncoding("UTF-8");
		Gson g = new Gson();
		
		HashMap<String,String> goods = g.fromJson(request.getReader(), HashMap.class);
		System.out.println(goods);
		String resultStr = g.toJson(goods);
		doProcess(response, resultStr);
		
	}
		
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("UTF-8");
		Gson g = new Gson();
//		BufferedReader br = request.getReader();
//		String s = null;
//		String json = "";
//		while((s=br.readLine())!=null){
//			json += s;
//		}
//		VenderInfo vender = g.fromJson(json, VenderInfo.class);
		VenderInfo vender = g.fromJson(request.getReader(), VenderInfo.class);
		Page page = vender.getPage();
		
		String command = vender.getCommand();
		if(command.equals("list")){
			int totalCnt = vs.getTotalCount(vender);
			page.setTotalCnt(totalCnt);
			List<VenderInfo> venderList = vs.selectVenderList(vender);
			HashMap resultMap = new HashMap();
			resultMap.put("viList", venderList);
			resultMap.put("page", page);
	    	String jsonStr = g.toJson(resultMap);
			doProcess(response, jsonStr);
		}else if(command.equals("venderInsert")){
			int result = vs.insertVender(vender);
	    	HashMap resultMap = new HashMap();
	    	resultMap.put("page", page);
	    	resultMap.put("msg", "회사가 등록 되었습니다.");
	    	resultMap.put("url", "/goods/vender_list.jsp");
	    	if(result!=1){
		    	resultMap.put("msg", "등록이 실패하였습니다.");
		    	resultMap.put("url", "");
	    	}
	    	String jsonStr = g.toJson(resultMap);
	    	doProcess(response, jsonStr);
		}else if(command.equals("view")){
			VenderInfo resultVender = vs.selectVender(vender);
	    	HashMap resultMap = new HashMap();
	    	resultMap.put("page", page);
	    	resultMap.put("vender", resultVender);
	    	resultMap.put("url", "/goods/vender_view.jsp");
	    	String jsonStr = g.toJson(resultMap);
	    	doProcess(response, jsonStr);
		}else if(command.equals("venderDelete")){
	    	int result = vs.deleteVender(vender);
	    	HashMap resultMap = new HashMap();
	    	resultMap.put("page", page);
	    	resultMap.put("msg", "회가사 삭제 되었습니다.");
	    	resultMap.put("url", "/goods/vender_list.jsp");
	    	if(result!=1){
		    	resultMap.put("msg", "삭제가 실패하였습니다.");
		    	resultMap.put("url", "");
	    	}
	    	String jsonStr = g.toJson(resultMap);
	    	doProcess(response, jsonStr);
	    }else if(command.equals("venderUpdate")){
	    	int result = vs.updateVender(vender);
	    	HashMap resultMap = new HashMap();
	    	resultMap.put("msg", "수정이 완료 되었습니다.");
	    	resultMap.put("url", "/goods/vender_list.jsp");
	    	if(result!=1){
		    	resultMap.put("msg", "수정이 실패하였습니다.");
		    	resultMap.put("url", "");
	    	}
	    	String jsonStr = g.toJson(resultMap);
	    	doProcess(response, jsonStr);
	    	
	    }
//		Set<String> keys = goods.keySet();
//		for(String key:keys){
//			System.out.println(key + "=" + hm.get(key));
//		}
		//Test test = g.fromJson(request.getReader(), Test.class);
		//자기가 가지고 있는 키와 값만 만든다. 에러를 내지 않느다.
		//System.out.println(test);
		//String resultStr = g.toJson(test);
		//doProcess(response, resultStr);
				
	}

	
	public void doProcess(HttpServletResponse request, String writeStr) throws IOException {
		request.setContentType("text/html; charset = UTF-8");
		PrintWriter out = request.getWriter();
		out.print(writeStr);
		
	}
}