package com.qykh.frame.page;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qykh.frame.util.DateUtil;

public class Paramter {
	//参数列表（key对应列，value对应条件）
	private Map<String,Object> map = new HashMap<String, Object>();
	//是否排序(Order相当于条件)
	private List<Order> orders = new ArrayList<Order>();
	//暂时不好使
	private String btweenAnd ;
	
	public String getBtweenAnd() {
		return btweenAnd;
	}

	public void setBtweenAnd(String column,Date start,Date end) {
		btweenAnd = " and "+column+"between "+DateUtil.toChar(start)+" and "+DateUtil.toChar(end);
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}


	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		if(map==null)return ;
		this.map = map;
	}
	/**
	 * 添加排序对象
	 * @param order
	 */
	public void addOrder(Order order){
		orders.add(order);
	}
	/**
	 * 添加条条件过滤
	 */
	public void addCondition(String key,Object value){
		map.put(key, value);
	}
}
