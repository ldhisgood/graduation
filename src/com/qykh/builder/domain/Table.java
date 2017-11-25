package com.qykh.builder.domain;


import java.util.ArrayList;
import java.util.List;
/**
 * ʵ����table
 * @author Administrator
 *
 */
public class Table {
	private String tableName;
	private List<Column> columns = new ArrayList<Column>();
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public List<Column> getColumns() {
		return columns;
	}
	public void setColumns(List<Column> columns) {
		this.columns = columns;
	}
	public void add(Column column){
		columns.add(column);
	}
}
