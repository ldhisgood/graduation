package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IEquipmentDao;
import com.qykh.core.domain.TEquipment;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class EquipmentDao extends HibernateBaseDao<TEquipment> implements IEquipmentDao{

	@Override
	public Class<TEquipment> getEntityClass() {
		return TEquipment.class;
	}

}
