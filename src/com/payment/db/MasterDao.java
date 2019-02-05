package com.payment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.struts.util.LabelValueBean;
import com.payment.log.PMLogger;

/**
 * 
 * @author arvind.manwatkar
 * created on 05-02-2019
 */
public class MasterDao {
	
	DBConnection connection = new DBConnection();
	
	public static String toCommaSepString(String[] array) {
		String result = "";
		if (array.length > 0) {
			StringBuilder sb = new StringBuilder();
			for (String s : array) {
				sb.append(s).append(",");
			}
			result = sb.deleteCharAt(sb.length() - 1).toString();
		}
		return result;
	}
	
	public List<LabelValueBean> getCollegeData() {
		Connection con = null;
		ResultSet rs= null;
		PreparedStatement ps = null;
		List<LabelValueBean> data = new ArrayList<LabelValueBean>();
		try {
			con = connection.getDbConn();
			ps = con.prepareStatement("SELECT CId, CName FROM collegeinfo");
			rs = ps.executeQuery();
			while(rs.next()) {
				data.add(new LabelValueBean(rs.getString("CName"), rs.getString("Cid")));	
			}
		}catch(SQLException sql) {
			PMLogger.appendException("SQLException occured while getting college data", sql);
		}catch(NullPointerException np){
			PMLogger.appendException("NullPointerException occured while getting college data", np);
		}finally {
			DBConnection.closeResultSet(rs);
			DBConnection.closePreparedStatement(ps);
		}
		return data;
	}
	
	public Set<LabelValueBean> getBranchData(String[] deptIds){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Set<LabelValueBean> branchList = new LinkedHashSet<LabelValueBean>();
		try {
			con = connection.getDbConn();
			ps = con.prepareStatement("SELECT b.branchId,b.bName,d.dName FROM branches b INNER JOIN department d ON b.deptId=d.deptId WHERE b.deptId = ?");
			for(String deptId : deptIds) {
				ps.setString(1, deptId);
				rs = ps.executeQuery();
				while(rs.next()) {
					branchList.add(new LabelValueBean(rs.getString("dName")+" - "+rs.getString("bName"),rs.getString("branchId")));
				}
			}
		}catch(SQLException sql) {
			PMLogger.appendException("SQLException occured while getting branch data", sql);
		}catch(NullPointerException npx) {
			PMLogger.appendException("NullPointerException occured while getting branch data", npx);
		}finally {
			DBConnection.closeResultSet(rs);
			DBConnection.closePreparedStatement(ps);
		}
		return branchList;
	}

	public List<LabelValueBean> getDepartmentData(){
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		List<LabelValueBean> departmentList = new ArrayList<LabelValueBean>();
		try {
			con = connection.getDbConn();
			ps = con.prepareStatement("SELECT *FROM department");
			rs = ps.executeQuery();
			while(rs.next()) {
				departmentList.add(new LabelValueBean(rs.getString("dName"),rs.getString("deptId")));
			}
		}catch(SQLException sqlE) {
			PMLogger.appendException("SQLException occured while getting department data", sqlE);
		}catch(NullPointerException npEx) {
			PMLogger.appendException("NullPointerException occured while getting department data", npEx);
		}finally {
			DBConnection.closeResultSet(rs);
			DBConnection.closePreparedStatement(ps);
		}
		return departmentList;
	}
	
	public boolean saveMasterData(String collegeId,String deptIDs,String branchIds) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		boolean flag = false;
		try {
			con = connection.getDbConn();
			String strSql = "select cId from adminmaster where cId = ?";
			ps = con.prepareStatement(strSql);
			ps.setString(1, collegeId);
			rs = ps.executeQuery();
			if(rs.next()) {
				strSql = "update adminmaster set deptIds=?,branchIds=? where cId=?";
			}else {
				strSql = "insert into adminmaster(deptIds,branchIds,cId) values(?,?,?)";
			}
			ps.close();
			ps = null;
			ps = con.prepareStatement(strSql);
			ps.setString(1, deptIDs);
			ps.setString(2, branchIds);
			ps.setString(3, collegeId);
			ps.execute();
			flag = true;
		}catch(SQLException sqlEx) {
			PMLogger.appendException("Error occured while linking master data", sqlEx);
		}finally {
			DBConnection.closeResultSet(rs);
			DBConnection.closePreparedStatement(ps);
		}
		return flag;
	}

}
