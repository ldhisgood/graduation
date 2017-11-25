package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IStandingDao;
import com.qykh.core.domain.TStanding;
import com.qykh.core.service.IStandingService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class StandingService implements IStandingService{
	@Autowired
	private IStandingDao dao ;
	@Override
	public void delete(TStanding t) {
		dao.delete(t);
	}

	@Override
	public List<TStanding> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TStanding> queryByCondition(TStanding t) {
		return null;
	}

	@Override
	public TStanding queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TStanding t) {
		dao.save(t);
	}

	@Override
	public void update(TStanding t) {
		dao.update(t);
	}

}
