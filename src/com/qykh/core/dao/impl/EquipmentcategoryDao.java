package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IEquipmentcategoryDao;
import com.qykh.core.domain.TEquipmentcategory;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class EquipmentcategoryDao extends HibernateBaseDao<TEquipmentcategory> implements IEquipmentcategoryDao{

	@Override
	public Class<TEquipmentcategory> getEntityClass() {
		return TEquipmentcategory.class;
	}

}
