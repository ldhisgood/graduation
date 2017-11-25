package com.qykh.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IUserDao;
import com.qykh.core.domain.TUser;
import com.qykh.core.service.ISystem;
@Service
@Transactional
public class SystemService implements ISystem{
	@Autowired
	private IUserDao dao;

	@Override
	public int checkLogin(String name,String pwd) {
		int checkLogin = dao.checkLogin(name, pwd);
		return checkLogin;
	}

	@Override
	public TUser queryUser(String name, String pwd) {
		return dao.queryUser(name,pwd);
	}

	
}
