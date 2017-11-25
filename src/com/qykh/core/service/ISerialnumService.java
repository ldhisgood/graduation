package com.qykh.core.service;


import com.qykh.core.domain.TSerialnum;
import com.qykh.frame.service.IBaseService;

public interface ISerialnumService extends IBaseService<TSerialnum>{
	public String obtainNum(String flag);
}
