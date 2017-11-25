<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<script>
  		$(function (){
  			$.post("report/queryCount.do",{"s_j":new Date()},function(data){
  				//柱状图图示例
				chart = new Highcharts.Chart({
		                chart: {
		                    renderTo: 'reportCount',          //放置图表的容器
		                  plotBackgroundColor: null,
				          plotBorderWidth: null,
				          defaultSeriesType: 'line'  
		                },
		                title: {
		                    text: 'JQuery柱状图演示'
		                }, 
		                xAxis: {//X轴数据
		                    categories: ['一月份', '二月份', '三月份', '四月份', '五月份', '六月份', '七月份', '八月份', '九月份', '十月份', '十一月份', '十二月份', '十三月份', '十四月份'],
		                    labels: {
		                        rotation: -45, //字体倾斜
		                        align: 'right',
		                        style: { font: 'normal 13px 宋体' }
		                    }
		                },
		                yAxis: {//Y轴显示文字
		                    title: {
		                        text: '元'
		                    }
		                },
		                tooltip: {
		                    enabled: true,
		                    formatter: function() {
		                        return '<b>' + this.x + '</b><br/>' + this.series.name + ': ' + Highcharts.numberFormat(this.y, 1) + "百万";
		                    }
		                },
		                plotOptions: {
		                    column: {
		                        dataLabels: {
		                            enabled: true
		                        },
		                        enableMouseTracking: true//是否显示title
		                    }
		                },
		                series:data
		          });
		  	    	$(window).resize();
		  	});
		  });
  		
  	</script>
  	<div id="reportCount"></div>
  </body>
</html>
