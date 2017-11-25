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

import com.qykh.core.domain.TFunction;
import com.qykh.core.service.IFunctionService;
import com.qykh.core.service.IRfService;
import com.qykh.frame.page.Order;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;

@RequestMapping("/function")
@Controller
public class FunctionAction {
	@Autowired
	private IFunctionService service;
	@Autowired
	private IRfService iservice;
	@RequestMapping("/list.do")
	@ResponseBody
	public Map<String, Object> List(int page, int rows) {
		Paramter par = new Paramter();
		par.addOrder(new Order("fid", Order.DESC));
		PageTion data = service.listByPage(page, rows, par);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", data.getNum());
		map.put("rows", data.getList());
		return map;
	}
	
	@RequestMapping("/save.do")
	public void save(TFunction bean) {
		Integer fid = bean.getFid();
		if(fid==-1){
			bean.setExt1("根节点");
			TFunction tf = new TFunction();
			tf.setId(-1);
			bean.setParent(tf);
		}else{
			TFunction queryById = service.queryById(fid);
			bean.setExt1(queryById.getName());
			bean.setParent(queryById);
		}
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		//删除与role的关联关系
		iservice.deleteByCondition("fid", id);
		service.delete(service.queryById(id));
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TFunction bean){
		//得到父节点，如果父节点是跟节点，那么就设置fid为-1
		Integer fid = bean.getFid();
		if(fid==-1){
			bean.setExt1("根节点");
			TFunction tf = new TFunction();
			tf.setId(-1);
			bean.setParent(tf);
		}else{
			TFunction queryById = service.queryById(fid);
			bean.setExt1(queryById.getName());
			bean.setParent(queryById);
		}
		//将改变的信息复制到temp中。然后更新temp
		TFunction temp = service.queryById(bean.getId());
		temp.setExt1(bean.getExt1());
		temp.setName(bean.getName());
		temp.setParent(bean.getParent());
		temp.setHref(bean.getHref());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TFunction temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "function/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "function/save";
	}
	@RequestMapping("/Go.do")
	public String go(Model model){
		return "function/list";
	}
	@RequestMapping("/show.do")
	@ResponseBody
	public List<Map<String,Object>> show(){
		List<TFunction> list = service.list();
		List<Map<String,Object>> ret = new ArrayList<Map<String,Object>>();
		Map<String,Object> root = new HashMap<String, Object>();
		root.put("id", "-1");
		root.put("text", "根节点");
		ret.add(root);
		for(TFunction f:list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", f.getId());
			map.put("text",f.getName());
			ret.add(map);
		}
		return ret;
	}
}
