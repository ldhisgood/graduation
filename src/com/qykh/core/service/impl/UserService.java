package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IUserDao;
import com.qykh.core.domain.TUser;
import com.qykh.core.service.IUserService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class UserService implements IUserService{
	@Autowired
	private IUserDao dao ;
	@Override
	public void delete(TUser t) {
		dao.delete(t);
	}

	@Override
	public List<TUser> list() {
		return null;
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TUser> queryByCondition(TUser t) {
		return null;
	}

	@Override
	public TUser queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TUser t) {
		dao.save(t);
	}

	@Override
	public void update(TUser t) {
		dao.update(t);
	}

}
