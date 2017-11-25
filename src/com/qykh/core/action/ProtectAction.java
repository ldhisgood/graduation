package com.qykh.core.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TProtect;
import com.qykh.core.service.IProtectService;
import com.qykh.frame.page.PageTion;
@RequestMapping("/protect")
@Controller
public class ProtectAction {
	@Autowired
	private IProtectService service;

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
	public void save(TProtect bean) {
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		service.delete(service.queryById(id));
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TProtect bean){
		TProtect temp = service.queryById(bean.getId());
		temp.setMan(bean.getMan());
		temp.setDotime(bean.getDotime());
		temp.setState(bean.getState());
		temp.setPlannum(bean.getPlannum());
		temp.setStandard(bean.getStandard());
		temp.setInfo(bean.getInfo());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TProtect temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "protect/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "protect/save";
	}
	@RequestMapping("/Go.do")
	public String show(Model model){
		return "protect/list";
	}
	@RequestMapping("/GoDetail.do")
	public String detail(Model model,int id){
		TProtect queryById = service.queryById(id);
		model.addAttribute("bean", queryById);
		return "protect/detail";
	}
}
