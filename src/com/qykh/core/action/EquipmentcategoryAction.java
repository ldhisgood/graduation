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

import com.qykh.core.domain.TEquipmentcategory;
import com.qykh.core.service.IEquipmentcategoryService;
import com.qykh.core.service.ISerialnumService;
import com.qykh.frame.page.PageTion;

@RequestMapping("/equipmentcategory")
@Controller
public class EquipmentcategoryAction {
	@Autowired
	private IEquipmentcategoryService service;
	@Autowired
	private ISerialnumService numServise;
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
	public void save(TEquipmentcategory bean) {
		String obtainNum = numServise.obtainNum("quipcate");
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
	public void update(TEquipmentcategory bean){
		TEquipmentcategory temp = service.queryById(bean.getId());
		temp.setName(bean.getName());
		temp.setInfo(bean.getInfo());
		temp.setDel(bean.getDel());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TEquipmentcategory temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "equipmentcategory/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "equipmentcategory/save";
	}
	@RequestMapping("/Go.do")
	public String Go(Model model){
		return "equipmentcategory/list";
	}
	/**
	 * 展示所有的设备类型供选择
	 * @return
	 */
	@RequestMapping("/show.do")
	@ResponseBody
	public List<Map<String,Object>> show(){
		List<TEquipmentcategory> list = service.list();
		List<Map<String,Object>> ret = new ArrayList<Map<String,Object>>();
		for(TEquipmentcategory f:list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", f.getId());
			map.put("text",f.getName());
			ret.add(map);
		}
		return ret;
	}
}
