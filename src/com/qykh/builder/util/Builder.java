package com.qykh.builder.util;

import java.io.File;

import com.qykh.builder.domain.Table;


public class Builder {
	
	public void buildAll(String tableName){
		Table table = TableFactory.build(tableName);
		String fileName = TableFactory.makerName(tableName);
		String path = "c://";
		String pagePath = path+"a/page";
		String IdaoPath = path+"a/dao";
		String daoPath = path+"a/dao/impl";
		String IservciePath = path+"a/service";
		String servciePath = path+"a/service/impl";
		String actionPath = path+"a/action";
		String domainPath = path+"a/domain";
		//生成到文件
		File daoDir= new File(daoPath);
		File idaoDir= new File(IdaoPath);
		File serviceDir = new File(IservciePath);
		File iserviceDir = new File(servciePath);
		File actionDir = new File(actionPath);
		File domainDir = new File(domainPath);
		File pageDir = new File(pagePath);
		//1.生成文件夹
		daoDir.mkdirs();
		idaoDir.mkdirs();
		serviceDir.mkdirs();
		iserviceDir.mkdirs();
		actionDir.mkdirs();
		domainDir.mkdirs();
		pageDir.mkdirs();
		//2.生成到domian
		StringBuilder makeEntity = Load.makeEntity(table);
		FileUtil.out(domainPath, fileName+".java", makeEntity);
		//3.生成dao
		StringBuilder makeDao = Load.makeDao(table);
		StringBuilder makeDaoI = Load.makeDaoInterface(table);
		String className = fileName.substring(1);
		FileUtil.out(daoPath, className+"Dao.java", makeDao);
		FileUtil.out(IdaoPath, "I"+className+"Dao.java", makeDaoI);
		//4.生成service 
		StringBuilder makeService = Load.makeService(table);
		StringBuilder makeServiceI = Load.makeServiceInterface(table);
		FileUtil.out(servciePath, className+"Service.java", makeService);
		FileUtil.out(IservciePath, "I"+className+"Service.java", makeServiceI);
		//5.生成action 
		StringBuilder makeAction = Load.makeAction(table);
		FileUtil.out(actionPath, className+"Action.java", makeAction);
		//5.生成page
		StringBuilder list = Load.makeListPage(table);
		StringBuilder save = Load.makeSavePage(table);
		StringBuilder edit = Load.makeEditPage(table);
		FileUtil.out(pagePath, "list.jsp", list);
		FileUtil.out(pagePath, "save.jsp", save);
		FileUtil.out(pagePath, "edit.jsp", edit);
	}
	public static void main(String[] args) {
		new Builder().buildAll("t_standing");
	}
}
