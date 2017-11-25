package com.qykh.builder.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import com.qykh.builder.dao.Dao;
import com.qykh.builder.domain.Column;
import com.qykh.builder.domain.Table;

public class TableFactory {
	/**
	 * 根据表名称创建表对象
	 * 
	 * @param tableName
	 * @return
	 */
	public static Table build(String tableName) {
		Dao dao = new Dao();
		Connection conn = dao.getConnect();
		Table table = new Table();
		table.setTableName(makerName(tableName));
		try {
			Statement stat = conn.createStatement();

			ResultSet rs = stat.executeQuery("select * from " + tableName
					+ " where 1=2 ");
			ResultSetMetaData metaData = rs.getMetaData();
			for (int i = 1; i <= metaData.getColumnCount(); i++) {
				String columnName = metaData.getColumnLabel(i);
				int columnType = metaData.getColumnType(i);
				System.out.println(columnType);
				Column clo = new Column();
				clo.setColumnName(columnName);
				clo.setColumnType(TypeTable.mysql.get(columnType));
				table.add(clo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return table;
	}

	/**
	 * 表名格式化成java名称
	 * 
	 * @param name
	 * @return
	 */
	public static String makerName(String name) {
		String replace = name.replace("_", "");
		String pre = replace.substring(0, 2);
		String pre1 = pre.toUpperCase();
		String suffix = replace.substring(2);
		String suffix1 = suffix.toLowerCase();
		return pre1 + suffix1;
	}
}
