<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><body>
	<script>
	$(function() {
		$('#maintainplanEditBtn').linkbutton( {
			iconCls : 'ok',
			text : '确认',
			onClick : function() {
				$('#maintainplanEditForm').form('submit');
			}
		});
		$('#maintainplanEditForm').form( {
			onSubmit : function() {
				var isValid = $(this).form('validate');
				if (!isValid) {
				}
				return true;
			},
			success : function(data) {
				$.messager.show( {
					title : '提示',
					msg : '修改成功',
					showType : 'slide',
					outTime : '1000'
				});
				$('#maintainplanEditBox').dialog('clear');
				$('#maintainplanEditBox').dialog('close');
				$('#maintainplanListBox').datagrid('reload');
			}
		});
		$('#maintainplanEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#maintainplanEditBox').dialog('clear');
				$('#maintainplanEditBox').dialog('close');
			}
		});
		$("#chooseEMaintianplanInp").combobox({
			valueField:'id',    
   			textField:'text',
   			data:[
   				{"id":"启动","text":"启动"},
   				{"id":"未启用","text":"未启用"}
   			]
		});
	})
</script>
	<form id='maintainplanEditForm' method='post'
		action='maintainplan/update.do'>
		<input type='hidden' name='id' value='${bean.id }' />
		<table class="s_box">
			<tr>
				<td class="left">
					责任人：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="man" type="text"
						value="${bean.man }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					计划维修时间：
				</td>
				<td class="right">
					<input class='easyui-datebox' name="dotime" type="text"
						value="${bean.dotime }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					状态:
				</td>
				<td class="right">
					<input id="chooseEMaintianplanInp" class='easyui-textbox' name="state" type="text"
						value="${bean.state }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					项目名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="project" type="text"
						value="${bean.project }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					项目标准：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="standard" type="text"
						value="${bean.standard }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					详细信息：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="info" type="text"
						value="${bean.info }" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='maintainplanEditBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='maintainplanEditExit'>
					返回
				</div>
			</div>
		</div>
	</form>
</body>