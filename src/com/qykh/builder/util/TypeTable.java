package com.qykh.builder.util;

import java.util.HashMap;
import java.util.Map;

public class TypeTable {
	public static Map<Integer,String> mysql = new HashMap<Integer, String>();
	static {
		mysql.put(1, "String");
		mysql.put(4, "Integer");
		mysql.put(12, "String");
		mysql.put(8, "Double");
		mysql.put(93, "Date");
	}
}
