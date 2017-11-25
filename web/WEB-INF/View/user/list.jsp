<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<body>
		<script>
			//展示页面
			$('#userListBox').datagrid( {
				url : 'user/list.do',
				fit:true,
				frozenColumns:[
					[
					{field : 'num' ,title:'用户编号',width:100},
					{field : 'uname' ,title:'用户名',width:100}
					]
				],
				columns : [ [ 
					{field : 'id' ,hidden:true,width:100},
					{field : 'pwd' ,title:'密码',width:100},
					{field : 'truename' ,title:'真实姓名',width:100},
					{field : 'sex' ,title:'性别',width:100,
						formatter:function(value){
							if(value==0)
							return '男';
							return '女';
						}
					},
					{field : 'phone' ,title:'电话',width:100},
					{field : 'email' ,title:'邮箱',width:100},
					{field : 'address' ,title:'地址',width:100},
					/*
					{field : 'rid' ,title:'角色',width:100},
					{field : 'did' ,title:'部门',width:100},
					{field : 'flag' ,title:'类别',width:100},
					{field : 'del' ,title:'是否删除',width:100},
					*/
					{field : 'ext1' ,title:'角色名称',width:100},
					{field : 'ext2' ,title:'部门名称',width:100}
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
						userShowSavePage();
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-cancel',
					handler: function(){
						var one = $('#userListBox').datagrid('getSelected');
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
						var one = $('#userListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						userShowEditPage(id);
					}
				}]
				
			});
			//展示保存盒子
			function userShowSavePage(){
				var url ="user/GoSave.do";
				$('#userSaveBox').dialog({
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
			function userShowEditPage(id){
				var url ="user/GoEdit.do?id="+id;
				$('#userEditBox').dialog({
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
				var url ="user/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#userListBox').datagrid('reload');
						});
					}
				});
			}
		</script>
		<div id="userListBox"></div>
		<div id="userSaveBox"></div>
		<div id="userEditBox"></div>
	</body>
