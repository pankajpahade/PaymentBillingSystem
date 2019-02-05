package com.payment.db;

import java.sql.Connection;
import java.sql.DriverManager;

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
}
