package com.qykh.core.domain;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * TEquipment entity. @author	刘东赫
 */
@Entity
@Table(name = "t_rf")
public class TRf implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer rid;
	private Integer fid;
	private TRole role;
	private TFunction function;
	

	// Constructors
	@ManyToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="rid")
	public TRole getRole() {
		return role;
	}

	public void setRole(TRole role) {
		this.role = role;
	}
	@ManyToOne(fetch=FetchType.LAZY,cascade=CascadeType.ALL)
	@JoinColumn(name="fid")
	public TFunction getFunction() {
		return function;
	}

	public void setFunction(TFunction function) {
		this.function = function;
	}

	/** default constructor */
	public TRf() {
	}

	/** full constructor */
	public TRf(Integer id,Integer rid,Integer fid) {
		this.id = id;
		this.rid = rid;
		this.fid = fid;

	
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

	@Transient
	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	@Transient
	public Integer getFid() {
		return this.fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

}