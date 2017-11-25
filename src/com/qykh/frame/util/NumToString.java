package com.qykh.frame.util;

public class NumToString {
	/**
	 * 将数字补全5位  如 1-00001；10-010； 100-100
	 * @param a
	 * @return
	 */
	public static String parseNumber5(int a ){
		String retVal = "00000";
		String temp = a+"";
		if(temp.length()>4){
			return retVal;
		}
		int len = 5 - temp.length();
		for(int i=0;i< len ;i++){
			temp = "0"+temp;
		}
		retVal = temp;
		return retVal;
	}
}
