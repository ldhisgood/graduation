package com.qykh.core.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.service.IReportService;
@Controller
@RequestMapping("/report")
public class ReportAction {
	@Autowired
	private IReportService service;
	
	@RequestMapping("/queryMonth.do")
	@ResponseBody
	public List<?> queryByMonth(){
		List<?> list = service.queryStandingByMonth();
		List<Object> retVal = new ArrayList<Object>();
		//总价值
		double[] zjs = new double[12];
		//数量
		double[] sls = new double[12];
		//平均值
		double[] pjs = new double[12];
		for(Object obj : list){
			Map<?,?> map = (Map<?, ?>) obj;
			int index = new Integer(map.get("rq")+"");
			zjs[index]= Double.valueOf(map.get("zj")+"");
			sls[index]= Double.valueOf(map.get("sl")+"");
			pjs[index]= Double.valueOf(map.get("pj")+"");
		}
		Map<String,Object> one = new HashMap<String,Object>();
		Map<String,Object> two = new HashMap<String,Object>();
		Map<String,Object> three = new HashMap<String,Object>();
		one.put("name","设备总价值");
		one.put("data",zjs);
		two.put("name", "买进设备数");
		two.put("data", sls);
		three.put("name","月进设备平均价格");
		three.put("data",pjs);
		retVal.add(one);
//		retVal.add(two);
		retVal.add(three);
		return retVal;
	}
	@RequestMapping("/queryCount.do")
	@ResponseBody
	public List<?> queryByCount(){
		List<?> list = service.queryStandingByMonth();
		List<Object> retVal = new ArrayList<Object>();
		//数量
		double[] sls = new double[12];
		for(Object obj : list){
			Map<?,?> map = (Map<?, ?>) obj;
			int index = new Integer(map.get("rq")+"");
			sls[index]= Double.valueOf(map.get("sl")+"");
		}
		Map<String,Object> two = new HashMap<String,Object>();
		two.put("name", "买进设备数");
		two.put("data", sls);
		retVal.add(two);
		return retVal;
	}
	@RequestMapping("/goStandingMonth.do")
	public String goStandingMonth(){
		return "report/standingMonth";
	}
	@RequestMapping("/goStandingCount.do")
	public String goStandingCount(){
		return "report/standingCount";
	}
}
