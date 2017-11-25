package com.qykh.core.action;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TEquipment;
import com.qykh.core.domain.TEquipmentcategory;
import com.qykh.core.domain.TSupplier;
import com.qykh.core.service.IEquipmentService;
import com.qykh.core.service.IEquipmentcategoryService;
import com.qykh.core.service.ISerialnumService;
import com.qykh.core.service.ISupplierService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
import com.qykh.frame.util.Convert;

@RequestMapping("/equipment")
@Controller
public class EquipmentAction {
	@Autowired
	private IEquipmentService service;
	@Autowired
	private ISerialnumService numsService;
	@Autowired
	private IEquipmentcategoryService ecService;
	@Autowired
	private ISupplierService supplierService;
	@RequestMapping("/list.do")
	@ResponseBody
	public Map<String, Object> List(int page, int rows,String key,String value) {
		//设置条件
		Map<String,Object> condition = new HashMap<String, Object>();
		condition.put(key, value);
		Paramter par = new Paramter();
		if(key!=null){
			par.setMap(condition);
		}
		PageTion data = service.listByPage(page, rows, par);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", data.getNum());
		map.put("rows", data.getList());
		return map;
	}
	
	@RequestMapping("/save.do")
	@ResponseBody
	public void save(TEquipment bean) {
		String obtainNum = numsService.obtainNum("equipment");
		//num流水号
		bean.setNum(obtainNum);
		Integer sid = bean.getSid();
		//供应商
		TSupplier one = supplierService.queryById(sid);
		bean.setSupplier(one.getName());
		Integer cid = bean.getCid();
		//设备类别
		TEquipmentcategory two = ecService.queryById(cid);
		bean.setCategory(two.getName());
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		service.delete(service.queryById(id));
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TEquipment bean){
		TEquipment temp = service.queryById(bean.getId());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TEquipment temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "equipment/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "equipment/save";
	}
	/**
	 * 到达主数据页面按部门
	 * @param model
	 * @return
	 */
	@RequestMapping("/GoBM.do")
	public String BM(Model model){
		return "equipment/listBM";
	}
	/**
	 * 到达主数据页面按状态
	 * @param model
	 * @return
	 */
	@RequestMapping("/GoZT.do")
	public String ZT(Model model){
		return "equipment/listZT";
	}
	/**
	 * 到达主数据页面按類型
	 * @param model
	 * @return
	 */
	@RequestMapping("/GoLX.do")
	public String LX(Model model){
		return "equipment/listLX";
	}
	@RequestMapping("/queryByNum.do")
	@ResponseBody
	public TEquipment queryByNum(String num){
		return service.queryByNum(num);
	}
	/**
	 * 到达条件查询页面
	 * @return
	 */
	@RequestMapping("/condition.do")
	public String goCondtion(Model model){
		return "equipment/condition";
	}
	/**
	 * 执行请求条件
	 * @return
	 */
	@RequestMapping("/conditionQuery.do")
	public String condition(TEquipment bean,Model model){
		System.out.println("======================>"+bean.getName());
		model.addAttribute("bean", bean);
		return "equipment/conditionList";
	}
	/**
	 * 按条件查询
	 * @param page
	 * @param rows
	 * @param bean
	 * @return
	 */
	@RequestMapping("/conditionList.do")
	@ResponseBody
	public Map<String, Object> conditionList(int page, int rows,TEquipment bean) {
		Paramter par = new Paramter();
		//查询条件
		System.out.println("--------->"+bean.getName());
		Map<String, Object> mapcondition = Convert.BeantoMapNotNull(bean);
		par.setMap(mapcondition);
		PageTion data = service.listByPage(page, rows, par);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", data.getNum());
		map.put("rows", data.getList());
		return map;
	}
	
}
