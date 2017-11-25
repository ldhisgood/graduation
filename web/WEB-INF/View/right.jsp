<%@page language="java" pageEncoding="utf-8"%>
<body>
	<script type="text/javascript">
		$('#right').tabs({
			fit:true,
			border:false,
			closable:true,
			//选择选项卡的时候实现左侧树与之对应
			onSelect:function(title,index){
				var root = $('#left').tree('getRoots');
				function check(roots){
					for(var i=0;i<roots.length;i++){
						var node = roots[i];
						if(node.text==title)
							$('#left').tree('select',node.target);
						if(node.children){
							check($('#left').tree('getChildren',node.target));
						}
					}
				}
				check(root);
			}
			
		});
		
	</script>
	<div id="right"></div>

</body>