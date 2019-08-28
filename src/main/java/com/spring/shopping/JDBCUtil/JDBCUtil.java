package com.spring.shopping.JDBCUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtil {	
	public static Connection getConnection(){
		Connection conn = null;
		try{
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl22", "scott", "123456");	// �ش� ��θ� ���� DB����
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;			
	}	
	public static void closeResource(Statement stmt, Connection conn){
		try{
			if(stmt != null)
				stmt.close();
		}catch(Exception e){
			stmt = null;
		}
		try{
			if(conn != null)
				conn.close();
		}catch(Exception e){
			conn = null;
		}
	}
	public static void closeResource(ResultSet rs, Statement stmt, Connection conn){
		try{
			if(stmt != null)
				stmt.close();
		}catch(Exception e){
			stmt = null;
		}
		try{
			if(conn != null)
				conn.close();
		}catch(Exception e){
			conn = null;
		}
		try{
			if(rs != null)
				rs.close();
		}catch(Exception e){
			rs = null;
		}
	}
}
