package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.test.DTO.BoardInfo;
import com.test.DTO.GoodsInfo;
import com.test.DTO.Page;
import com.test.DTO.Test;
import com.test.DTO.VenderInfo;

import com.test.service.BoardService;
import com.test.service.GoodsService;


public class GoodsServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;
	private GoodsService gs = new GoodsService();
	
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
		
		GoodsInfo goods = g.fromJson(request.getReader(), GoodsInfo.class);  //DTO에 있는 클래스를 이용.
		VenderInfo vender = g.fromJson(request.getReader(), VenderInfo.class);
		Page page = goods.getPage();
		
		String command = goods.getCommand();
		if(command.equals("list")){
			int totalCnt = gs.getTotalCount(goods);
			page.setTotalCnt(totalCnt);
			List<GoodsInfo> goodsList = gs.selectGoodsList(goods);
			List<VenderInfo> venderList = gs.selectVenderList();
			HashMap resultMap = new HashMap();
			resultMap.put("viList", venderList);
			resultMap.put("page", page);
	    	resultMap.put("giList", goodsList);
	    	resultMap.put("search", goods);
			String jsonStr = g.toJson(resultMap);
			System.out.println(jsonStr);
			doProcess(response, jsonStr);
		}else if(command.equals("view")){
			GoodsInfo resultGoods = gs.selectGoods(goods);
	    	HashMap resultMap = new HashMap();
	    	resultMap.put("page", page);
	    	resultMap.put("goods", resultGoods);
	    	resultMap.put("url", "/goods/goods_view.jsp");
	    	String jsonStr = g.toJson(resultMap);
	    	doProcess(response, jsonStr);
		}else if(command.equals("delete")){
	    	int result = gs.deleteGoods(goods);
	    	HashMap resultMap = new HashMap();
	    	resultMap.put("page", page);
	    	resultMap.put("msg", "사원이 삭제 되었습니다.");
	    	resultMap.put("url", "/goods/goods_list.jsp");
	    	if(result!=1){
		    	resultMap.put("msg", "삭제가 실패하였습니다.");
		    	resultMap.put("url", "");
	    	}
	    	String jsonStr = g.toJson(resultMap);
	    	doProcess(response, jsonStr);
	    }else if(command.equals("Insert")){
	    	int result = gs.insertGoods(goods);
	    	HashMap resultMap = new HashMap();
	    	resultMap.put("page", page);
	    	resultMap.put("msg", "사원이 등록 되었습니다.");
	    	resultMap.put("url", "/goods/goods_list.jsp");
	    	if(result!=1){
		    	resultMap.put("msg", "등록이 실패하였습니다.");
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