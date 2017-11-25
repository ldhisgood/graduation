package com.qykh.frame.session;

import javax.servlet.http.HttpSession;

import com.qykh.core.domain.TUser;

public class MySession {
	private static HttpSession session;

	public static HttpSession getSession() {
		return session;
	}

	public static void setSession(HttpSession session) {
		MySession.session = session;
	}
	/**
	 * 此方法不是通用的只限于此项目
	 * 
	 * @return 返回登录的用户对象
	 */
	public static TUser getTUser(){
		if(session!=null){
			return (TUser) session.getAttribute("user");
		}
		return null;
	}
}
