package com.payment.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.payment.log.PMLogger;

/** 
 * @author pankaj
 * created on 17-01-2019
 */
public class DBConnection {

	public DBConnection() {
		// TODO Auto-generated constructor stub
	}

    Connection connection = null;

	public Connection getDbConn() {
		try {
		    Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/paybill", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;	
	}
	
	public static void closeDBConnection(Connection con) {
		try {
			if(con!=null) {
				con.close();
				con = null;
			}
		}catch(SQLException e) {
			PMLogger.appendException("Exception occured while closing Connection", e);
		}
	}
	
	public static void closeResultSet(ResultSet rs) {
		try {
			if(rs!=null) {
				rs.close();
				rs = null;
			}
		}catch(SQLException e) {
			PMLogger.appendException("Exception occured while closing ResultSet", e);
		}
	}
	
	public static void closePreparedStatement(PreparedStatement ps) {
		try {
			if(ps!=null) {
				ps.close();
				ps=null;
			}
		}catch(SQLException e) {
			PMLogger.appendException("Exception occured while closing PreparedStatement", e);
		}
	}
}
