<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<body>
		<script>
			//展示页面
			$('#roleListBox').datagrid( {
				url : 'role/list.do',
				fit:true,
				columns : [ [ 
					{field : 'id' ,hidden:true,width:100},
					{field : 'num' ,title:'编号',width:100},
					{field : 'name' ,title:'姓名',width:100},
					{field : 'ext1' ,title:'描述',width:100}
				] ],
				rownumbers:true,
				singleSelect:true,
				pagination:true,
				pageSize:7,
				pageList:[7,10,15,20],
				toolbar: [{
					iconCls: 'icon-edit',
					text:'新增',
					handler: function(){
						roleShowSavePage();
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-cancel',
					handler: function(){
						var one = $('#roleListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要删除的行');
							return ;
						} 
						if(one.num=='000001'){
							alert('此为系统默认超级管理员不能删除');
							return ;
						}
						del(one.id);
					}
				},'-',{
					text:"修改",
					iconCls: 'icon-help',
					handler: function(){
						var one = $('#roleListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						roleShowEditPage(id);
					}
				},'-',{
					text:"选择功能",
					iconCls: 'icon-help',
					handler: function(){
						var one = $('#roleListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要选择功能的行');
							return ;
						}
						var id = one.id;
						chooseFunction(id);
					}
				}]
				
			});
			function chooseFunction(id){
				var url ="role/GoChooseFunction.do?id="+id;
				$('#roleChooseBox').dialog({
					  title: '选择功能界面',    
					  width: 500,    
					  height: 360,    
					  closed: false,    
					  cache: false,    
					  href: url,    
					  modal: true   
				});
			}
			//展示保存盒子
			function roleShowSavePage(){
				var url ="role/GoSave.do";
				$('#roleSaveBox').dialog({
					  title: '辅助项目新增',    
					  width: 500,    
					  height: 360,    
					  closed: false,    
					  cache: false,    
					  href: url,    
					  modal: true   
				});
			}
			//展示修改盒子
			function roleShowEditPage(id){
				var url ="role/GoEdit.do?id="+id;
				$('#roleEditBox').dialog({
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
				var url ="role/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#roleListBox').datagrid('reload');
						});
					}
				});
			}
		</script>
		<div id="roleListBox"></div>
		<div id="roleSaveBox"></div>
		<div id="roleEditBox"></div>
		<div id="roleChooseBox"></div>
	</body>

