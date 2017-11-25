package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.ISupplierDao;
import com.qykh.core.domain.TSupplier;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class SupplierDao extends HibernateBaseDao<TSupplier> implements ISupplierDao{

	@Override
	public Class<TSupplier> getEntityClass() {
		return TSupplier.class;
	}

}
