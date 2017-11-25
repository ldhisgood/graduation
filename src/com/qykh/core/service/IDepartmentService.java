package com.qykh.core.service;


import com.qykh.core.domain.TDepartment;
import com.qykh.frame.service.IBaseService;

public interface IDepartmentService extends IBaseService<TDepartment>{
	public TDepartment queryByNum(String num);
}
