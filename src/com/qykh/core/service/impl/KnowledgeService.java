package com.qykh.core.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.IKnowledgeDao;
import com.qykh.core.domain.TKnowledge;
import com.qykh.core.service.IKnowledgeService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
@Service
@Transactional
public class KnowledgeService implements IKnowledgeService{
	@Autowired
	private IKnowledgeDao dao ;
	@Override
	public void delete(TKnowledge t) {
		dao.delete(t);
	}

	@Override
	public List<TKnowledge> list() {
		return dao.list();
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TKnowledge> queryByCondition(TKnowledge t) {
		return null;
	}

	@Override
	public TKnowledge queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TKnowledge t) {
		dao.save(t);
	}

	@Override
	public void update(TKnowledge t) {
		dao.update(t);
	}

	@Override
	public TKnowledge save1(TKnowledge bean) {
		TKnowledge bean1 = dao.save1(bean);
		return bean1;
	}

	@Override
	public List<TKnowledge> search(String filename) {
		List<TKnowledge> list = dao.search(filename);
		return list;
	}

}
