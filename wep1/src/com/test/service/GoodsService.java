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
public List<VenderInfo> selectVenderList(){
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
	
	public List<GoodsInfo> selectGoodsList(GoodsInfo gi){
		
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
			if(gi.getGiName()!=null && !gi.getGiName().equals("")){
				sql += " and gi.giName like ?";
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
				ps.setString(1,"%"+ gi.getGiName() + "%");
			}else if((gi.getGiName()!=null&& !gi.getGiName().equals("")) && gi.getViNum()!=0 ){
				ps.setInt(1, gi.getViNum());
				ps.setString(2, "%"+ gi.getGiName() + "%");
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
				sql += " and gi.giname like ?";
			}
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			if(gi.getViNum()!=0 && (gi.getGiName()==null || gi.getGiName().equals(""))){
				ps.setInt(1, gi.getViNum());
			}else if((gi.getGiName()!=null && !gi.getGiName().equals("")) && gi.getViNum()==0){
				ps.setString(1, "%" + gi.getGiName() + "%");
			}else if((gi.getGiName()!=null && !gi.getGiName().equals("")) && gi.getViNum()!=0 ){
				ps.setInt(1, gi.getViNum());
				ps.setString(2,"%" + gi.getGiName() + "%");
			}
			ResultSet rs = ps.executeQuery();
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
	public GoodsInfo selectGoods(GoodsInfo pGoods){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "select gi.ginum, gi.giname, gi.gidesc, vi.vinum, vi.viname "
					+ " from goods_info as gi, vender_info as vi "
					+ " where gi.vinum=vi.vinum and gi.ginum=?";
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, pGoods.getGiNum());
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				GoodsInfo goods = new GoodsInfo();
				goods.setGiNum(rs.getInt("ginum"));
				goods.setGiName(rs.getString("giname"));
				goods.setGiDesc(rs.getString("gidesc"));
				goods.setViNum(rs.getInt("vinum"));
				goods.setViName(rs.getString("viname"));
				return goods;
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
		return null;
	}
	public int deleteGoods(GoodsInfo pGoods){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "delete from goods_info where  ginum=?";
			con = DBConn.getCon(); 
			ps = con.prepareStatement(sql);
			ps.setInt(1, pGoods.getGiNum());
			int result = ps.executeUpdate();
			con.commit();
			return result;
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
	public int insertGoods(GoodsInfo pGoods){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "insert into goods_info(giname,gidesc,vinum,gidate,gitime)";
			sql += " values(?,?,?,DATE_FORMAT(NOW(),'%Y%m%d'), DATE_FORMAT(NOW(),'%H%i%s'))";

			con = DBConn.getCon(); 
			ps = con.prepareStatement(sql);
			ps.setString(1, pGoods.getGiName());
			ps.setString(2, pGoods.getGiDesc());
			ps.setInt(3, pGoods.getViNum());
			int result = ps.executeUpdate();
			con.commit();
			return result;
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
	public int updateGoods(GoodsInfo pGoods){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "update goods_info";
			sql += " set giname=?,";
			sql += " gidesc=?,";
			sql += " vinum=?";
			sql += " where ginum=?";
			con = DBConn.getCon(); 
			ps = con.prepareStatement(sql);
			ps.setString(1, pGoods.getGiName());
			ps.setString(2, pGoods.getGiDesc());
			ps.setInt(3, pGoods.getViNum());
			ps.setInt(4, pGoods.getGiNum());
			int result = ps.executeUpdate();
			con.commit();
			return result;
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


