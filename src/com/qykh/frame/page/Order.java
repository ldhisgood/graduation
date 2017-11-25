package com.qykh.frame.page;

public class Order {
	public static final int ASC = 1;
	public static final int DESC = 2;
	private String clumn;
	private int falg;//1升序，2降序
	public Order(){
		
	}
	public Order(String clumn, int falg) {
		super();
		this.clumn = clumn;
		this.falg = falg;
	}

	public String getClumn() {
		return clumn;
	}
	public void setClumn(String clumn) {
		this.clumn = clumn;
	}
	public int getFalg() {
		return falg;
	}
	public void setFalg(int falg) {
		this.falg = falg;
	}
	public static Order orderDesc(String name){
		return new Order(name,1);
	}
	public static Order orderAsc(String name){
		return new Order(name,2);
	}
}
