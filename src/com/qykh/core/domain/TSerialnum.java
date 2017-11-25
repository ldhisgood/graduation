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
@Table(name = "t_serialnum")
public class TSerialnum implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String flag;
	private Integer num;
	private String stime;

	// Constructors

	/** default constructor */
	public TSerialnum() {
	}

	/** full constructor */
	public TSerialnum(Integer id,String flag,Integer num,String stime) {
		this.id = id;
		this.flag = flag;
		this.num = num;
		this.stime = stime;

	
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

	@Column(name = "flag")
	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Column(name = "num")
	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	@Column(name = "stime")
	public String getStime() {
		return this.stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

}