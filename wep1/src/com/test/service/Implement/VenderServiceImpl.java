package com.test.service.Implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.test.DTO.GoodsInfo;
import com.test.DTO.Page;
import com.test.DTO.VenderInfo;
import com.test.common.DBConn;
import com.test.service.VenderService;

public class VenderServiceImpl implements VenderService{

	public VenderInfo selectVender(VenderInfo vi){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "select vinum,viname,videsc,viaddress,viphone from vender_info"
					+ " where vinum=?";
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, vi.getViNum());
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				VenderInfo vi2 = new VenderInfo();
				vi2.setViNum(rs.getInt("vinum"));
				vi2.setViName(rs.getString("viname"));
				vi2.setViDesc(rs.getString("videsc"));
				vi2.setViAddress(rs.getString("viaddress"));
				vi2.setViPhone(rs.getString("viphone"));
				return vi2;
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
	
	public List<VenderInfo> selectVenderList(VenderInfo vi){
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			String sql = "select vinum,viname,videsc,viaddress,viphone from vender_info where 1=1";
			int idx = 0;
			if(vi.getViNum()!=0){
				sql += " and vinum=?";
				idx++;
			}
			if(vi.getViName()!=null && !vi.getViName().equals("")){
				sql += " and viname like ?";
				idx++;
			}
			sql += " order by vinum"
					+ " limit ?,?";
			Page page = vi.getPage();
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			if(vi.getViNum()!=0 && (vi.getViName()==null || vi.getViName().equals(""))){
				ps.setInt(1, vi.getViNum());
			}else if((vi.getViName()!=null&& !vi.getViName().equals("")) && vi.getViNum()==0){
				ps.setString(1,"%"+ vi.getViName() + "%");
			}else if((vi.getViName()!=null&& !vi.getViName().equals("")) && vi.getViNum()!=0 ){
				ps.setInt(1, vi.getViNum());
				ps.setString(2, "%"+ vi.getViName() + "%");
			}
			ps.setInt(++idx, page.getStartRow());
			ps.setInt(++idx, page.getRowCnt());
			rs = ps.executeQuery();
			List<VenderInfo> venderList = new ArrayList<VenderInfo>();
			while(rs.next()){
				VenderInfo vi2 = new VenderInfo();
				vi2.setViNum(rs.getInt("vinum"));
				vi2.setViName(rs.getString("viname"));
				vi2.setViDesc(rs.getString("videsc"));
				vi2.setViAddress(rs.getString("viaddress"));
				vi2.setViPhone(rs.getString("viphone"));
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
	public int getTotalCount(VenderInfo vi){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "select count(1) from vender_info";
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
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
	
	public int insertVender(VenderInfo vi){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "insert into vender_info(viname,videsc,viaddress,viphone,vidate,vitime)";
			sql += " values(?,?,?,?,DATE_FORMAT(NOW(),'%Y%m%d'), DATE_FORMAT(NOW(),'%H%i%s'))";

			con = DBConn.getCon(); 
			ps = con.prepareStatement(sql);
			ps.setString(1, vi.getViName());
			ps.setString(2, vi.getViDesc());
			ps.setString(3, vi.getViAddress());
			ps.setString(4, vi.getViPhone());
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
	public int deleteVender(VenderInfo vi){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "delete from vender_info where vinum=?";
			con = DBConn.getCon(); 
			ps = con.prepareStatement(sql);
			ps.setInt(1, vi.getViNum());
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
	public int updateVender(VenderInfo vi){
		Connection con = null;
		PreparedStatement ps = null;
		try {
			String sql = "update vender_info";
			sql += " set viname=?,";
			sql += " videsc=?,";
			sql += " viaddress=?,";
			sql += " viphone=?";
			sql += " where vinum=?";
			con = DBConn.getCon(); 
			ps = con.prepareStatement(sql);
			ps.setString(1, vi.getViName());
			ps.setString(2, vi.getViDesc());
			ps.setString(3, vi.getViAddress());
			ps.setString(4, vi.getViPhone());
			ps.setInt(5, vi.getViNum());
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


