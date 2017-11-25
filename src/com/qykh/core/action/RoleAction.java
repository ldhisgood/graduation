package com.qykh.core.action;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TFunction;
import com.qykh.core.domain.TRf;
import com.qykh.core.domain.TRole;
import com.qykh.core.service.IFunctionService;
import com.qykh.core.service.IRoleService;
import com.qykh.core.service.ISerialnumService;
import com.qykh.frame.page.PageTion;

@RequestMapping("/role")
@Controller
public class RoleAction {
	@Autowired
	private IRoleService service;
	@Autowired
	private ISerialnumService numService;
	@Autowired
	private IFunctionService funService;
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
	public void save(TRole bean) {
		String obtainNum = numService.obtainNum("role");
		bean.setNum(obtainNum);
		bean.setDel("0");
		service.save(bean);
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		System.out.println("-------------->"+id);
		TRole queryById = service.queryById(id);
		service.delete(queryById);
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TRole bean){
		TRole temp = service.queryById(bean.getId());
		temp.setName(bean.getName());
		temp.setExt1(bean.getExt1());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TRole temp = service.queryById(id);
		model.addAttribute("bean",temp );
		return "role/edit";
	}
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "role/save";
	}
	@RequestMapping("/Go.do")
	public String go(Model model){
		return "role/list";
	}
	/**
	 * 到达选择功能页面。显示已选择，和未选择的功能
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/GoChooseFunction.do")
	public String goChoose(Model model,int id){
		//得到role对象
		TRole one = service.queryById(id);
		//得到当前role对应的功能中间表
		Set<TRf> functions = one.getFunctions();
		//得到role对应的功能对象
		List<TFunction> selected = new ArrayList<TFunction>();
		for(TRf tf:functions){
			TFunction temp = tf.getFunction();
			selected.add(temp);
		}
		//所有的列表
		List<TFunction> list = funService.list();
		List<TFunction> unlist = new ArrayList<TFunction>();
		for(int i = 0 ;i<list.size();i++){
			TFunction f = list.get(i);
			//包含选中的功能
			int indexOf = selected.indexOf(f);
			if(indexOf >-1){
				continue;
			}
			unlist.add(f);
		}
		model.addAttribute("list", selected);
		model.addAttribute("unlist", unlist);
		model.addAttribute("rid",id );
		return "role/chooseFunction";
	}
	/**
	 * 展示所有的角色供选择
	 * @return
	 */
	@RequestMapping("/show.do")
	@ResponseBody
	public List<Map<String,Object>> show(){
		List<TRole> list = service.list();
		List<Map<String,Object>> ret = new ArrayList<Map<String,Object>>();
		for(TRole f:list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id", f.getId());
			map.put("text",f.getName());
			ret.add(map);
		}
		return ret;
	}
}
