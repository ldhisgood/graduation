<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<body>
		<script>
			//展示页面
			$('#equipmentcategoryListBox').datagrid( {
				url : 'equipmentcategory/list.do',
				fit:true,
				columns : [ [ 
					{field : 'id' ,hidden:true,width:100},
					{field : 'num' ,title:'编号',width:100},
					{field : 'name' ,title:'名称',width:100},
					{field : 'del' ,title:'有效性',width:100},
					{field : 'info' ,title:'信息',width:100}
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
						equipmentcategoryShowSavePage();
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-cancel',
					handler: function(){
						var one = $('#equipmentcategoryListBox').datagrid('getSelected');
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
						var one = $('#equipmentcategoryListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						equipmentcategoryShowEditPage(id);
					}
				}]
				
			});
			//展示保存盒子
			function equipmentcategoryShowSavePage(){
				var url ="equipmentcategory/GoSave.do";
				$('#equipmentcategorySaveBox').dialog({
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
			function equipmentcategoryShowEditPage(id){
				var url ="equipmentcategory/GoEdit.do?id="+id;
				$('#equipmentcategoryEditBox').dialog({
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
				var url ="equipmentcategory/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#equipmentcategoryListBox').datagrid('reload');
						});
					}
				});
			}
		</script>
		<div id="equipmentcategoryListBox"></div>
		<div id="equipmentcategorySaveBox"></div>
		<div id="equipmentcategoryEditBox"></div>
	</body>
