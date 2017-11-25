package com.qykh.core.action;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TMaintainplan;
import com.qykh.core.service.IMaintainplanService;
import com.qykh.frame.page.PageTion;

@RequestMapping("/maintainplan")
@Controller
public class MaintainplanAction {
	@Autowired
	private IMaintainplanService service;

	@RequestMapping("/list.do")
	@ResponseBody
	public Map<String, Object> List(int page, int rows) {
		PageTion data = service.listByPage(page, rows, null);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", data.getNum());
		map.put("rows", data.getList());
		return map;
	}
	
	@RequestMapping("/save.do")
	@ResponseBody
	public void save(TMaintainplan bean) {
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		service.delete(service.queryById(id));
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TMaintainplan bean){
		TMaintainplan temp = service.queryById(bean.getId());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TMaintainplan temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "maintainplan/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "maintainplan/save";
	}
	@RequestMapping("/Go.do")
	public String show(Model model){
		return "maintainplan/list";
	}
	@RequestMapping("/GoDetail.do")
	public String detail(Model model,int id){
		TMaintainplan queryById = service.queryById(id);
		model.addAttribute("bean", queryById);
		return "maintainplan/detail";
	}
}
