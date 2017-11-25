<%@page pageEncoding="utf-8" language="java"%>
<body>
	<script>
		$(function(){
				/*显示时间函数*/
			window.setInterval(function(){
				//根据id 设置位置显示时间
				var context = document.getElementById('time_context');

				var weeks = ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'];
				var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth();
				var day = date.getDate();
				var week = date.getDay();
				var hour =date.getHours();
				var minute = date.getMinutes();
				var second = date.getSeconds();
				var shijian = year+"年"+(month+1)+"月"+day+"日"+hour+"时"+minute+"分"
				+second+"秒 "+weeks[week];	
				context.innerHTML = shijian;
			},1000);
		})	;
		
	</script>
	<div class="toppage">
		<img src="image/log.png" class="log"/>
		<ol class="top_info fr">
			<li><span id="time_context" class="fl"></span></li>
			<li>欢迎：${name }<span class="fr"><a href="system/exit.do">注销&nbsp;&nbsp;&nbsp;</a></span></li>
		</ol>
	
	
	</div>
</body>