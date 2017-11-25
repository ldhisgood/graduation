package com.qykh.core.dao;



import java.util.List;

import com.qykh.core.domain.TRf;
import com.qykh.frame.dao.IBaseDao;

public interface IRfDao extends IBaseDao<TRf>{
	public void saveForBatch(List<TRf> list);
}
