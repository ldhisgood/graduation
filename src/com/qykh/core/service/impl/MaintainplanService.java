package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IMaintainplanDao;
import com.qykh.core.domain.TMaintainplan;
import com.qykh.core.service.IMaintainplanService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class MaintainplanService implements IMaintainplanService{
	@Autowired
	private IMaintainplanDao dao ;
	@Override
	public void delete(TMaintainplan t) {
		dao.delete(t);
	}

	@Override
	public List<TMaintainplan> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TMaintainplan> queryByCondition(TMaintainplan t) {
		return null;
	}

	@Override
	public TMaintainplan queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TMaintainplan t) {
		dao.save(t);
	}

	@Override
	public void update(TMaintainplan t) {
		dao.update(t);
	}

}
