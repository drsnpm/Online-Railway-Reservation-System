package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	    private static final String URL = "jdbc:mysql://localhost:3306/orrs";
	    private static final String USER = "root";
	    private static final String PASSWORD = "1234";

	    public static Connection getConn() {
	        Connection conn = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection(URL, USER, PASSWORD);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return conn;
	    }
	}
