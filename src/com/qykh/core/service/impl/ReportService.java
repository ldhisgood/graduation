package com.qykh.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qykh.core.dao.IReportDao;
import com.qykh.core.service.IReportService;
@Service
public class ReportService implements IReportService{
	@Autowired
	private IReportDao dao;
	@Override
	public List<?> queryStandingByMonth() {
		return dao.queryStandingByMonth();
	}
	
}
