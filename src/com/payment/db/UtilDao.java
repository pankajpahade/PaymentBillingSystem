package com.payment.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author pankaj 
 * created on 08-02-2019
 */
public class UtilDao {

	DBConnection conn = null;
	String enroll = null;
	String pass = null;
	String eml = null;
	
	public ResultSet checkEnrollment(String enrollment) throws SQLException {
	    ResultSet resultSet = null;
		conn = new DBConnection();
		String sql = "select * from generalinfo where enrollment =?";
		Connection connection = conn.getDbConn();
		PreparedStatement ps = connection.prepareStatement(sql);
		ps.setString(1, enrollment);
	    resultSet = ps.executeQuery();
		return resultSet;
	}

}
