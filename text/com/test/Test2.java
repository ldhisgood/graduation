package com.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.qykh.core.action.SystemAction;
import com.qykh.core.domain.TFunction;
import com.qykh.core.domain.TRf;
import com.qykh.core.domain.TRole;
import com.qykh.core.domain.TUser;
import com.qykh.core.service.IFunctionService;
import com.qykh.core.service.IRfService;
import com.qykh.core.service.IRoleService;
import com.qykh.core.service.ISerialnumService;
import com.qykh.core.service.ISystem;
import com.qykh.core.service.IUserService;



@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations={"classpath:config/applicationContext.xml"})
public class Test2 {
	@Autowired
	IFunctionService service;
	@Autowired
	IRoleService rservice;
	@Autowired
	IRfService rfservice;
	@Autowired
	IUserService userservice;
	@Autowired
	ISerialnumService service3;
	@Autowired
	private IRfService service4;
	
	@Autowired
	private SystemAction action;
	@Test
	public void ssss(){
//		TRole role = rservice.queryById(1);
//		TFunction f1 = service.queryById(2);
//		TFunction f2 = service.queryById(3);
//		
//		TRf trf = new TRf();
//		trf.setRole(role);
//		trf.setFunction(f1);
//		trf.setFunction(f2);
//		rfservice.save(trf);
//		TUser user = new TUser();
//		user.setRole(rservice.queryById(1));
//		userservice.save(user);
//		rservice.delete(role);
		String obtainNum = service3.obtainNum("xxx");
		System.out.println(obtainNum);
//		System.out.println(obtainNum);
		
//		service4.deleteByCondition("rid", 1);
//		action.left();
	}
	
}
