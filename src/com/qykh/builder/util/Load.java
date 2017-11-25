package com.qykh.builder.util;

import java.util.List;

import com.qykh.builder.domain.Column;
import com.qykh.builder.domain.Table;

/**
 * 进行字符串拼接的类
 * 
 * 
 * */
public class Load {
	/**
	 * 制作dao.java文件
	 */
	public static StringBuilder makeDaoOld(Table table) {
		StringBuilder sb = new StringBuilder();
		sb.append("package com.ldh.dao;\n");
		sb.append("\n");
		sb.append("import java.util.List;\n");
		sb.append("\n");
		sb.append("import org.hibernate.Session;\n");
		sb.append("import org.hibernate.SessionFactory;\n");
		sb
				.append("import org.springframework.beans.factory.annotation.Autowired;\n");
		sb.append("import org.springframework.stereotype.Repository;\n");
		sb.append("\n");
		sb.append("import com.ldh.domain." + table.getTableName() + ";\n");
		sb.append("\n");
		sb.append("@Repository\n");
		sb.append("public class " + table.getTableName()
				+ "Dao implements IDao<" + table.getTableName() + "> {\n");
		sb.append("	@Autowired\n");
		sb.append("	private SessionFactory factory;\n");
		sb.append("\n");
		sb.append("	public void setFactory(SessionFactory factory) {\n");
		sb.append("		this.factory = factory;\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	private Session getSession() {\n");
		sb.append("		return factory.getCurrentSession();\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	@SuppressWarnings(\"unchecked\")\n");
		sb.append("	public List<" + table.getTableName()
				+ "> show(int page, int rows) {\n");
		sb.append("		return (List<" + table.getTableName()
				+ ">) getSession().createQuery(\"from " + table.getTableName()
				+ "\").setFirstResult((page-1)*rows).setMaxResults(rows)\n");
		sb.append("				.list();\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	public void save(" + table.getTableName() + " t) {\n");
		sb.append("		getSession().save(t);\n");
		sb.append("	}\n");
		sb.append("\n");
		sb
				.append("	public " + table.getTableName()
						+ " queryById(Long id) {\n");
		sb.append("		return (" + table.getTableName() + ") getSession().get("
				+ table.getTableName() + ".class, id);\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	public void delete(" + table.getTableName() + " t) {\n");
		sb.append("		getSession().delete(t);\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	public void update(" + table.getTableName() + " t) {\n");
		sb.append("		getSession().update(t);\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	public int count() {\n");
		sb
				.append("		long count = (Long) getSession().createQuery(\"select count(*) from "
						+ table.getTableName()
						+ "\").setMaxResults(1).uniqueResult();\n");
		sb.append("		int retVal = (int)count;\n");
		sb.append("		return retVal;\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("}\n");
		return sb;
	}

