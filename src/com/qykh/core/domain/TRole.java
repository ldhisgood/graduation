package com.qykh.core.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

/**
 * TEquipment entity. @author 刘东赫
 */
@Entity
@Table(name = "t_role")
public class TRole implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String num;
	private String name;
	private Integer rank;
	private String del;
	private String ext1;
	private String ext2;
	private Set<TUser> user = new HashSet<TUser>();
	private Set<TRf> functions = new HashSet<TRf>(); 
	
	
	
	
	
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "rid")
	@JsonIgnore
	public Set<TRf> getFunctions() {
		return functions;
	}

	public void setFunctions(Set<TRf> functions) {
		this.functions = functions;
	}

	// Constructors
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "rid")
	@JsonIgnore
	public Set<TUser> getUser() {
		return user;
	}

	public void setUser(Set<TUser> user) {
		this.user = user;
	}

	/** default constructor */
	public TRole() {
	}

	/** full constructor */
	public TRole(Integer id, String num, String name, Integer rank, String del,
			String ext1, String ext2) {
		this.id = id;
		this.num = num;
		this.name = name;
		this.rank = rank;
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

	@Column(name = "rank")
	public Integer getRank() {
		return this.rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
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