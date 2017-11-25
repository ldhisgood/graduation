<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
			//展示页面
			$('#functionListBox').datagrid( {
				url : 'function/list.do',
				fit:true,
				columns : [ [ 
					{field : 'id' ,hidden:true,width:100},
					{field : 'name' ,title:'功能名称',width:100},
					{field : 'href' ,title:'功能连接',width:100},
					{field : 'fid' ,title:'父级',width:100},
					{field : 'ext1' ,title:'父级名称',width:100},
					{field : 'ext2' ,title:'功能位置',width:100}
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
						functionShowSavePage();
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-cancel',
					handler: function(){
						var one = $('#functionListBox').datagrid('getSelected');
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
						var one = $('#functionListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						functionShowEditPage(id);
					}
				}]
				
			});
			//展示保存盒子
			function functionShowSavePage(){
				var url ="function/GoSave.do";
				$('#functionSaveBox').dialog({
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
			function functionShowEditPage(id){
				var url ="function/GoEdit.do?id="+id;
				$('#functionEditBox').dialog({
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
				var url ="function/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#functionListBox').datagrid('reload');
						});
					}
				});
			}
		</script>
	<div id="functionListBox"></div>
	<div id="functionSaveBox"></div>
	<div id="functionEditBox"></div>
</body>
