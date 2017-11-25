package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IEquipmentcategoryDao;
import com.qykh.core.domain.TEquipmentcategory;
import com.qykh.core.service.IEquipmentcategoryService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class EquipmentcategoryService implements IEquipmentcategoryService{
	@Autowired
	private IEquipmentcategoryDao dao ;
	@Override
	public void delete(TEquipmentcategory t) {
		dao.delete(t);
	}

	@Override
	public List<TEquipmentcategory> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TEquipmentcategory> queryByCondition(TEquipmentcategory t) {
		return null;
	}

	@Override
	public TEquipmentcategory queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TEquipmentcategory t) {
		dao.save(t);
	}

	@Override
	public void update(TEquipmentcategory t) {
		dao.update(t);
	}

}
