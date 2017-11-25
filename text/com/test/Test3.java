package com.test;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.qykh.core.domain.TUser;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations={"classpath:config/applicationContext.xml"})
public class Test3 {
	@Autowired
	SessionFactory factory;
	@Test
	public void test(){
		Session openSession = factory.openSession();
		Transaction beginTransaction = openSession.beginTransaction();
		beginTransaction.begin();
		TUser load = (TUser) openSession.load(TUser.class, 1);
		beginTransaction.commit();
		System.out.println(load.getUname());
		
	}
}
