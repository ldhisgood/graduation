package com.qykh.builder.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class Prop {
	/**
	 * 加载dao配置文件
	 * @return
	 */
	public static Map<String,String> loadJDBC(){
		Map<String,String> map = new HashMap<String,String>();
		Properties prop = new Properties();
		InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("com/qykh/builder/config/jdbc.properties");
		try {
			prop.load(in);
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String pwd = prop.getProperty("pwd");
			String uname = prop.getProperty("uname");
			map.put("driver", driver);
			map.put("url", url);
			map.put("pwd", pwd);
			map.put("uname", uname);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	/**
	 * 加载文件路径文件
	 * @return
	 */
	public static Map<String,String> loadFile(){
		Map<String,String> map = new HashMap<String,String>();
		Properties prop = new Properties();
		InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("/path.properties");
		try {
			prop.load(in);
			String path = prop.getProperty("path");
			String flag = prop.getProperty("flag");
			map.put("path", path);
			map.put("flag", flag);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
}
