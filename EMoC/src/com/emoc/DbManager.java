package com.emoc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbManager {
	public Connection getConnection()
	{
		try {
			Connection conn = null;
			Class.forName(Constants.JDBC_DRIVER); // load and register the driver		
			conn = DriverManager.getConnection(Constants.DB_URL,Constants.username,Constants.password);
			System.out.print("Connection Established!");
			return conn;
		}
		catch (ClassNotFoundException e) {
			System.out.print(e.getMessage());
			return null;
		}
		catch (SQLException e2) {
			System.out.print(e2.getMessage());
			return null;
		}	
	}
}
