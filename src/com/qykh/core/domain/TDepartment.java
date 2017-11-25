package com.qykh.core.domain;


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
@Table(name = "t_department")
public class TDepartment implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String num;
	private String name;
	private Integer fid;
	private String jc;
	private String man;
	private String phone;
	private String email;
	private String info;
	private String ext1;
	private String ext2;
	private String level;
	private String del;

	// Constructors

	/** default constructor */
	public TDepartment() {
	}

	/** full constructor */
	public TDepartment(Integer id,String num,String name,Integer fid,String jc,String man,String phone,String email,String info,String ext1,String ext2,String level,String del) {
		this.id = id;
		this.num = num;
		this.name = name;
		this.fid = fid;
		this.jc = jc;
		this.man = man;
		this.phone = phone;
		this.email = email;
		this.info = info;
		this.ext1 = ext1;
		this.ext2 = ext2;
		this.level = level;
		this.del = del;

	
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

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "fid")
	public Integer getFid() {
		return this.fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	@Column(name = "jc")
	public String getJc() {
		return this.jc;
	}

	public void setJc(String jc) {
		this.jc = jc;
	}

	@Column(name = "man")
	public String getMan() {
		return this.man;
	}

	public void setMan(String man) {
		this.man = man;
	}

	@Column(name = "phone")
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "email")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "info")
	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
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

	@Column(name = "level")
	public String getLevel() {
		return this.level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@Column(name = "del")
	public String getDel() {
		return this.del;
	}

	public void setDel(String del) {
		this.del = del;
	}

}