package com.qykh.core.dao.impl;


import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IRfDao;
import com.qykh.core.domain.TRf;
import com.qykh.frame.dao.HibernateBaseDao;
@Repository
public class RfDao extends HibernateBaseDao<TRf> implements IRfDao{

	@Override
	public Class<TRf> getEntityClass() {
		return TRf.class;
	}

	@Override
	public void saveForBatch(List<TRf> list) {
		Session session = getSession();
		for(int i=0;i<list.size();i++){
			TRf tf = list.get(i);
			session.save(tf);
			if(i%50==0)
				session.flush();
		}
	}

}
