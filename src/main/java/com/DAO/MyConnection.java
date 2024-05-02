package com.DAO;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
static Connection con=null;
	
	public static Connection getConnection() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/musicdb","root","root");
			System.out.println("Connection!!!");
		}catch(ClassNotFoundException e) {
			System.out.println("Driver class not found"+e);
			
		}catch(SQLException e) {
			System.out.println("Sql Exception "+e);
		}
		return con;
	}
}
