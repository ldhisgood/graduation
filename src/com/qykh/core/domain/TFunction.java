package com.qykh.core.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;


/**
 * TEquipment entity. @author 刘东赫
 */
@Entity
@Table(name = "t_function")
public class TFunction implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer fid;
	private String name;
	private String href;
	private TFunction parent;
	private String ext1;
	private String ext2;
	private Set<TFunction> set = new HashSet<TFunction>();
	private Set<TRf> roles = new HashSet<TRf>();
	// Constructors

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "fid")
	@JsonIgnore
	public Set<TRf> getRoles() {
		return roles;
	}

	public void setRoles(Set<TRf> roles) {
		this.roles = roles;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "fid")
	@JsonIgnore
	public TFunction getParent() {
		return parent;
	}

	public void setParent(TFunction parent) {
		this.parent = parent;
	}

	/** default constructor */
	public TFunction() {
	}
	/** full constructor */
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

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "href")
	public String getHref() {
		return this.href;
	}

	public void setHref(String href) {
		this.href = href;
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
	@Column(insertable=false,updatable=false)
	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}
	
	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "fid")
	@JsonIgnore
	public Set<TFunction> getSet() {
		return set;
	}

	public void setSet(Set<TFunction> set) {
		this.set = set;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		TFunction t = (TFunction)obj;
		if(t.getId()==this.getId()){
			return true;
		}
		return false ;
	}

}