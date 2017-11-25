<%@page pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<base href="<%=basePath%>">
	<link rel="styleSheet" type="text/css" href="css/user.css"/>
	<script src="EasyUI/jquery.min.js"></script>
</head>

<body>

<script>
   $(function(){
	   $('.mian_span').click(function(){
		   $(this).siblings('input').val("");
	   });
   	   $('#password').keydown(function (e){
   	   		if(e.keyCode==13){
   	   			login();
   	   		}
   	   });
   });
   
   function login(){
   		$.ajax({
   			url:"system/checkLogin.do",
   			type:"post",
			dataType:"json",
			data:{
				"name":$("#username").val(),
				"pwd":$("#password").val()
			},
			beforeSend:function(){
				$("#message").text("正在进行登录认证请稍候...");
				return true;
			},
			success:function(data){
				if(data=="1"){
					window.location.href="${pageContext.request.contextPath}/in.do";
				}else{
					$("#message").text("账号或密码不正确");
					reset();
				}
			}
   		});
   }
   function reset(){
   		$("#username").val('');
   		$("#password").val('');
   }
</script>
<div class="box">
     <div class="content">
         <div class="list">
              <div class="clearfix btn">
                  <img src="image/a.png" class="fl"/>
                  <span class="fl list_s">博林特电梯设备管理系统</span>
              </div>
              <div class="clearfix mian">
                   <p class="fl mian_user">
                          <span>用户名:</span>
                          <span class="mian_s">user name</span>
                   </p>
                   <p class="miak fl">
                            <input id="username" class="fl" type="text" value="请输入用户名" onfocus="if (value =='请输入用户名'){value =''}"onblur="if (value ==''){value='请输入用户名'}"/>
                           <span class="mian_span"></span>
                   </p>
              </div>
              <div class="clearfix mian">
                   <p class="fl mian_user">
                          <span>密码:</span>
                          <span class="mian_s">password</span>
                   </p>
                   <p class="miak fl">
                           <input class="fl" id="password" type="password" value="请输入密码" onfocus="if (value =='请输入密码'){value =''}"onblur="if (value ==''){value='请输入密码'}"/>
                           <span class="mian_span"></span>
                   </p>
              </div>
              <p  id="message" class="message"></p>
              <div class="pass_btn">
                	<button onclick="login()">登录</button>
                    <button onclick="reset()">重置</button>	 
              </div>	
         </div> 
     </div>
</div>
</body>
</html>
