package com.qykh.frame.util;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Util {

	public static final int BYTE_LENGTH = 256;

	public static final int MAX_LENGTH = 16;

	/** 默认密码 123456 */
	public static final String DEFAULT_PASSWORD = "e10adc3949ba59abbe56e057f20f883e";

	public static String encode(String plainText) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte[] b = md.digest();

			int i;

			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0) {
					i += BYTE_LENGTH;
				}
				if (i < MAX_LENGTH) {
					buf.append("0");
				}
				buf.append(Integer.toHexString(i));
			}
			return buf.toString();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		System.out.println(encode("admin"));
	}
}