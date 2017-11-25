package com.qykh.core.service;

import java.util.List;

import com.qykh.core.domain.TRf;
import com.qykh.frame.service.IBaseService;

public interface IRfService extends IBaseService<TRf>{
	public void deleteByCondition(String key,Object value);
	
	public void saveForBatch(List<TRf> list);
}
