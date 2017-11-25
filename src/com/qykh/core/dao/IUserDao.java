package com.qykh.core.dao;



import com.qykh.core.domain.TUser;
import com.qykh.frame.dao.IBaseDao;

public interface IUserDao extends IBaseDao<TUser>{
	public int checkLogin(String name,String pwd);
	public TUser queryUser(String name,String pwd);
}
