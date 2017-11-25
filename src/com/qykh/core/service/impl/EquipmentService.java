package com.qykh.core.service.impl;


import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IEquipmentDao;
import com.qykh.core.domain.TEquipment;
import com.qykh.core.service.IEquipmentService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class EquipmentService implements IEquipmentService{
	@Autowired
	private IEquipmentDao dao ;
	@Override
	public void delete(TEquipment t) {
		dao.delete(t);
	}

	@Override
	public List<TEquipment> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TEquipment> queryByCondition(TEquipment t) {
		return null;
	}

	@Override
	public TEquipment queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TEquipment t) {
		dao.save(t);
	}

	@Override
	public void update(TEquipment t) {
		dao.update(t);
	}

	@Override
	public TEquipment queryByNum(String num) {
		return dao.queryOneByCondition("num", num);
	}

}
