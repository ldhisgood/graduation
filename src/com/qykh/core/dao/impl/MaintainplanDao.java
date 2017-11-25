package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IMaintainplanDao;
import com.qykh.core.domain.TMaintainplan;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class MaintainplanDao extends HibernateBaseDao<TMaintainplan> implements IMaintainplanDao{

	@Override
	public Class<TMaintainplan> getEntityClass() {
		return TMaintainplan.class;
	}

}
