package com.qykh.core.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IReportDao;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class ReportDao extends HibernateBaseDao<Object> implements IReportDao{

	@Override
	public List<?> queryStandingByMonth() {
		Query namedQuery = getSession().getNamedQuery("queryPlaM");
		return namedQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
	}

	@Override
	public Class<Object> getEntityClass() {
		return Object.class;
	}
	
}
