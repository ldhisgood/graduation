package com.qykh.core.service;

import java.util.List;

import com.qykh.core.domain.TKnowledge;
import com.qykh.frame.service.IBaseService;

public interface IKnowledgeService extends IBaseService<TKnowledge>{
	
	public TKnowledge save1(TKnowledge bean);
	
	public List<TKnowledge> search(String filename);
}
