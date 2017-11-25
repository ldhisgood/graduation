package com.qykh.core.service;

import com.qykh.core.domain.TUser;

public interface ISystem {
	public int checkLogin(String name,String pwd);
	
	public TUser queryUser (String name ,String pwd);
}
