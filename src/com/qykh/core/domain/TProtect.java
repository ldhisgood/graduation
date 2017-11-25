package com.qykh.core.domain;
 
	import java.util.Date;

	import javax.persistence.Column;
	import javax.persistence.Entity;
	import javax.persistence.GeneratedValue;
	import javax.persistence.Id;
	import javax.persistence.Table;

	import org.hibernate.annotations.GenericGenerator;
	import org.springframework.format.annotation.DateTimeFormat;

	 
	@Entity
	@Table(name = "t_protect")
	public class TProtect implements java.io.Serializable {

		// Fields

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;
		private Integer id;
		private String mname;
		private String num;
		private String unit;
		private String dname;
		private String mlevel;
		private String method;
		private String man;
		private Date dotime;
		private String state;
		private String project;
		private String standard;
		private String plannum;
		private String info;
		private Integer eid;
		private String ext1;
		private String ext2;

		// Constructors

		/** default constructor */
		public TProtect() {
		}

		/** full constructor */
		public TProtect(Integer id,String mname,String num,String plannum,String unit,String dname,String mlevel,String method,String man,Date dotime,String state,String project,String standard,String info,Integer eid,String ext1,String ext2) {
			this.id = id;
			this.mname = mname;
			this.num = num;
			this.unit = unit;
			this.dname = dname;
			this.mlevel = mlevel;
			this.method = method;
			this.man = man;
			this.dotime = dotime;
			this.state = state;
			this.project = project;
			this.standard = standard;
			this.plannum = plannum;
			this.info = info;
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

		@Column(name = "mname")
		public String getMname() {
			return this.mname;
		}

		public void setMname(String mname) {
			this.mname = mname;
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

		@Column(name = "method")
		public String getMethod() {
			return this.method;
		}

		public void setMethod(String method) {
			this.method = method;
		}

		@Column(name = "man")
		public String getMan() {
			return this.man;
		}

		public void setMan(String man) {
			this.man = man;
		}

		@Column(name = "dotime")
		@DateTimeFormat(pattern = "yyyy-MM-dd")  
		public Date getDotime() {
			return this.dotime;
		}

		public void setDotime(Date dotime) {
			this.dotime = dotime;
		}

		@Column(name = "state")
		public String getState() {
			return this.state;
		}

		public void setState(String state) {
			this.state = state;
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

		@Column(name = "eid")
		public Integer geteid() {
			return this.eid;
		}

		public void seteid(Integer eid) {
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
		
		@Column(name = "plannum")
		public String getPlannum() {
			return this.plannum;
		}

		public void setPlannum(String plannum) {
			this.plannum = plannum;
		}
	}

