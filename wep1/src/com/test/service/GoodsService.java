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
import com.test.DTO.Page;
import com.test.DTO.VenderInfo;
import com.test.common.DBConn;


public class GoodsService {
	
public List<VenderInfo> selectVender(){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			String sql = "select vinum, viname from vender_info";
			
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<VenderInfo> venderList = new ArrayList<VenderInfo>();
			while(rs.next()){
				VenderInfo vi2 = new VenderInfo();
				vi2.setViNum(rs.getInt("vinum"));
				vi2.setViName(rs.getString("viname"));
				venderList.add(vi2);
			}
			con.commit();
			
			return venderList;
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
	
	public List<GoodsInfo> selectGoods(GoodsInfo gi){
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			String sql = "select gi.ginum,gi.giname,gi.gidesc,vi.vinum,vi.viname"
					+ " from goods_info as gi,vender_info as vi"
			 		+ " where vi.vinum=gi.vinum";
			int idx = 0;
			if(gi.getViNum()!=0){
				sql += " and gi.vinum=?";
				idx++;
			}
			if(gi.getGiName()!=null&& !gi.getGiName().equals("")){
				sql += " and gi.giname=?";
				idx++;
			}
			sql += " order by gi.ginum"
					+ " limit ?,?";
			Page page = gi.getPage();
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			if(gi.getViNum()!=0 && (gi.getGiName()==null || gi.getGiName().equals(""))){
				ps.setInt(1, gi.getViNum());
			}else if((gi.getGiName()!=null&& !gi.getGiName().equals("")) && gi.getViNum()==0){
				ps.setString(1, gi.getGiName());
			}else if((gi.getGiName()!=null&& !gi.getGiName().equals("")) && gi.getViNum()!=0 ){
				ps.setInt(1, gi.getViNum());
				ps.setString(2, gi.getGiName());
			}
			ps.setInt(++idx, page.getStartRow());
			ps.setInt(++idx, page.getRowCnt());
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
	public int getTotalCount(GoodsInfo gi){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "select count(1) "
					+ " from goods_info as gi, vender_info as vi "
					+ " where gi.vinum=vi.vinum";
			if(gi.getViNum()!=0){
				sql += " and gi.vinum=?";
			}
			if(gi.getGiName()!=null&& !gi.getGiName().equals("")){
				sql += " and gi.giname=?";
			}
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			if(gi.getViNum()!=0 && (gi.getGiName()==null || gi.getGiName().equals(""))){
				ps.setInt(1, gi.getViNum());
			}else if((gi.getGiName()!=null&& !gi.getGiName().equals("")) && gi.getViNum()==0){
				ps.setString(1, gi.getGiName());
			}else if((gi.getGiName()!=null&& !gi.getGiName().equals("")) && gi.getViNum()!=0 ){
				ps.setInt(1, gi.getViNum());
				ps.setString(2, gi.getGiName());
			}
			ResultSet rs = ps.executeQuery();
			List<GoodsInfo> goodsList = new ArrayList<GoodsInfo>();
			while(rs.next()){
				return rs.getInt(1);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				DBConn.closeCon();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
}


