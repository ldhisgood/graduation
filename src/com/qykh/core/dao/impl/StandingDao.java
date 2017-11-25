package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IStandingDao;
import com.qykh.core.domain.TStanding;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class StandingDao extends HibernateBaseDao<TStanding> implements IStandingDao{

	@Override
	public Class<TStanding> getEntityClass() {
		return TStanding.class;
	}

}
