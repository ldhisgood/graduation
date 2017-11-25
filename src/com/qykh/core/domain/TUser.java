package com.qykh.core.domain;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

/**
 * TEquipment entity. @author	刘东赫
 */
@Entity
@Table(name = "t_user")
public class TUser implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String num;
	private String uname;
	private String pwd;
	private String truename;
	private String sex;
	private String phone;
	private String email;
	private String address;
	private String flag;
	private Integer rid;
	private Integer did;
	private String del;
	private String ext1;
	//部门名称
	private String ext2;
	private TRole role;
	// Constructors

	/** default constructor */
	public TUser() {
	}

	/** full constructor */
	public TUser(Integer id,String num,String uname,String pwd,String truename,String sex,String phone,String email,String address,String flag,Integer rid,Integer did,String del,String ext1,String ext2) {
		this.id = id;
		this.num = num;
		this.uname = uname;
		this.pwd = pwd;
		this.truename = truename;
		this.sex = sex;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.flag = flag;
		this.rid = rid;
		this.did = did;
		this.del = del;
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
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="rid")
	@JsonIgnore
	public TRole getRole() {
		return role;
	}

	public void setRole(TRole role) {
		this.role = role;
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

	@Column(name = "uname")
	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Column(name = "pwd")
	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Column(name = "truename")
	public String getTruename() {
		return this.truename;
	}

	public void setTruename(String truename) {
		this.truename = truename;
	}

	@Column(name = "sex")
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
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

	@Column(name = "address")
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "flag")
	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	@Column(name="rid",insertable=false,updatable=false)
	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	@Column(name = "did")
	public Integer getDid() {
		return this.did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	@Column(name = "del")
	public String getDel() {
		return this.del;
	}

	public void setDel(String del) {
		this.del = del;
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