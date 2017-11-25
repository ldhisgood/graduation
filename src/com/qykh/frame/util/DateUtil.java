package com.qykh.frame.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 日期类：
 * 将字符串变成date ；date变成string ；获取系统时间
 * @author Administrator
 *
 */
public class DateUtil {
	public static final SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
	public static final SimpleDateFormat ymdhms = new SimpleDateFormat(
			"yyyy-MM-dd hh:mm:ss");

	public static Date toDate(String str) {
		try {
			return ymd.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String toChar(Date date) {
		return ymd.format(date);
	}
	
	
	public static String sysDate(){
		return ymd.format(new Date());
	}
	
	public static String sysDate(SimpleDateFormat sdf){
		return sdf.format(new Date());
	}
	/**
	 * 获取系统的时间只精确到天
	 * @return
	 */
	public static Date dayDate(){
		try {
			return pdayDate(ymd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	private static Date pdayDate(SimpleDateFormat sdf) throws ParseException{
		Date date = new Date();
		String a = sdf.format(date);
		return sdf.parse(a);
	}
}
