<%@page pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>退出</title>
	<base href="<%=basePath%>">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
  <script>
  	function go(){
  		window.location.href="system/login.do";
  	}
  </script>
  </head>
  
  <body onload="go()">
  	等待退出。。。。稍等。。。。。
  </body>
</html>
