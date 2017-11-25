package com.qykh.builder.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import com.qykh.builder.util.Prop;


public class Dao {
	private Connection conn;
	public Dao(){
		Map<String, String> map = Prop.loadJDBC();
		String url = map.get("url");
		String uname = map.get("uname");
		String pwd = map.get("pwd");
		String driver = map.get("driver");
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uname,pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public Connection getConnect(){
		return conn;
	}
	
	public void  close(Connection conn){
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
