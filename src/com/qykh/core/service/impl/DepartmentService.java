package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IDepartmentDao;
import com.qykh.core.domain.TDepartment;
import com.qykh.core.service.IDepartmentService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class DepartmentService implements IDepartmentService{
	@Autowired
	private IDepartmentDao dao ;
	@Override
	public void delete(TDepartment t) {
		dao.delete(t);
	}

	@Override
	public List<TDepartment> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TDepartment> queryByCondition(TDepartment t) {
		return dao.queryByCondition(t);
	}

	@Override
	public TDepartment queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TDepartment t) {
		dao.save(t);
	}

	@Override
	public void update(TDepartment t) {
		dao.update(t);
	}

	@Override
	public TDepartment queryByNum(String num) {
		return (TDepartment) dao.queryByCondition("num", num);
	}

}
