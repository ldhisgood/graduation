package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IRfDao;
import com.qykh.core.domain.TRf;
import com.qykh.core.service.IRfService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional(propagation=Propagation.REQUIRED)
public class RfService implements IRfService{
	@Autowired
	private IRfDao dao ;
	@Override
	public void delete(TRf t) {
		dao.delete(t);
	}

	@Override
	public List<TRf> list() {
		return null;
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TRf> queryByCondition(TRf t) {
		return null;
	}

	@Override
	public TRf queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TRf t) {
		dao.save(t);
	}

	@Override
	public void update(TRf t) {
		dao.update(t);
	}

	@Override
	public void deleteByCondition(String key, Object value) {
		dao.deleteByCondition(key, value);
	}

	@Override
	public void saveForBatch(List<TRf> list) {
		dao.saveForBatch(list);
	}

}
