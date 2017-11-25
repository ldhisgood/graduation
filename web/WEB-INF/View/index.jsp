<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="content-type" content="text/html;charset=utf-8"> 
		<%@include file="easyui.jsp" %>
		<title>首页</title>
	</head>
	<body style="position:relative;">
		<script type="text/javascript">
			$(function (){
				$('#frame').layout({
					fit:true
				});
				$('#frame').layout('add',{
					region:'north',
					href:'system/top.do',
					height:120,
					content:'come in'
				});
				$('#frame').layout('add',{
					region:'west',
					width:200,
					href:'system/left.do',
					title:'菜单'
				});
				$('#frame').layout('add',{
					region:'center',
					href:'right.do',
					title:'操作界面'
				});
			});
		</script>
		<div id="zhezhao" style="width:2000px;height:2000px;position:absolute;z-index:9019;background-color:#ccc;display:none;filter:alpha(opacity=50);-moz-opacity:0.5;opacity:0.5;"> </div>
		<div id="frame"></div>
	</body>
</html>