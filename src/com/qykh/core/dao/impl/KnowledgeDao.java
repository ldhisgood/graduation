package com.qykh.core.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IKnowledgeDao;
import com.qykh.core.domain.TKnowledge;
import com.qykh.frame.dao.HibernateBaseDao;

@Repository
public class KnowledgeDao extends HibernateBaseDao<TKnowledge> implements IKnowledgeDao{

	@Override
	public Class<TKnowledge> getEntityClass() {
		return TKnowledge.class;
	}
	
	@Override
	public TKnowledge save1(TKnowledge bean) {
		getSession().save(bean);
		return bean;
	}
	
	@Override
	public List<TKnowledge> search(String filename) {
		String hql ="from TKnowledge where filename like ?";
		List<TKnowledge> list = getSession().createQuery(hql)
				.setParameter(0,"%"+filename+"%")
				.list();
		return list;
	}
}
