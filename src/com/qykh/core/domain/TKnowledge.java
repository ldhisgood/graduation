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
@Table(name = "t_knowledge")
public class TKnowledge implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String classify;
	private Date uploadDate;
	private String accessory;
	//@Transient
	private String ext1;
	private String ext2;
	private String ext3;
	private String ext4;
	private String ext5;
	private String imgs;
	private String filename;
	// Constructors

	/** default constructor */
	public TKnowledge() {
	}

	/** full constructor */
	public TKnowledge(Integer id,String classify,Date uploadDate,String imgs,String accessory,String filename,String ext1,String ext2,String ext3,String ext4,String ext5) {
		this.id = id;
		this.classify = classify;
		this.uploadDate = uploadDate;
		this.accessory = accessory;
		this.filename = filename;
		this.ext1 = ext1;
		this.ext2 = ext2;
		this.ext3 = ext3;
		this.ext4 = ext4;
		this.ext5 = ext5;
		this.imgs = imgs;

	
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

	@Column(name = "classify")
	public String getClassify() {
		return this.classify;
	}
	
	public String getImgs() {
		return imgs;
	}

	public void setImgs(String imgs) {
		this.imgs = imgs;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}

	@Column(name = "uploadDate")
	public Date getUploadDate() {
		return this.uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	@Column(name = "accessory")
	public String getAccessory() {
		return this.accessory;
	}

	public void setAccessory(String accessory) {
		this.accessory = accessory;
	}


	@Column(name = "filename")
	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
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
	/*@Column(name = "imagedefault")
	public String getImgs() {
		return imgs;
	}

	public void setImgs(String imgs) {
		this.imgs = imgs;
	}*/
	

}