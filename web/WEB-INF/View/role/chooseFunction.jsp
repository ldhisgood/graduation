<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<body>
	<script>
	$(function() {

		$("#roleChooseBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#roleChooseForm').form('submit');
			}
		});
		$('#roleChooseForm').form( {
			onSubmit : function() {
				var mbc ="";
				var jfids = $(".role_chooseInp");
				jfids.each(function(){
					if(true==this.checked){
						mbc+=$(this).val()+",";
					}
				});
				if(mbc.length>0)
					mbc = mbc.substring(0,mbc.length-1);
				$("#fids").val(mbc);
				$("#zhezhao").show();
				return true;
			},
			success : function(data) {
				$("#zhezhao").hide();
				$.messager.show( {
					title : '提示',
					msg : '保存成功',
					showType : 'slide',
					outTime : '1000'
				});
				$('#roleChooseBox').dialog('clear');
				$('#roleChooseBox').dialog('close');
				$('#roleListBox').datagrid('reload');
			}
		});
		$("#roleChooseExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#roleChooseBox').dialog('clear');
				$('#roleChooseBox').dialog('close');
			}
		});

	})
</script>
	<form id="roleChooseForm" method="post" action="trf/save.do">
		<input name="rid" type="hidden" value="${rid }"/>
		<input id="fids" name="fids" type="hidden" value=""/>
		<c:forEach items="${list }" var="one">
			<div class="role_choose"><input class="role_chooseInp" type="checkbox" checked="checked" value="${one.id }"> ${one.name }	</div>
		</c:forEach>
		<c:forEach items="${unlist }" var="one">
			<div class="role_choose"><input class="role_chooseInp" type="checkbox" value="${one.id }"> ${one.name }</div>
		</c:forEach>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id="roleChooseBtn">
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id="roleChooseExit">
					返回
				</div>
			</div>
		</div>
	</form>
	
</body>