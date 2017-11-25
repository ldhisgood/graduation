package com.qykh.frame.page;

import java.util.List;

public class PageTion {
	//第几页
	private int pageNo;
	//每页显示多少
	private int pageSize;
	private List<?> list;
	//总页数
	private int total;
	//总条数
	private int num;
	
	
	


	public PageTion(){
		
	}
	
	
	public PageTion(int pageNo, int pageSize, List<?> list, int num) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.list = list;
		this.num = num;
		this.total = num%pageSize==0?num/pageSize:num/pageSize+1;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<?> getList() {
		return list;
	}
	public void setList(List<?> list) {
		this.list = list;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
		if(pageSize!=0)
		this.total = num%pageSize==0?num/pageSize:num/pageSize+1;
	}
	
}
