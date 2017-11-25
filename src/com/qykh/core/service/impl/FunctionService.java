package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IFunctionDao;
import com.qykh.core.domain.TFunction;
import com.qykh.core.service.IFunctionService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class FunctionService implements IFunctionService{
	@Autowired
	private IFunctionDao dao ;
	@Override
	public void delete(TFunction t) {
		dao.delete(t);
	}

	@Override
	public List<TFunction> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TFunction> queryByCondition(TFunction t) {
		return null;
	}

	@Override
	public TFunction queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TFunction t) {
		dao.save(t);
	}

	@Override
	public void update(TFunction t) {
		dao.update(t);
	}

}