	/**
	 * 制作实体对象
	 */
	public static StringBuilder makeEntity(Table table) {
		StringBuilder sb = new StringBuilder();
		sb.append("package com.ldh.core.domain;\n");
		sb.append("\n");
		sb.append("import java.util.Date;\n");
		sb.append("\n");
		sb.append("import javax.persistence.Column;\n");
		sb.append("import javax.persistence.Entity;\n");
		sb.append("import javax.persistence.GeneratedValue;\n");
		sb.append("import javax.persistence.Id;\n");
		sb.append("import javax.persistence.Table;\n");
		sb.append("\n");
		sb.append("import org.hibernate.annotations.GenericGenerator;\n");
		sb.append("\n");
		sb.append("/**\n");
		sb.append(" * TEquipment entity. @author	刘东赫\n");
		sb.append(" */\n");
		sb.append("@Entity\n");
		sb.append("@Table(name = \"t_"
				+ table.getTableName().substring(1).toLowerCase() + "\")\n");
		sb.append("public class " + table.getTableName()
				+ " implements java.io.Serializable {\n");
		sb.append("\n");
		sb.append("	// Fields\n");
		sb.append("\n");
		sb.append("	/**\n");
		sb.append("	 * \n");
		sb.append("	 */\n");
		sb.append("	private static final long serialVersionUID = 1L;\n");
		List<Column> columns = table.getColumns();
		// 设置属性
		for (int i = 0; i < columns.size(); i++) {
			Column col = columns.get(i);
			// sb.append("	private Integer id;\n");
			sb.append("	private " + col.getColumnType() + " "
					+ col.getColumnName() + ";\n");
		}

		// 构造方法
		sb.append("\n");
		sb.append("	// Constructors\n");
		sb.append("\n");
		sb.append("	/** default constructor */\n");
		sb.append("	public " + table.getTableName() + "() {\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	/** full constructor */\n");
		sb.append("	public " + table.getTableName() + "(");
		for (int i = 0; i < columns.size(); i++) {
			Column col = columns.get(i);
			sb.append(col.getColumnType() + " " + col.getColumnName() + ",");
		}
		sb.deleteCharAt(sb.lastIndexOf(","));
		sb.append(") {\n");
		for (int i = 0; i < columns.size(); i++) {
			Column col = columns.get(i);
			sb.append("		this." + col.getColumnName() + " = "
					+ col.getColumnName() + ";\n");
		}
		sb.append("\n");
		sb.append("	\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	// Property accessors\n");
		sb
				.append("	@GenericGenerator(name = \"generator\", strategy = \"increment\")\n");
		sb.append("	@Id\n");
		sb.append("	@GeneratedValue(generator = \"generator\")\n");
		sb.append("	@Column(name = \"id\", unique = true, nullable = false)\n");
		sb.append("	public Integer getId() {\n");
		sb.append("		return this.id;\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	public void setId(Integer id) {\n");
		sb.append("		this.id = id;\n");
		sb.append("	}\n");
		sb.append("\n");
		// get、set方法
		for (int i = 0; i < columns.size(); i++) {
			Column col = columns.get(i);
			String cname = col.getColumnName();
			if (cname.equals("id"))
				continue;
			String ctype = col.getColumnType();
			String temp = cname.substring(0, 1).toUpperCase()
					+ cname.substring(1);
			sb.append("	@Column(name = \"" + cname + "\")\n");
			sb.append("	public " + ctype + " get" + temp + "() {\n");
			sb.append("		return this." + cname + ";\n");
			sb.append("	}\n");
			sb.append("\n");
			sb.append("	public void set" + temp + "(" + ctype + " " + cname
					+ ") {\n");
			sb.append("		this." + cname + " = " + cname + ";\n");
			sb.append("	}\n");
			sb.append("\n");
		}
		sb.append("}");
		return sb;
	}

	/**
	 * 输出dao层接口
	 * 
	 * @param table
	 * @return
	 */
	public static StringBuilder makeDaoInterface(Table table) {
		String tableName = table.getTableName();
		String className = tableName.substring(1);
		StringBuilder sb = new StringBuilder();
		sb.append("package com.ldh.core.dao;\n");
		sb.append("\n");
		sb.append("\n");
		sb.append("import com.ldh.core.domain.T" + className + ";\n");
		sb.append("import com.ldh.frame.dao.IBaseDao;\n");
		sb.append("\n");
		sb.append("public interface I" + className + "Dao extends IBaseDao<T"
				+ className + ">{\n");
		sb.append("}\n");
		return sb;
	}

	/**
	 * 输出dao
	 * 
	 * @param table
	 * @return
	 */
	public static StringBuilder makeDao(Table table) {
		String tableName = table.getTableName();
		String className = tableName.substring(1);
		StringBuilder sb = new StringBuilder();
		sb.append("package com.ldh.core.dao.impl;\n");
		sb.append("\n");
		sb.append("import org.springframework.stereotype.Repository;\n");
		sb.append("\n");
		sb.append("import com.ldh.core.dao.I" + className + "Dao;\n");
		sb.append("import com.ldh.core.domain." + tableName + ";\n");
		sb.append("import com.ldh.frame.dao.HibernateBaseDao;\n");
		sb.append("@Repository\n");
		sb.append("public class " + className + "Dao extends HibernateBaseDao<"
				+ tableName + "> implements I" + className + "Dao{\n");
		sb.append("\n");
		sb.append("	@Override\n");
		sb.append("	public Class<" + tableName + "> getEntityClass() {\n");
		sb.append("		return " + tableName + ".class;\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("}\n");
		return sb;
	}

