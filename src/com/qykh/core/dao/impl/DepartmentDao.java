package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IDepartmentDao;
import com.qykh.core.domain.TDepartment;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class DepartmentDao extends HibernateBaseDao<TDepartment> implements IDepartmentDao{

	@Override
	public Class<TDepartment> getEntityClass() {
		return TDepartment.class;
	}

}
