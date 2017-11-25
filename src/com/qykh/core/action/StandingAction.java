package com.qykh.core.action;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TEquipmentcategory;
import com.qykh.core.domain.TStanding;
import com.qykh.core.domain.TSupplier;
import com.qykh.core.domain.TUser;
import com.qykh.core.service.IEquipmentcategoryService;
import com.qykh.core.service.ISerialnumService;
import com.qykh.core.service.IStandingService;
import com.qykh.core.service.ISupplierService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.session.MySession;

@RequestMapping("/standing")
@Controller
public class StandingAction {
	@Autowired
	private IStandingService service;
	@Autowired
	private ISerialnumService numService;
	@Autowired
	private ISupplierService supService;
	@Autowired
	private IEquipmentcategoryService cateService;
	
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
	public void save(TStanding bean) {
		String obtainNum = numService.obtainNum("standing");
		TSupplier sup = supService.queryById(bean.getSid());
		TEquipmentcategory cate = cateService.queryById(bean.getCid());
		bean.setSupplier(sup.getName());
		bean.setCategory(cate.getName());
		bean.setNum(obtainNum);
		//下面代码为此项目的  标准设置操作人
		TUser tUser = MySession.getTUser();
		if(tUser!=null){
			bean.setOperator(tUser.getTruename());
		}
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		service.delete(service.queryById(id));
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TStanding bean){
		TStanding temp = service.queryById(bean.getId());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TStanding temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "standing/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "standing/save";
	}
	@RequestMapping("/Go.do")
	public String show(Model model){
		return "standing/list";
	}
}
