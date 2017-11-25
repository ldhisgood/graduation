package com.qykh.core.action;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TDepartment;
import com.qykh.core.domain.TRole;
import com.qykh.core.domain.TUser;
import com.qykh.core.service.IDepartmentService;
import com.qykh.core.service.IRoleService;
import com.qykh.core.service.ISerialnumService;
import com.qykh.core.service.IUserService;
import com.qykh.frame.page.PageTion;

@RequestMapping("/user")
@Controller
public class UserAction {
	@Autowired
	private IUserService service;
	@Autowired
	private ISerialnumService numService;
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IDepartmentService depService;
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
	public void save(TUser bean) {
		String obtainNum = numService.obtainNum("user");
		bean.setDel("0");
		bean.setNum(obtainNum);
		//保存角色对象
		TRole queryById = roleService.queryById(bean.getRid());
		bean.setRole(queryById);
		//设置角色名称
		bean.setExt1(queryById.getName());
		//设置部门名称
		TDepartment queryById2 = depService.queryById(bean.getDid());
		bean.setExt2(queryById2.getName());
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		service.delete(service.queryById(id));
	}
	/**
	 * 更新权限
	 * @param bean
	 */
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TUser bean){
		//保存角色对象
		TRole queryById = roleService.queryById(bean.getRid());
		TUser temp = service.queryById(bean.getId());
		temp.setRole(queryById);
		temp.setAddress(bean.getAddress());
		temp.setPhone(bean.getPhone());
		temp.setEmail(bean.getEmail());
		//设置角色名称
		temp.setExt1(queryById.getName());
		//设置部门名称
		TDepartment queryById2 = depService.queryById(bean.getDid());
		temp.setDid(bean.getDid());
		temp.setExt2(queryById2.getName());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TUser temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "user/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "user/save";
	}
	@RequestMapping("/Go.do")
	public String show(Model model){
		return "user/list";
	}
}
