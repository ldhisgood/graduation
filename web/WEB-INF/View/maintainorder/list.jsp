<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<body>
		<script>
			//展示页面
			$('#maintainorderListBox').datagrid( {
				url : 'maintainorder/list.do',
				fit:true,
				columns : [ [ 
					{field : 'mname' ,title:'设备名称',width:100},
					{field : 'num' ,title:'设备编号',width:100},
					{field : 'unit' ,title:'设备规格',width:100},
					{field : 'dname' ,title:'部门名称',width:100},
					{field : 'mlevel' ,title:'维修级别',width:100},
					{field : 'man' ,title:'维修人',width:100},
					{field : 'dotime' ,title:'计划维修时间',width:100,
						formatter:function(value){
							return moment(value).format('YYYY-MM-DD');
						}
					},
					{field : 'project' ,title:'维修项目',width:100,hidden:true},
					{field : 'standard' ,title:'维修标准',width:100,hidden:true},
					{field : 'info' ,title:'维修内容',width:100,hidden:true},
					{field : 'ext1' ,title:'地址',width:100,hidden:true},
					{field : 'eid' ,title:'设备id',width:100},
					{field : 'id',title:'操作',width:100,
						formatter:function(value){
							var info ="<span class='maintainplan_detail' onclick='maintainorderShowDetailPage("+value+")'>详情</span>";
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
						var one = $('#maintainorderListBox').datagrid('getSelected');
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
						var one = $('#maintainorderListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						maintainorderShowEditPage(id);
					}
				},'-',{
					text:"今日工单",
					handler: function(){
						$('#maintainorderListBox').datagrid('load',{
							condition: '0'
						});
					}
				},'-',{
					text:"<input id='maintainorder_tool_search' type='text'/>",
					handler: function(){
					}
				}]
				
			});
			//展示修改盒子
			function maintainorderShowEditPage(id){
				var url ="maintainorder/GoEdit.do?id="+id;
				$('#maintainorderEditBox').dialog({
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
			function maintainorderShowDetailPage(id){
				var url="maintainorder/GoDetail.do?id="+id;
				$('#maintainorderDetailBox').dialog({
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
				var url ="maintainorder/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#maintainorderListBox').datagrid('reload');
						});
					}
				});
			}
			//添加搜索框
			$("#maintainorder_tool_search").textbox({    
			    buttonText:'Search',    
			    iconAlign:'left'       
			});
			
		</script>
		<div id="maintainorderListBox"></div>
		<div id="maintainorderDetailBox"></div>
		<div id="maintainorderEditBox"></div>
	</body>
