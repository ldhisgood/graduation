<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<body>
		<script>
			//展示页面
			$('#supplierListBox').datagrid( {
				url : 'supplier/list.do',
				fit:true,
				columns : [ [ 
					{field : 'id' ,hidden:true,width:100},
					{field : 'name' ,title:'名字',width:100},
					{field : 'address' ,title:'地址',width:100},
					{field : 'contact' ,title:'联系人',width:100},
					{field : 'telphone' ,title:'电话',width:100},
			/*		{field : 'ext1' ,title:'手动更改',width:100},
					{field : 'ext2' ,title:'手动更改',width:100}*/
					{field : 'remark' ,title:'冗余',width:100}
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
						supplierShowSavePage();
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-cancel',
					handler: function(){
						var one = $('#supplierListBox').datagrid('getSelected');
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
						var one = $('#supplierListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						supplierShowEditPage(id);
					}
				}]
				
			});
			//展示保存盒子
			function supplierShowSavePage(){
				var url ="supplier/GoSave.do";
				$('#supplierSaveBox').dialog({
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
			function supplierShowEditPage(id){
				var url ="supplier/GoEdit.do?id="+id;
				$('#supplierEditBox').dialog({
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
				var url ="supplier/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#supplierListBox').datagrid('reload');
						});
					}
				});
			}
		</script>
		<div id="supplierListBox"></div>
		<div id="supplierSaveBox"></div>
		<div id="supplierEditBox"></div>
	</body>
