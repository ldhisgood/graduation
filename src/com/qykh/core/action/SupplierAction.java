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

import com.qykh.core.domain.TSupplier;
import com.qykh.core.service.ISupplierService;
import com.qykh.frame.page.PageTion;

@RequestMapping("/supplier")
@Controller
public class SupplierAction {
	@Autowired
	private ISupplierService service;

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
	public void save(TSupplier bean) {
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		service.delete(service.queryById(id));
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TSupplier bean){
		TSupplier temp = service.queryById(bean.getId());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TSupplier temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "supplier/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "supplier/save";
	}
	@RequestMapping("/Go.do")
	public String show(Model model){
		return "supplier/list";
	}
	/**
	 * 展示所有的供应商供选择
	 * @return
	 */
	@RequestMapping("/show.do")
	@ResponseBody
	public List<Map<String,Object>> show(){
		List<TSupplier> list = service.list();
		List<Map<String,Object>> ret = new ArrayList<Map<String,Object>>();
		for(TSupplier f:list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", f.getId());
			map.put("text",f.getName());
			ret.add(map);
		}
		return ret;
	}
}
