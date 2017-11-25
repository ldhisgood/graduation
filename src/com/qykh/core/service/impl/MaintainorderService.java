package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IMaintainorderDao;
import com.qykh.core.domain.TMaintainorder;
import com.qykh.core.service.IMaintainorderService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class MaintainorderService implements IMaintainorderService{
	@Autowired
	private IMaintainorderDao dao ;
	@Override
	public void delete(TMaintainorder t) {
		dao.delete(t);
	}

	@Override
	public List<TMaintainorder> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TMaintainorder> queryByCondition(TMaintainorder t) {
		return null;
	}

	@Override
	public TMaintainorder queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TMaintainorder t) {
		dao.save(t);
	}

	@Override
	public void update(TMaintainorder t) {
		dao.update(t);
	}

}
