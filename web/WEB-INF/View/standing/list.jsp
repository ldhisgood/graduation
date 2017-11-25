<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<body>
		<script>
			//展示页面
			$('#standingListBox').datagrid( {
				url : 'standing/list.do',
				fit:true,
				frozenColumns:[[
					{field : 'id' ,hidden:true,width:100},
					{field : 'name' ,title:'设备名称',width:100},
					{field : 'num' ,title:'编号',width:100}
				]],
				columns : [ [ 
					{field : 'unit' ,title:'规格',width:100},
					{field : 'category' ,title:'设备类别',width:100},
					{field : 'creater' ,title:'生产商',width:100},
					{field : 'supplier' ,title:'供应商名称',width:100},
					{field : 'flag' ,title:'设备标示',width:100,
						formatter:function(value){
							if(value=='0')
								return '重型设备';
							if(value==1)
								return '轻型设备';
							return '其他设备';
						}
					},
					{field : 'intime' ,title:'购入时间',width:100,
						formatter:function(value){
							return moment(value).format('YYYY-MM-DD');
						}
					},
					{field : 'certifier' ,title:'资产证明人',width:100},
					{field : 'deperction' ,title:'折旧方式',width:100},
					{field : 'perPrice' ,title:'资产原值',width:100},
					{field : 'rate' ,title:'净残率',width:100},
					{field : 'useStatus' ,title:'使用状态',width:100},
					{field : 'dname' ,title:'部门名称',width:100},
					{field : 'operator' ,title:'操作员',width:100},
					{field : 'place' ,title:'使用地点',width:100}
					/*{field : 'ext1' ,title:'手动更改',width:100},
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
				toolbar: [{
					iconCls: 'icon-edit',
					text:'新增',
					handler: function(){
						standingShowSavePage();
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-cancel',
					handler: function(){
						var one = $('#standingListBox').datagrid('getSelected');
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
						var one = $('#standingListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						standingShowEditPage(id);
					}
				}]
				
			});
			//展示保存盒子
			function standingShowSavePage(){
				var url ="standing/GoSave.do";
				$('#standingSaveBox').dialog({
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
			function standingShowEditPage(id){
				var url ="standing/GoEdit.do?id="+id;
				$('#standingEditBox').dialog({
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
				var url ="standing/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#standingListBox').datagrid('reload');
						});
					}
				});
			}
		</script>
		<div id="standingListBox"></div>
		<div id="standingSaveBox"></div>
		<div id="standingEditBox"></div>
	</body>
