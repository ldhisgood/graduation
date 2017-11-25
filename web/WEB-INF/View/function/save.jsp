<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {
		$("#functionSaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#functionSaveForm').form('submit');
			}
		});
		$('#functionSaveForm').form( {
			onSubmit : function() {
				var isValid = $(this).form('validate');
				if (!isValid) {
				}
				return true;
			},
			success : function(data) {
				$.messager.show( {
					title : '提示',
					msg : '保存成功',
					showType : 'slide',
					outTime : '1000'
				});
				$('#functionSaveBox').dialog('clear');
				$('#functionSaveBox').dialog('close');
				$('#functionListBox').datagrid('reload');
			}
		});
		$("#functionSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#functionSaveBox').dialog('clear');
				$('#functionSaveBox').dialog('close');
			}
		});
		$("#functionPid").combobox({
			url:'function/show.do',
			valueField:'id',    
   			textField:'text'   
		});
	});
</script>
	<form id="functionSaveForm" method="post" action="function/save.do">
		<table class="s_box">
			<tr>
				<td class="left" >
					功能名称：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="name" type="text" value="请输入用户名" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					连接地址
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="href" type="text"  />
				</td>
			</tr>
			<tr>
				<td class="left" >
					功能位置
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="ext2" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					父级
				</td>
				<td class="right" >
					<input id="functionPid" name="fid"/>
				</td>
			</tr>
		</table>

		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id="functionSaveBtn">
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id="functionSaveExit">
					返回
				</div>
			</div>
		</div>
	</form>

</body>