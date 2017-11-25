<%@page language="java" pageEncoding="utf-8"%>
<body>
	<script>
		$("#left").tree({
			lines:true,
			animate:true,
			url:"system/leftGo.do",
			onClick:function (node){
				if(!node.children){
     				//如果存在就选中
     				if($('#right').tabs('exists',node.text)){
     					$('#right').tabs('select',node.text);
     					return ;
     				}
     		/*		//主数据特有为了应对查询条件问题
     				$("#tempZSJ").val(node.condition);*/
     				//如果不存在就添加
     				$('#right').tabs('add',
     					{
     						closable:true,    
     						title:node.text,
     						href:node.href
     					}
     				);
     			}
				
			}
		});
	</script>
	<div id="left"></div>
</body>