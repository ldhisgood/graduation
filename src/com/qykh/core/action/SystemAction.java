package com.qykh.core.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TFunction;
import com.qykh.core.domain.TRf;
import com.qykh.core.domain.TRole;
import com.qykh.core.domain.TUser;
import com.qykh.core.service.IRoleService;
import com.qykh.core.service.ISystem;
import com.qykh.frame.session.MySession;

@Controller
@RequestMapping("/system")
public class SystemAction {
	@Autowired
	private ISystem service;
	@Autowired
	private IRoleService roleService;

	@RequestMapping("/login.do")
	public String login(Model model) {
		return "system/login";
	}

	/**
	 * 检查账号密码是否正确
	 * 
	 * @param model
	 * @param name
	 * @param pwd
	 * @param request
	 * @return
	 */
	@RequestMapping("/checkLogin")
	@ResponseBody
	public String checkLogin(Model model, String name, String pwd,
			HttpServletRequest request) {
		int checkLogin = service.checkLogin(name, pwd);
		if (checkLogin > 0) {
			TUser user = service.queryUser(name, pwd);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			MySession.setSession(session);
			return "1";
		}
		return "0";
	}
	@RequestMapping("/exit.do")
	public String exit(){
		HttpSession session = MySession.getSession();
		session.removeAttribute("user");
		MySession.setSession(null);
		return "system/exit";
	}
	/**
	 * 到达top页面，同时显示谁登录
	 */
	@RequestMapping("top.do")
	public String top(Model model){
		TUser attribute = (TUser) MySession.getSession().getAttribute("user");
		model.addAttribute("name", attribute.getTruename());
		return "top";
	}
	/**
	 * 左侧菜单树自动生成
	 * 
	 * @return
	 */
	@RequestMapping("left.do")
	public String left() {
		return "left1";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("leftGo.do")
	@ResponseBody
	public List leftGo() {
		HttpSession session = MySession.getSession();
		TUser user = (TUser) session.getAttribute("user");
		Integer rid = user.getRid();
		if (rid == null)
			return new ArrayList();
		TRole one = roleService.queryById(rid);
		Set<TRf> functions = one.getFunctions();

		List array = new ArrayList();
		for (TRf trf : functions) {
			TFunction function = trf.getFunction();
			array.add(function);
		}
		// 数据结构的结果
		List zz = zz(array, -1);
		List retVal = toEasyUI(zz);
		mySort(retVal);
		return retVal;
	}
	/**
	 * 对列表进行排序
	 * @param lst
	 */
	@SuppressWarnings("unchecked")
	private void mySort(List lst){
		for(Object obj:lst){
			Map map = (Map) obj;
			Object children = map.get("children");
			if(children!=null){
				List clist = (List) children;
				mySort(clist);
			}
		}
		Collections.sort(lst, new Comparator() {
			@Override
			public int compare(Object o1, Object o2) {
				Map map1 = (Map) o1;
				Map map2 = (Map) o2;
				String str1 = (String) map1.get("sort");
				String str2 = (String) map2.get("sort");
				int a = 0;
				int b = 0;
				try {
					a = Integer.parseInt(str1);
					b = Integer.parseInt(str2);
				} catch (Exception e) {
					System.out.println("左菜单没有设置功能位置");
				}
				return a - b;
			}
		});
	}
	/**
	 * 根据元数据生成，list套map的数据结构
	 * 
	 * @param ysj
	 * @param fid
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private List zz(List ysj, int fid) {
		List retVal = new ArrayList();
		for (Object obj : ysj) {
			TFunction tf = (TFunction) obj;
			if (tf.getFid() == fid) {
				Map map = new HashMap();
				List zz = zz(ysj, tf.getId());
				// key值是对象，value 是list集合
				map.put(tf, zz);
				retVal.add(map);
			}
		}
		return retVal;
	}

	@SuppressWarnings("unchecked")
	private List toEasyUI(List zz) {
		return createNode(zz);
	}

	@SuppressWarnings("unchecked")
	private List createNode(List zz) {
		if (zz.size() == 0) {
			return null;
		}
		List retVal = new ArrayList();
		for (Object obj : zz) {
			// element
			Map map = (Map) obj;
			for (Object _en : map.entrySet()) {
				Map.Entry en = (Map.Entry) _en;
				List value = (List) en.getValue();
				TFunction key = (TFunction) en.getKey();
				// 节点
				Map node = new HashMap();
				node.put("id", key.getId());
				node.put("text", key.getName());
				// 列表位置
				node.put("sort", key.getExt2());
				if (value.size() == 0) {
					node.put("href", key.getHref());
				} else {
					List cnode = createNode(value);
					if (cnode != null) {
						node.put("children", cnode);
					}
				}
				retVal.add(node);
			}
		}
		return retVal;
	}
	
}
