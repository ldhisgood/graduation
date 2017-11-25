package com.qykh.core.dao.impl;


import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IFunctionDao;
import com.qykh.core.domain.TFunction;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class FunctionDao extends HibernateBaseDao<TFunction> implements IFunctionDao{

	@Override
	public Class<TFunction> getEntityClass() {
		return TFunction.class;
	}

}
