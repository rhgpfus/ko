package com.test.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.test.DTO.GoodsInfo;
import com.test.common.DBConn;

public class GoodsService {
	public List<GoodsInfo> selectGoods(GoodsInfo gi){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			String sql = "select gi.ginum,gi.giname,gi.gidesc,vi.vinum,vi.viname"
					+ " from goods_info as gi,vender_info as vi"
			 		+ " where vi.vinum=gi.vinum"
			 		+ " order by gi.ginum";  
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<GoodsInfo> goodsList = new ArrayList<GoodsInfo>();
			while(rs.next()){
				GoodsInfo gi2 = new GoodsInfo();
				gi2.setGiNum(rs.getInt("ginum"));
				gi2.setGiName(rs.getString("giname"));
				gi2.setGiDesc(rs.getString("gidesc"));
				gi2.setViNum(rs.getInt("vinum"));
				gi2.setViName(rs.getString("viname"));
				goodsList.add(gi2);
			}
			con.commit();
			return goodsList;
		}catch(Exception e){
			try{
				System.out.println(e);
				con.rollback();
			}catch(SQLException e1){
				e1.printStackTrace();
			}
		}
		finally{
			try{
				rs.close();
				ps.close();
				DBConn.closeCon();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return null;
	}
}

