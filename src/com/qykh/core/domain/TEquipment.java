package com.qykh.core.domain;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


/**
 * TEquipment entity. @author	刘东赫
 */
@Entity
@Table(name = "t_equipment")
public class TEquipment implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private String num;
	private String unit;
	private Integer cid;
	private String category;
	private String creater;
	private Integer sid;
	private String supplier;
	private String flag;
	private Date intime;
	private String certifier;
	private String deperction;
	private Double perPrice;
	private Integer rate;
	private String checkRound;
	private Date preCheck;
	private Date nextCheck;
	private Date preMaintain;
	private String useStatus;
	private Integer did;
	private String dname;
	private String operator;
	private String place;
	private String ext1;
	private String ext7;
	private String ext2;
	private String ext3;
	private String ext4;
	private String ext5;
	private String ext6;

	// Constructors

	/** default constructor */
	public TEquipment() {
	}

	/** full constructor */
	public TEquipment(Integer id,String name,String num,String unit,Integer cid,String category,String creater,Integer sid,String supplier,String flag,Date intime,String certifier,String deperction,Double perPrice,Integer rate,String checkRound,Date preCheck,Date nextCheck,Date preMaintain,String useStatus,Integer did,String dname,String operator,String place,String ext1,String ext7,String ext2,String ext3,String ext4,String ext5,String ext6) {
		this.id = id;
		this.name = name;
		this.num = num;
		this.unit = unit;
		this.cid = cid;
		this.category = category;
		this.creater = creater;
		this.sid = sid;
		this.supplier = supplier;
		this.flag = flag;
		this.intime = intime;
		this.certifier = certifier;
		this.deperction = deperction;
		this.perPrice = perPrice;
		this.rate = rate;
		this.checkRound = checkRound;
		this.preCheck = preCheck;
		this.nextCheck = nextCheck;
		this.preMaintain = preMaintain;
		this.useStatus = useStatus;
		this.did = did;
		this.dname = dname;
		this.operator = operator;
		this.place = place;
		this.ext1 = ext1;
		this.ext7 = ext7;
		this.ext2 = ext2;
		this.ext3 = ext3;
		this.ext4 = ext4;
		this.ext5 = ext5;
		this.ext6 = ext6;

	
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

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "num")
	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Column(name = "unit")
	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Column(name = "cid")
	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	@Column(name = "category")
	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(name = "creater")
	public String getCreater() {
		return this.creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	@Column(name = "sid")
	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	@Column(name = "supplier")
	public String getSupplier() {
		return this.supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	@Column(name = "flag")
	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Column(name = "intime")
	@DateTimeFormat(pattern = "yyyy-MM-dd")  
	public Date getIntime() {
		return this.intime;
	}

	public void setIntime(Date intime) {
		this.intime = intime;
	}

	@Column(name = "certifier")
	public String getCertifier() {
		return this.certifier;
	}

	public void setCertifier(String certifier) {
		this.certifier = certifier;
	}

	@Column(name = "deperction")
	public String getDeperction() {
		return this.deperction;
	}

	public void setDeperction(String deperction) {
		this.deperction = deperction;
	}

	@Column(name = "perPrice")
	public Double getPerPrice() {
		return this.perPrice;
	}

	public void setPerPrice(Double perPrice) {
		this.perPrice = perPrice;
	}

	@Column(name = "rate")
	public Integer getRate() {
		return this.rate;
	}

	public void setRate(Integer rate) {
		this.rate = rate;
	}

	@Column(name = "checkRound")
	public String getCheckRound() {
		return this.checkRound;
	}

	public void setCheckRound(String checkRound) {
		this.checkRound = checkRound;
	}

	@Column(name = "preCheck")
	@DateTimeFormat(pattern = "yyyy-MM-dd")  
	public Date getPreCheck() {
		return this.preCheck;
	}

	public void setPreCheck(Date preCheck) {
		this.preCheck = preCheck;
	}

	@Column(name = "nextCheck")
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	public Date getNextCheck() {
		return this.nextCheck;
	}

	public void setNextCheck(Date nextCheck) {
		this.nextCheck = nextCheck;
	}

	@Column(name = "preMaintain")
	@DateTimeFormat(pattern = "yyyy-MM-dd") 
	public Date getPreMaintain() {
		return this.preMaintain;
	}

	public void setPreMaintain(Date preMaintain) {
		this.preMaintain = preMaintain;
	}

	@Column(name = "useStatus")
	public String getUseStatus() {
		return this.useStatus;
	}

	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}

	@Column(name = "did")
	public Integer getDid() {
		return this.did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	@Column(name = "dname")
	public String getDname() {
		return this.dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	@Column(name = "operator")
	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	@Column(name = "place")
	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@Column(name = "ext1")
	public String getExt1() {
		return this.ext1;
	}

	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}

	@Column(name = "ext7")
	public String getExt7() {
		return this.ext7;
	}

	public void setExt7(String ext7) {
		this.ext7 = ext7;
	}

	@Column(name = "ext2")
	public String getExt2() {
		return this.ext2;
	}

	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}

	@Column(name = "ext3")
	public String getExt3() {
		return this.ext3;
	}

	public void setExt3(String ext3) {
		this.ext3 = ext3;
	}

	@Column(name = "ext4")
	public String getExt4() {
		return this.ext4;
	}

	public void setExt4(String ext4) {
		this.ext4 = ext4;
	}

	@Column(name = "ext5")
	public String getExt5() {
		return this.ext5;
	}

	public void setExt5(String ext5) {
		this.ext5 = ext5;
	}

	@Column(name = "ext6")
	public String getExt6() {
		return this.ext6;
	}

	public void setExt6(String ext6) {
		this.ext6 = ext6;
	}

}