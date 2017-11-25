package com.qykh.core.quartz;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;


import com.qykh.core.domain.TMaintainorder;
import com.qykh.core.domain.TMaintainplan;
import com.qykh.core.service.IMaintainorderService;
import com.qykh.core.service.IMaintainplanService;
import com.qykh.core.service.ISerialnumService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
import com.qykh.frame.util.Convert;
import com.qykh.frame.util.DateUtil;

public class MakerOrder implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IMaintainorderService orderService;
	private IMaintainplanService planService;
	private ISerialnumService numService;
	
	public void make(){
		Date date = DateUtil.dayDate();
		Paramter paramter = new Paramter();
		paramter.addCondition("dotime", date);
		PageTion pa = planService.listByPage(1, 10000, paramter);
		List<?> list = pa.getList();
		for(Object obj : list){
			TMaintainplan plan = (TMaintainplan) obj;
			TMaintainorder order = new TMaintainorder();
			try {
				Map<String, Object> beantoMap = Convert.BeantoMap(plan);
				Object mapToBean = Convert.mapToBean(beantoMap, order.getClass());
				order = (TMaintainorder) mapToBean;
			} catch (Exception e) {
				e.printStackTrace();
			} 
			order.setNum(numService.obtainNum("order"));
			order.setFlag("未完成");
			orderService.save(order);
		}
	}
	public void setOrderService(IMaintainorderService orderService) {
		this.orderService = orderService;
	}

	public void setPlanService(IMaintainplanService planService) {
		this.planService = planService;
	}
	public void setNumService(ISerialnumService numService) {
		this.numService = numService;
	}
	
}	
