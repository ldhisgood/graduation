<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<body>
		<script>
 
			//展示页面
			$('#knowledgeListBox').datagrid( {
				url : 'knowledge/list.do',
				//fit:true,
				columns : [ [ 
					{field : 'id' ,hidden:true,width:100},
					{field : 'filename' ,title:'文件名称',width:100},
					{field : 'classify' ,title:'文件类别',width:100},
					{field : 'uploadDate' ,title:'上传时间',width:200,
					 	    formatter: function (value, row, index) {
					  		return moment(value).format('YYYY-MM-DD HH:mm:ss');
					  		
					   		}
					},
					//{field : 'accessory' ,title:'附件',width:100},
					{field : 'imgs' ,title:'图片',width:100,
					//<img src="'+row.image+'" />
					   /*   formatter:function(value,row,index){
					   return '<a href="javascript:knowledgeShowDetailPage("+row.id+")">详情</a>';
					   }   */
					    formatter:function(value,row){
							var info ="<span class='knowledge_detail' onclick='knowledgeShowDetailPage("+row.id+")'>点击查看图片</span>";
							return info;
						} 
					},
					//{field : 'ext3' ,title:'手动更改',width:100},
					//{field : 'ext4' ,title:'手动更改',width:100},
 					//{field : 'ext5' ,title:'详情',width:100}
				]],
				singleSelect:true,
				pagination:true,
				pageSize:7,
				rownumbers:true,
				pageList:[7,10,15,20],
				toolbar: [{
					iconCls: 'icon-add',
					text:'新增',
					handler: function(){
						knowledgeShowSavePage();
					}
				},'-',{
					text:'删除',
					iconCls: 'icon-remove',
					handler: function(){
						var one = $('#knowledgeListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要删除的行');
							return ;
						} 
						del(one.id);
					}
				},'-',{
					text:"修改",
					iconCls: 'icon-edit',
					handler: function(){
						var one = $('#knowledgeListBox').datagrid('getSelected');
						if(one==null){
							alert('请选择要修改的行');
							return ;
						}
						var id = one.id;
						knowledgeShowEditPage(id);
					}
				}]
			});
			
			//展示图片详情盒子
			function knowledgeShowDetailPage(id){
				var url="knowledge/GoDetail.do?id="+id;
				$('#knowledgeDetailBox').dialog({
					  title: '辅助项目修改',    
					  width: 1100,    
					  height: 500,    
					  closed: false,    
					  cache: false,    
					  href: url,    
					  modal: true   
				});
			}
			//展示保存盒子
			function knowledgeShowSavePage(){
				var url ="knowledge/GoSave.do";
				$('#knowledgeSaveBox').dialog({
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
			function knowledgeShowEditPage(id){
				var url ="knowledge/GoEdit.do?id="+id;
				$('#knowledgeEditBox').dialog({
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
				var url ="knowledge/del.do";
				$.messager.confirm('确认对话框', '确定删除吗？', function(r){
					if (r){
						$.get(url,{"id":value},function(data){
							$.messager.show({
								title:'提示',
								msg:'删除成功',
								showType:'slide',
								outTime:'1000'
							});	
							$('#knowledgeListBox').datagrid('reload');
						});
					}
				});
			}
		</script>
		<!-- <script type="text/javascript">
		 $('#ss').searchbox({   
		    searcher:function(value,name){   
		    },   
		    menu:'#mm',   
		    prompt:'请输入搜索值！'  
		});  
		</script>
	  <form id="" method="post" action="knowledge/GoSearch.do">
		<input id="ss" style="width:200px"></input>
		<div id="mm" style="width:200px">
			<div data-options="name:'all',iconCls:'icon-ok'">文件名</div>
		</div>
	</form> -->
	
	
 <script type="text/javascript">
	function findFile(){
	var filename=$("#filename").textbox('getValue');
	$.ajax({
		url : 'knowledge/GoSearch.do',
		type : 'post',
		data:{
			filename:filename,
			},
			success:function(data){
				if(data!=0){
				$("#knowledgeListBox").datagrid('loadData',data);
				}else{
					alert("查询结果不存在");
				}
			},
			error:function(){
				alert("查询异常");
			}
	});
}
</script>
	 <div id="contain" style="width:100%;height: 100%">
		<div id="tb" style="padding:5px;height:auto">
			<div style="margin-bottom:5px">
				文件名：<input class="easyui-textbox" style="width:100px" id="filename">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="findFile()">查询</a>
			</div>
		</div>
		<table id="knowledgeListBox" class="easyui-datagrid" style="width:100%;height:100%" toolbar="#tb">
		</table>
	</div>
 	<div id="knowledgeListBox"></div>
	<div id="knowledgeSaveBox"></div>
	<div id="knowledgeDetailBox"></div>
	<div id="knowledgeEditBox"></div>
	</body>
