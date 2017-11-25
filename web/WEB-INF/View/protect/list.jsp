<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<body>
		<script>
			//展示页面
			$('#protectListBox').datagrid( {
				url : 'protect/list.do',
				fit:true,
				columns : [ [ 
					{field : 'mname' ,title:'设备名称',width:100},
					{field : 'num' ,title:'设备编号',width:100},
					{field : 'unit' ,title:'设备规格',width:100},
					{field : 'dname' ,title:'部门名称',width:100},
					{field : 'mlevel' ,title:'保养级别',width:100},
					{field : 'method' ,title:'保养方式',width:100},
					{field : 'man' ,title:'保养人',width:100},
					{field : 'dotime' ,title:'下次保养时间',width:100,
						formatter:function(value){
							return moment(value).format('YYYY-MM-DD');
						}
					},
					{field : 'state' ,title:'状态',width:100},
					{field : 'plannum' ,title:'计划单号',width:100,hidden:true},
					{field : 'standard' ,title:'保养标准',width:100,hidden:true},
					{field : 'info' ,title:'保养内容',width:100,hidden:true},
					{field : 'ext1' ,title:'地址',width:100,hidden:true},
					{field : 'eid' ,title:'设备id',width:100},
					{field : 'id',title:'操作',width:100,
						formatter:function(value){
							var info ="<span class='maintainplan_detail' onclick='protectShowDetailPage("+value+")'>详情</span>";
							return info;
						}
					}
				] ],
				singleSelect:true,
				pagination:true,
				pageSize:7,
				rownumbers:true,
				pageList:[7,10,15,20],
				toolbar: [
				{
					text:'删除',
					iconCls: 'icon-cancel',
					handler: function(){
						var one = $('#protectListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要删除的行');
							return ;
						} 
						del(one.id);
					}
				},'-',{
					text:"修改",
					iconCls: 'icon-help',
					handler: function(){
						var one = $('#protectListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						protectShowEditPage(id);
					}
				}]
				
			});
			//展示修改盒子
			function protectShowEditPage(id){
				var url ="protect/GoEdit.do?id="+id;
				$('#protectEditBox').dialog({
					  title: '辅助项目修改',    
					  width: 500,    
					  height: 360,    
					  closed: false,    
					  cache: false,    
					  href: url,    
					  modal: true   
				});
			}
			//展示详情盒子
			function protectShowDetailPage(id){
				var url="protect/GoDetail.do?id="+id;
				$('#protectDetailBox').dialog({
					  title: '辅助项目修改',    
					  width: 500,    
					  height: 360,    
					  closed: false,    
					  cache: false,    
					  href: url,    
					  modal: true   
				});
			}
			/*刪除*/
			function del(value){
				var url ="protect/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#protectListBox').datagrid('reload');
						});
					}
				});
			}
		</script>
		<div id="protectListBox"></div>
		<div id="protectDetailBox"></div>
		<div id="protectEditBox"></div>
	</body>
