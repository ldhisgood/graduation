<%@page language="java" pageEncoding="utf-8"%>
<body>
	<script type="text/javascript">
		$('#left').tree({
			lines:true,
			animate:true,
			data:[{    
			    "text":"基本维护",    
			    "iconCls":"icon-save",  
			    "children":[{  
			    	"href":"equipmentGO.do",
			        "text":"主数据", 
			        "condition":"1",   
			        "checked":true   
			    },
			    {  
			    	"href":"role/Go.do",
			        "text":"角色", 
			        "checked":true   
			    },
			    {  
			    	"href":"user/Go.do",
			        "text":"用户", 
			        "checked":true   
			    },
			    {  
			    	"href":"function/Go.do",
			        "text":"功能", 
			        "checked":true   
			    },
			    {  
			    	"href":"system/left.do",
			        "text":"zc功能", 
			        "checked":true   
			    }
				]
			}],
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
	<input type="hidden" id="tempZSJ" type="text"/>
	<div id="left"></div>
	<div id="repassdialog"></div>
</body>