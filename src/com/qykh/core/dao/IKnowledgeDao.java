package com.qykh.core.dao;

import java.util.List;

import com.qykh.core.domain.TKnowledge;
import com.qykh.frame.dao.IBaseDao;

public interface IKnowledgeDao extends IBaseDao<TKnowledge>{
	
	public TKnowledge save1(TKnowledge bean);
	
	public List<TKnowledge> search(String filename);
}
