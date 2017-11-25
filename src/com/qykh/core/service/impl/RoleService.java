package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IRoleDao;
import com.qykh.core.domain.TRole;
import com.qykh.core.service.IRoleService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class RoleService implements IRoleService{
	@Autowired
	private IRoleDao dao ;
	@Override
	public void delete(TRole t) {
		dao.delete(t);
	}

	@Override
	public List<TRole> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TRole> queryByCondition(TRole t) {
		return null;
	}

	@Override
	public TRole queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TRole t) {
		dao.save(t);
	}

	@Override
	public void update(TRole t) {
		dao.update(t);
	}

}
