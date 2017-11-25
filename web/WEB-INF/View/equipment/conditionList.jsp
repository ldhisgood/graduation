<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
	<body>
		<script>
			//展示页面
			$('#equipmentConListBox').datagrid( {
				url : 'equipment/conditionList.do',
				fit:true,
				frozenColumns:[[
					{field : 'id' ,hidden:true,width:100},
					{field : 'name' ,title:'设备名称',width:100},
					{field : 'num' ,title:'编号',width:100}
				]],
				columns : [ [ 
					{field : 'unit' ,title:'规格',width:100},
					{field : 'cid' ,title:'设备类别id',width:100},
					{field : 'category' ,title:'设备类别',width:100},
					{field : 'creater' ,title:'生产商',width:100},
					{field : 'sid' ,title:'供应商id',width:100},
					{field : 'supplier' ,title:'供应商名称',width:100},
					{field : 'flag' ,title:'设备标示',width:100},
					{field : 'intime' ,title:'购入时间',width:100,
						formatter:function(value){
							return moment(value).format('YYYY-MM-DD');
						}
					},
					{field : 'certifier' ,title:'资产证明人',width:100},
					{field : 'deperction' ,title:'折旧方式',width:100},
					{field : 'perPrice' ,title:'资产原值',width:100},
					{field : 'rate' ,title:'净残率',width:100},
					{field : 'checkRound' ,title:'检查周期',width:100},
					{field : 'preCheck' ,title:'上次检查',width:100,
						formatter:function(value){
							return moment(value).format('YYYY-MM-DD');
						}
					},
					{field : 'nextCheck' ,title:'下次检查',width:100,
						formatter:function(value){
							return moment(value).format('YYYY-MM-DD');
						}
					},
					{field : 'preMaintain' ,title:'上次维修',width:100,
						formatter:function(value){
							return moment(value).format('YYYY-MM-DD');
						}
					},
					{field : 'useStatus' ,title:'使用状态',width:100},
					{field : 'did' ,title:'部门id',width:100},
					{field : 'dname' ,title:'部门名称',width:100},
					{field : 'operator' ,title:'操作员',width:100}
					/*{field : 'place' ,title:'手动更改',width:100}
					{field : 'ext1' ,title:'手动更改',width:100},
					{field : 'ext7' ,title:'手动更改',width:100},
					{field : 'ext2' ,title:'手动更改',width:100},
					{field : 'ext3' ,title:'手动更改',width:100},
					{field : 'ext4' ,title:'手动更改',width:100},
					{field : 'ext5' ,title:'手动更改',width:100},
					{field : 'ext6' ,title:'手动更改',width:100}*/
				] ],
				singleSelect:true,
				pagination:true,
				pageSize:7,
				rownumbers:true,
				pageList:[7,10,15,20],
				queryParams:{
					<c:if test="${!empty bean.unit}">
					unit:"${bean.unit}",
					</c:if>
					<c:if test="${!empty bean.name}">
					name:"${bean.name}"
					</c:if>
				}
			});
		
		</script>
		<div id="equipmentConListBox"></div>
	</body>
