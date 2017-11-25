package com.qykh.core.domain;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * TEquipment entity. @author	刘东赫
 */
@Entity
@Table(name = "t_maintainorder")
public class TMaintainorder implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String num;
	private String mname;
	private String dnum;
	private String unit;
	private String dname;
	private String mlevel;
	private String man;
	private Date dotime;
	private String project;
	private String standard;
	private String info;
	private String flag;
	private Integer eid;
	private String ext1;
	private String ext2;

	// Constructors

	/** default constructor */
	public TMaintainorder() {
	}

	/** full constructor */
	public TMaintainorder(Integer id,String num,String mname,String dnum,String unit,String dname,String mlevel,String man,Date dotime,String project,String standard,String info,String flag,Integer eid,String ext1,String ext2) {
		this.id = id;
		this.num = num;
		this.mname = mname;
		this.dnum = dnum;
		this.unit = unit;
		this.dname = dname;
		this.mlevel = mlevel;
		this.man = man;
		this.dotime = dotime;
		this.project = project;
		this.standard = standard;
		this.info = info;
		this.flag = flag;
		this.eid = eid;
		this.ext1 = ext1;
		this.ext2 = ext2;

	
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "num")
	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Column(name = "mname")
	public String getMname() {
		return this.mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	@Column(name = "dnum")
	public String getDnum() {
		return this.dnum;
	}

	public void setDnum(String dnum) {
		this.dnum = dnum;
	}

	@Column(name = "unit")
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "dname")
	public String getDname() {
		return this.dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	@Column(name = "mlevel")
	public String getMlevel() {
		return this.mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	@Column(name = "man")
	public String getMan() {
		return this.man;
	}

	public void setMan(String man) {
		this.man = man;
	}

	@Column(name = "dotime")
	public Date getDotime() {
		return this.dotime;
	}

	public void setDotime(Date dotime) {
		this.dotime = dotime;
	}

	@Column(name = "project")
	public String getProject() {
		return this.project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	@Column(name = "standard")
	public String getStandard() {
		return this.standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	@Column(name = "info")
	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	@Column(name = "flag")
	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Column(name = "eid")
	public Integer getEid() {
		return this.eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	@Column(name = "ext1")
	public String getExt1() {
		return this.ext1;
	}

	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}

	@Column(name = "ext2")
	public String getExt2() {
		return this.ext2;
	}

	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}

}