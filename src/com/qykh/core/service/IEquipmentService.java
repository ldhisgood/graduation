package com.qykh.core.service;


import com.qykh.core.domain.TEquipment;
import com.qykh.frame.service.IBaseService;

public interface IEquipmentService extends IBaseService<TEquipment>{
		TEquipment queryByNum(String num);
 }
