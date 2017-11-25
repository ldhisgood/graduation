package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IRoleDao;
import com.qykh.core.domain.TRole;
import com.qykh.frame.dao.HibernateBaseDao;

@Repository
public class RoleDao extends HibernateBaseDao<TRole> implements IRoleDao{

	@Override
	public Class<TRole> getEntityClass() {
		return TRole.class;
	}

}
