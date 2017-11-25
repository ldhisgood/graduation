package com.qykh.core.action;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TDepartment;
import com.qykh.core.service.IDepartmentService;
import com.qykh.core.service.ISerialnumService;
import com.qykh.frame.page.PageTion;

@RequestMapping("/department")
@Controller
public class DepartmentAction {
	@Autowired
	private IDepartmentService service;
	@Autowired
	private ISerialnumService numservice;
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
	public void save(TDepartment bean) {
		String obtainNum = numservice.obtainNum("department");
		bean.setNum(obtainNum);
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		service.delete(service.queryById(id));
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TDepartment bean){
		TDepartment temp = service.queryById(bean.getId());
		temp.setName(bean.getName());
		temp.setLevel(bean.getLevel());
		temp.setFid(bean.getFid());
		temp.setEmail(bean.getEmail());
		temp.setPhone(bean.getPhone());
		temp.setMan(bean.getMan());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TDepartment temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "department/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "department/save";
	}
	@RequestMapping("/Go.do")
	public String go(Model model){
		return "department/list";
	}
	/**
	 * 展示所有的部门；为easyUI格式
	 * @return
	 */
	@RequestMapping("/show.do")
	@ResponseBody
	public List<Map<String,Object>> show(){
		List<TDepartment> list = service.list();
		List<Map<String,Object>> ret = new ArrayList<Map<String,Object>>();
		for(TDepartment f:list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", f.getId());
			map.put("text",f.getName());
			ret.add(map);
		}
		return ret;
	}
	
}
