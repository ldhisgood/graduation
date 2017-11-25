package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.ISerialnumDao;
import com.qykh.core.domain.TSerialnum;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class SerialnumDao extends HibernateBaseDao<TSerialnum> implements ISerialnumDao{

	@Override
	public Class<TSerialnum> getEntityClass() {
		return TSerialnum.class;
	}

}
