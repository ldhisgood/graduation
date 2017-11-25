package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.ISupplierDao;
import com.qykh.core.domain.TSupplier;
import com.qykh.core.service.ISupplierService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class SupplierService implements ISupplierService{
	@Autowired
	private ISupplierDao dao ;
	@Override
	public void delete(TSupplier t) {
		dao.delete(t);
	}

	@Override
	public List<TSupplier> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TSupplier> queryByCondition(TSupplier t) {
		return null;
	}

	@Override
	public TSupplier queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TSupplier t) {
		dao.save(t);
	}

	@Override
	public void update(TSupplier t) {
		dao.update(t);
	}

}
