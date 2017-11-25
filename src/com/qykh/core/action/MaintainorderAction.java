package com.qykh.core.action;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TMaintainorder;
import com.qykh.core.service.IMaintainorderService;
import com.qykh.core.service.ISerialnumService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
import com.qykh.frame.util.DateUtil;

@RequestMapping("/maintainorder")
@Controller
public class MaintainorderAction {
	@Autowired
	private IMaintainorderService service;
	@Autowired
	private ISerialnumService numservice;
	@RequestMapping("/list.do")
	@ResponseBody
	public Map<String, Object> List(int page, int rows,String condition) {
		PageTion data = null ;
		if(condition!=null){
			//查询今天的工单
			if(condition.equals("0")){
				Paramter par = new Paramter();
				par.addCondition("dotime", DateUtil.dayDate());
				data = service.listByPage(page, rows, par);
			}
		}else{
			data = service.listByPage(page, rows, null);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", data.getNum());
		map.put("rows", data.getList());
		return map;
	}
	
	@RequestMapping("/save.do")
	@ResponseBody
	public void save(TMaintainorder bean) {
		bean.setDotime(DateUtil.dayDate());
		bean.setFlag("未完成");
		bean.setNum(numservice.obtainNum("gd"));
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		service.delete(service.queryById(id));
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TMaintainorder bean){
		TMaintainorder temp = service.queryById(bean.getId());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TMaintainorder temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "maintainorder/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "maintainorder/save";
	}
	@RequestMapping("/Go.do")
	public String show(Model model){
		return "maintainorder/list";
	}
	@RequestMapping("/GoDetail.do")
	public String detail(Model model,int id){
		TMaintainorder queryById = service.queryById(id);
		model.addAttribute("bean", queryById);
		return "maintainorder/detail";
	}
}