	public static StringBuilder makeServiceInterface(Table table) {
		String tableName = table.getTableName();
		String className = tableName.substring(1);
		StringBuilder sb = new StringBuilder();
		sb.append("package com.ldh.core.service;\n");
		sb.append("\n");
		sb.append("import com.ldh.core.domain.T" + className + ";\n");
		sb.append("import com.ldh.frame.service.IBaseService;\n");
		sb.append("\n");
		sb.append("public interface I" + className
				+ "Service extends IBaseService<T" + className + ">{\n");
		sb.append("}\n");

		return sb;
	}

	/**
	 * 生成service
	 * 
	 * @param table
	 * @return
	 */
	public static StringBuilder makeService(Table table) {
		String tableName = table.getTableName();
		String className = tableName.substring(1);
		StringBuilder sb = new StringBuilder();
		sb.append("package com.ldh.core.service.impl;\n");
		sb.append("\n");
		sb.append("import java.io.Serializable;\n");
		sb.append("import java.util.List;\n");
		sb.append("\n");
		sb
				.append("import org.springframework.beans.factory.annotation.Autowired;\n");
		sb.append("import org.springframework.stereotype.Service;\n");
		sb
				.append("import org.springframework.transaction.annotation.Transactional;\n");
		sb.append("\n");
		sb.append("import com.ldh.core.dao.I" + className + "Dao;\n");
		sb.append("import com.ldh.core.domain.T" + className + ";\n");
		sb.append("import com.ldh.core.service.I" + className + "Service;\n");
		sb.append("import com.ldh.frame.page.PageTion;\n");
		sb.append("import com.ldh.frame.page.Paramter;\n");
		sb.append("@Service\n");
		sb.append("@Transactional\n");
		sb.append("public class " + className + "Service implements I"
				+ className + "Service{\n");
		sb.append("	@Autowired\n");
		sb.append("	private I" + className + "Dao dao ;\n");
		sb.append("	@Override\n");
		sb.append("	public void delete(T" + className + " t) {\n");
		sb.append("		dao.delete(t);\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	@Override\n");
		sb.append("	public List<T" + className + "> list() {\n");
		sb.append("		return dao.list();\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	@Override\n");
		sb
				.append("	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {\n");
		sb.append("		return dao.listByPage(pageNo, pageSize, par);\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	@Override\n");
		sb.append("	public List<T" + className + "> queryByCondition(T"
				+ className + " t) {\n");
		sb.append("		return null;\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	@Override\n");
		sb.append("	public T" + className + " queryById(Serializable id) {\n");
		sb.append("		return dao.queryById(id);\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	@Override\n");
		sb.append("	public void save(T" + className + " t) {\n");
		sb.append("		dao.save(t);\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("	@Override\n");
		sb.append("	public void update(T" + className + " t) {\n");
		sb.append("		dao.update(t);\n");
		sb.append("	}\n");
		sb.append("\n");
		sb.append("}\n");
		return sb;
	}

	/**
	 * 创建action层
	 * 
	 * @param table
	 * @return
	 */
	public static StringBuilder makeAction(Table table) {
		String tableName = table.getTableName();
		String className = tableName.substring(1);
		String mappingName = className.toLowerCase();

		StringBuilder sb = new StringBuilder();
		sb.append("package com.ldh.core.action;\n");
		sb.append("\n");
		sb.append("import java.util.HashMap;\n");
		sb.append("import java.util.Map;\n");
		sb.append("\n");
		sb
				.append("import org.springframework.beans.factory.annotation.Autowired;\n");
		sb.append("import org.springframework.stereotype.Controller;\n");
		sb.append("import org.springframework.ui.Model;\n");
		sb
				.append("import org.springframework.web.bind.annotation.RequestMapping;\n");
		sb
				.append("import org.springframework.web.bind.annotation.ResponseBody;\n");
		sb.append("\n");
		sb.append("import com.ldh.core.domain.T" + className + ";\n");
		sb.append("import com.ldh.core.service.I" + className + "Service;\n");
		sb.append("import com.ldh.frame.page.PageTion;\n");
		sb.append("\n");
		sb.append("@RequestMapping(\"/" + mappingName + "\")\n");
		sb.append("@Controller\n");
		sb.append("public class " + className + "Action {\n");
		sb.append("	@Autowired\n");
		sb.append("	private I" + className + "Service service;\n");
		sb.append("\n");
		sb.append("	@RequestMapping(\"/list.do\")\n");
		sb.append("	@ResponseBody\n");
		sb.append("	public Map<String, Object> List(int page, int rows) {\n");
		sb.append("		PageTion data = service.listByPage(page, rows, null);\n");
		sb
				.append("		Map<String, Object> map = new HashMap<String, Object>();\n");
		sb.append("		map.put(\"total\", data.getNum());\n");
		sb.append("		map.put(\"rows\", data.getList());\n");
		sb.append("		return map;\n");
		sb.append("	}\n");
		sb.append("	\n");
		sb.append("	@RequestMapping(\"/save.do\")\n");
		sb.append("	@ResponseBody\n");
		sb.append("	public void save(T" + className + " bean) {\n");
		sb.append("		service.save(bean);\n");
		sb.append("	}\n");
		sb.append("	@RequestMapping(\"/del.do\")\n");
		sb.append("	@ResponseBody\n");
		sb.append("	public void delete(int id) {\n");
		sb.append("		service.delete(service.queryById(id));\n");
		sb.append("	}\n");
		sb.append("	\n");
		sb.append("	@RequestMapping(\"/update.do\")\n");
		sb.append("	@ResponseBody\n");
		sb.append("	public void update(T" + className + " bean){\n");
		sb.append("		T" + className
				+ " temp = service.queryById(bean.getId());\n");
		sb.append("		service.update(temp);\n");
		sb.append("	}\n");
		sb.append("	@RequestMapping(\"/GoEdit.do\")\n");
		sb.append("	public String edit(Model model,int id){\n");
		sb.append("		T" + className + " temp = service.queryById(id);\n");
		sb.append("		model.addAttribute(\"bean\",temp );\n");
		sb.append("		return \"" + mappingName + "/edit\";\n");
		sb.append("	}\n");
		sb.append("	@RequestMapping(\"/GoSave.do\")\n");
		sb.append("	public String goSave(Model model){\n");
		sb.append("		return \"" + mappingName + "/save\";\n");
		sb.append("	}\n");
		sb.append("	@RequestMapping(\"/Go.do\")\n");
		sb.append("	public String show(Model model){\n");
		sb.append("		return \"" + mappingName + "/list\";\n");
		sb.append("	}\n");
		sb.append("}\n");

		return sb;
	}

	public static StringBuilder makeListPage(Table table) {
		String tableName = table.getTableName();
		String name = tableName.substring(1).toLowerCase();
		StringBuilder sb = new StringBuilder();
		List<Column> columns = table.getColumns();
		sb
				.append("<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"utf-8\"%>\n");
		sb.append("	<body>\n");
		sb.append("		<script>\n");
		sb.append("			//展示页面\n");
		sb.append("			$('#" + name + "ListBox').datagrid( {\n");
		sb.append("				url : '" + name + "/list.do',\n");
		sb.append("				fit:true,\n");
		sb.append("				columns : [ [ \n");
		sb.append("					{field : 'id' ,hidden:true,width:100},\n");
		for (int i = 0; i < columns.size(); i++) {

			Column col = columns.get(i);
			if (col.getColumnName().equals("id")) {
				continue;
			}
			sb.append("	{field : '" + col.getColumnName()
					+ "' ,title:'手动更改',width:100},\n");
		}
		sb.deleteCharAt(sb.lastIndexOf(","));
		sb.append("				] ],\n");
		sb.append("				singleSelect:true,\n");
		sb.append("				pagination:true,\n");
		sb.append("				pageSize:7,\n");
		sb.append("				rownumbers:true,\n");
		sb.append("				pageList:[7,10,15,20],\n");
		sb.append("				toolbar: [{\n");
		sb.append("					iconCls: 'icon-edit',\n");
		sb.append("					text:'新增',\n");
		sb.append("					handler: function(){\n");
		sb.append("						" + name + "ShowSavePage();\n");
		sb.append("					}\n");
		sb.append("				},'-',{\n");
		sb.append("					text:'删除',\n");
		sb.append("					iconCls: 'icon-cancel',\n");
		sb.append("					handler: function(){\n");
		sb.append("						var one = $('#" + name
				+ "ListBox').datagrid('getSelected');\n");
		sb.append("						if(one==null){\n");
		sb.append("							alert('请选择要删除的行');\n");
		sb.append("							return ;\n");
		sb.append("						} \n");
		sb.append("						del(one.id);\n");
		sb.append("					}\n");
		sb.append("				},'-',{\n");
		sb.append("					text:\"修改\",\n");
		sb.append("					iconCls: 'icon-help',\n");
		sb.append("					handler: function(){\n");
		sb.append("						var one = $('#" + name
				+ "ListBox').datagrid('getSelected');\n");
		sb.append("						if(one==null){\n");
		sb.append("							alert('请选择要修改的行');\n");
		sb.append("							return ;\n");
		sb.append("						}\n");
		sb.append("						var id = one.id;\n");
		sb.append("						" + name + "ShowEditPage(id);\n");
		sb.append("					}\n");
		sb.append("				}]\n");
		sb.append("				\n");
		sb.append("			});\n");
		sb.append("			//展示保存盒子\n");
		sb.append("			function " + name + "ShowSavePage(){\n");
		sb.append("				var url =\"" + name + "/GoSave.do\";\n");
		sb.append("				$('#" + name + "SaveBox').dialog({\n");
		sb.append("					  title: '辅助项目新增',    \n");
		sb.append("					  width: 500,    \n");
		sb.append("					  height: 360,    \n");
		sb.append("					  closed: false,    \n");
		sb.append("					  cache: false,    \n");
		sb.append("					  href: url,    \n");
		sb.append("					  modal: true   \n");
		sb.append("				});\n");
		sb.append("			}\n");
		sb.append("			//展示修改盒子\n");
		sb.append("			function " + name + "ShowEditPage(id){\n");
		sb.append("				var url =\"" + name + "/GoEdit.do?id=\"+id;\n");
		sb.append("				$('#" + name + "EditBox').dialog({\n");
		sb.append("					  title: '辅助项目修改',    \n");
		sb.append("					  width: 500,    \n");
		sb.append("					  height: 360,    \n");
		sb.append("					  closed: false,    \n");
		sb.append("					  cache: false,    \n");
		sb.append("					  href: url,    \n");
		sb.append("					  modal: true   \n");
		sb.append("				});\n");
		sb.append("			}\n");
		sb.append("			/*刪除*/\n");
		sb.append("			function del(value){\n");
		sb.append("				var url =\"" + name + "/del.do\";\n");
		sb.append("				$.messager.confirm('确认对话框', '确定删除吗？', function(r){\n");
		sb.append("					if (r){\n");
		sb.append("						$.get(url,{\"id\":value},function(data){\n");
		sb.append("							$.messager.show({\n");
		sb.append("								title:'提示',\n");
		sb.append("								msg:'删除成功',\n");
		sb.append("								showType:'slide',\n");
		sb.append("								outTime:'1000'\n");
		sb.append("							});	\n");
		sb.append("							$('#" + name + "ListBox').datagrid('reload');\n");
		sb.append("						});\n");
		sb.append("					}\n");
		sb.append("				});\n");
		sb.append("			}\n");
		sb.append("		</script>\n");
		sb.append("		<div id=\"" + name + "ListBox\"></div>\n");
		sb.append("		<div id=\"" + name + "SaveBox\"></div>\n");
		sb.append("		<div id=\"" + name + "EditBox\"></div>\n");
		sb.append("	</body>\n");

		return sb;
	}

	public static StringBuilder makeSavePage(Table table) {
		StringBuilder sb = new StringBuilder();
		String tableName = table.getTableName();
		String name = tableName.substring(1).toLowerCase();
		sb.append("<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"utf-8\"%>\n");
		sb.append("<body>\n");
		sb.append("	<script>\n");
		sb.append("		$(function(){\n");
		sb.append("		\n");
		sb.append("			$(\"#" + name + "SaveBtn\").linkbutton( {\n");
		sb.append("				iconCls : 'ok',\n");
		sb.append("				text : '保存',\n");
		sb.append("				onClick : function() {\n");
		sb.append("					$('#" + name + "SaveForm').form('submit');\n");
		sb.append("				}\n");
		sb.append("			});\n");
		sb.append("			$('#" + name + "SaveForm').form( {\n");
		sb.append("				onSubmit : function() {\n");
		sb.append("					var isValid = $(this).form('validate');\n");
		sb.append("					if (!isValid) {\n");
		sb.append("					}\n");
		sb.append("					return true;\n");
		sb.append("				},\n");
		sb.append("				success : function(data) {\n");
		sb.append("					$.messager.show( {\n");
		sb.append("						title : '提示',\n");
		sb.append("						msg : '保存成功',\n");
		sb.append("						showType : 'slide',\n");
		sb.append("						outTime : '1000'\n");
		sb.append("					});\n");
		sb.append("					$('#" + name + "SaveBox').dialog('clear');\n");
		sb.append("					$('#" + name + "SaveBox').dialog('close');\n");
		sb.append("					$('#" + name + "ListBox').datagrid('reload');\n");
		sb.append("				}\n");
		sb.append("			});\n");
		sb.append("			$(\"#" + name + "SaveExit\").linkbutton( {\n");
		sb.append("				iconCls : 'ok',\n");
		sb.append("				text : '返回',\n");
		sb.append("				onClick:function(){\n");
		sb.append("					$('#" + name + "SaveBox').dialog('clear');\n");
		sb.append("					$('#" + name + "SaveBox').dialog('close');\n");
		sb.append("				}\n");
		sb.append("			});\n");
		sb.append("		\n");
		sb.append("		})\n");
		sb.append("			\n");
		sb.append("		</script>\n");
		sb.append("	<form id=\"" + name
				+ "SaveForm\" method=\"post\" action=\"" + name
				+ "/save.do\">\n");
		//获取列信息
		List<Column> columns = table.getColumns();
		sb.append("<table class=\"s_box\">");
		for(Column col : columns){
			if(col.getColumnName().equalsIgnoreCase("id"))
				continue;
			sb.append("			<tr>");
			sb.append("				<td class=\"left\">");
			sb.append("					角色名称：");
			sb.append("				</td>");
			sb.append("				<td class=\"right\">");
			sb.append("					<input class='easyui-textbox' name=\""+col.getColumnName()+"\" type=\"text\" />");
			sb.append("				</td>");
			sb.append("			</tr>");
		}
		sb.append("		</table>");
		// 下面的提交按钮
		sb.append("	<div class=\"s_btn\">\n");
		sb.append("	<div class=\"s_btn_l fl\">\n");
		sb.append("		<div id='" + name + "SaveBtn'>\n");
		sb.append("			保存\n");
		sb.append("		</div>\n");
		sb.append("		</div>\n");
		sb.append("		<div class=\"s_btn_r fl\">\n");
		sb.append("		<div id='" + name + "SaveExit'>\n");
		sb.append("		返回\n");
		sb.append("		</div>\n");
		sb.append("		</div>\n");
		sb.append("		</div>\n");

		sb.append("	</form>\n");
		sb.append("\n");
		sb.append("</body>");
		return sb;
	}

	public static StringBuilder makeEditPage(Table table) {
		StringBuilder sb = new StringBuilder();
		String tableName = table.getTableName();
		String name = tableName.substring(1).toLowerCase();
		sb.append("<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>");
		sb.append("<body>");
		sb.append("	<script>");
		sb.append("		$(function(){");
		sb.append("		");
		sb.append("			$('#" + name + "EditBtn').linkbutton( {");
		sb.append("				iconCls : 'ok',");
		sb.append("				text : '确认',");
		sb.append("				onClick : function() {");
		sb.append("					$('#" + name + "EditForm').form('submit');");
		sb.append("				}");
		sb.append("			});");
		sb.append("			$('#" + name + "EditForm').form( {");
		sb.append("				onSubmit : function() {");
		sb.append("					var isValid = $(this).form('validate');");
		sb.append("					if (!isValid) {");
		sb.append("					}");
		sb.append("					return true;");
		sb.append("				},");
		sb.append("				success : function(data) {");
		sb.append("					$.messager.show( {");
		sb.append("						title : '提示',");
		sb.append("						msg : '修改成功',");
		sb.append("						showType : 'slide',");
		sb.append("						outTime : '1000'");
		sb.append("					});");
		sb.append("					$('#" + name + "EditBox').dialog('clear');");
		sb.append("					$('#" + name + "EditBox').dialog('close');");
		sb.append("					$('#" + name + "ListBox').datagrid('reload');");
		sb.append("				}");
		sb.append("			});");
		sb.append("			$('#" + name + "EditExit').linkbutton( {");
		sb.append("				iconCls : 'ok',");
		sb.append("				text : '返回',");
		sb.append("				onClick:function(){");
		sb.append("					$('#" + name + "EditBox').dialog('clear');");
		sb.append("					$('#" + name + "EditBox').dialog('close');");
		sb.append("				}");
		sb.append("			});");
		sb.append("		");
		sb.append("		})");
		sb.append("			");
		sb.append("		</script>");
		sb.append("	<form id='" + name + "EditForm' method='post' action='"
				+ name + "/update.do'>");
		sb.append("		<input type='hidden' name='id' value='${bean.id }'/>");
		sb.append("<table class=\"s_box\">");
		List<Column> columns = table.getColumns();
		for(Column col : columns){
			if(col.getColumnName().equalsIgnoreCase("id"))
				continue;
			sb.append("			<tr>");
			sb.append("				<td class=\"left\">");
			sb.append("					角色名称：");
			sb.append("				</td>");
			sb.append("				<td class=\"right\">");
			sb.append("					<input class='easyui-textbox' name=\""+col.getColumnName()+"\" type=\"text\" ");
			sb.append("  value=\"${bean."+col.getColumnName()+" }\"/>");
			sb.append("				</td>");
			sb.append("			</tr>");
		}
		sb.append("		</table>");

		sb.append("	<div class=\"s_btn\">\n");
		sb.append("	<div class=\"s_btn_l fl\">\n");
		sb.append("			<div id='" + name + "EditBtn'>");
		sb.append("				保存");
		sb.append("			</div>");
		sb.append("		</div>\n");
		sb.append("		<div class=\"s_btn_r fl\">\n");
		sb.append("			<div id='" + name + "EditExit'>");
		sb.append("				返回");
		sb.append("			</div>");
		sb.append("		</div>\n");
		sb.append("		</div>\n");

		sb.append("	</form>");
		sb.append("");
		sb.append("</body>");
		return sb;
	}

}
