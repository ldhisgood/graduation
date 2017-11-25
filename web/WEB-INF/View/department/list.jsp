<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<body>
		<script>
			//展示页面
			$('#departmentListBox').datagrid( {
				url : 'department/list.do',
				fit:true,
				columns : [ [ 
					{field : 'id' ,hidden:true,width:100},
					{field : 'num' ,title:'编号',width:100},
					{field : 'name' ,title:'名称',width:100},
					{field : 'jc' ,title:'简称',width:100},
					{field : 'man' ,title:'管理人',width:100},
					{field : 'phone' ,title:'电话',width:100},
					{field : 'email' ,title:'传真',width:100},
					{field : 'info' ,title:'信息',width:100},
					{field : 'level' ,title:'级别',width:100}
				] ],
				singleSelect:true,
				pagination:true,
				pageSize:7,
				rownumbers:true,
				pageList:[7,10,15,20],
				toolbar: [{
					iconCls: 'icon-edit',
					text:'新增',
					handler: function(){
						departmentShowSavePage();
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-cancel',
					handler: function(){
						var one = $('#departmentListBox').datagrid('getSelected');
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
						var one = $('#departmentListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						departmentShowEditPage(id);
					}
				}]
				
			});
			//展示保存盒子
			function departmentShowSavePage(){
				var url ="department/GoSave.do";
				$('#departmentSaveBox').dialog({
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
			function departmentShowEditPage(id){
				var url ="department/GoEdit.do?id="+id;
				$('#departmentEditBox').dialog({
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
				var url ="department/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#departmentListBox').datagrid('reload');
						});
					}
				});
			}
		</script>
		<div id="departmentListBox"></div>
		<div id="departmentSaveBox"></div>
		<div id="departmentEditBox"></div>
	</body>
