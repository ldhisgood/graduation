package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IMaintainorderDao;
import com.qykh.core.domain.TMaintainorder;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class MaintainorderDao extends HibernateBaseDao<TMaintainorder> implements IMaintainorderDao{

	@Override
	public Class<TMaintainorder> getEntityClass() {
		return TMaintainorder.class;
	}

}
