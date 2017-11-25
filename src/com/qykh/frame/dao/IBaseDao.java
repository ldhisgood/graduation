package com.qykh.frame.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;

public interface  IBaseDao<T> {
	/**
	 * 分页查询
	 * @param pageNo
	 * @param pageSize
	 * @param par
	 */
	public PageTion listByPage(int pageNo,int pageSize ,Paramter par);
	/**
	 * 查询所有
	 */
	public List<T> list();
	/**
	 * 保存
	 * @param t
	 */
	public void save(T t);
	/**
	 * 更新
	 * @param t
	 */
	public void update(T t);
	/**
	 * 删除
	 * @param t
	 */
	public void delete(T t);
	/**
	 * 根据id进行查询
	 * @param id
	 */
	public T queryById(Serializable id);
	/**
	 * 按条件查询，如果条件不为null，那么就根据条件查询，但是不包括id字段
	 * @param t
	 */
	public List<T> queryByCondition(T t);
	
	/**
	 * 根据一个条件进行查询
	 * @param key
	 * @param value
	 * @return
	 */
	public List<T> queryByCondition(String key ,Object value);
	
	/**
	 * 由sql进行查询
	 * @param sql
	 * @return
	 */
	public List<Map<String,Object>> queryBySql(String sql);
	/**
	 * 根据条件查询出一条
	 */
	public T queryOneByCondition(String key,Object value);
	/**
	 * 保存或更新
	 */
	public void saveOrUpdate(T t);
	/**
	 * 按条件删除
	 */
	public void deleteByCondition(String key,Object value);
	/**
	 * 安多条件删除
	 */
	public void deleteByConditions(Map<String,Object> map);
	
}
