package com.qykh.builder.main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.qykh.builder.dao.Dao;
import com.qykh.builder.domain.Table;
import com.qykh.builder.util.FileUtil;
import com.qykh.builder.util.Load;
import com.qykh.builder.util.TableFactory;

public class Main {
	public static void main(String[] args) throws Exception {
		Dao dao = new Dao();
		Connection conn = dao.getConnect();
		Statement stat = conn.createStatement();
		
		ResultSet rs = stat.executeQuery("select * from user_tables");
		while(rs.next()){
			String name = rs.getString("table_name");
			if(name.startsWith("T_")){
				//获得table实体
				Table table = TableFactory.build(name);
				//变换拼接Filename
				String fname = TableFactory.makerName(name);
				String FileName = fname+".java";
				//---------此处修改存储的路径
				String path = "c://wenjian";
				//获得目标内容
				//---------此处可以选择生成的内容，如Dao ，service 等
				StringBuilder content = Load.makeDao(table);
				//输出
				FileUtil.out(path, FileName, content);
			}
		}
	}
}
