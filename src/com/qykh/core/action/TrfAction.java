package com.qykh.core.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qykh.core.domain.TFunction;
import com.qykh.core.domain.TRf;
import com.qykh.core.domain.TRole;
import com.qykh.core.service.IFunctionService;
import com.qykh.core.service.IRoleService;
import com.qykh.core.service.impl.RfService;

@RequestMapping("/trf")
@Controller
public class TrfAction {
	@Autowired
	private RfService service;
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IFunctionService funService;
	@RequestMapping("/save.do")
	@ResponseBody
	public void save(int rid ,String fids){
		String[] fidz = fids.split(",");
		service.deleteByCondition("rid", rid);
		List<TRf> list = new ArrayList<TRf>();
		for(int i=0;i<fidz.length;i++ ){
			TRole role = roleService.queryById(rid);
			TFunction tf = funService.queryById(Integer.parseInt(fidz[i]));
			TRf trf = new TRf();
			trf.setRole(role);
			trf.setFunction(tf);
			list.add(trf);
		}
		service.saveForBatch(list);
	}
}
