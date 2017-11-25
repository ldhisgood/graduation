package com.qykh.core.dao.impl;

import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IProtectDao;
import com.qykh.core.domain.TProtect;
import com.qykh.frame.dao.HibernateBaseDao;

@Repository
public class ProtectDao extends HibernateBaseDao<TProtect> implements IProtectDao{

	@Override
	public Class<TProtect> getEntityClass() {
		return TProtect.class;
	}

}
