package com.qykh.core.dao.impl;

import org.springframework.stereotype.Repository;

import com.qykh.core.dao.IUserDao;
import com.qykh.core.domain.TUser;
import com.qykh.frame.dao.HibernateBaseDao;

@Repository
public class UserDao extends HibernateBaseDao<TUser> implements IUserDao {

	@Override
	public Class<TUser> getEntityClass() {
		return TUser.class;
	}

	@Override
	public int checkLogin(String name, String pwd) {
		String hql = "select count(*) from TUser where uname=? and pwd=?";
		Long x = (Long) getSession().createQuery(hql).setParameter(0,
				name).setParameter(1, pwd).uniqueResult();
		return (int)(long)x;
	}

	@Override
	public TUser queryUser(String name, String pwd) {
		String hql ="from TUser where uname =? and pwd =?";
		 TUser user = (TUser) getSession().createQuery(hql).setParameter(0,
					name).setParameter(1, pwd).uniqueResult();
		return user;
	}

}
