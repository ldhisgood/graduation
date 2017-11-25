package com.qykh.core.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IProtectDao;
import com.qykh.core.domain.TProtect;
import com.qykh.core.service.IProtectService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;


@Service
@Transactional
public class ProtectService implements IProtectService{
	@Autowired
	private IProtectDao dao ;
	@Override
	public void delete(TProtect t) {
		dao.delete(t);
	}

	@Override
	public List<TProtect> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TProtect> queryByCondition(TProtect t) {
		return null;
	}

	@Override
	public TProtect queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TProtect t) {
		dao.save(t);
	}

	@Override
	public void update(TProtect t) {
		dao.update(t);
	}
}
