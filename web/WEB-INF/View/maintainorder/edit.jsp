<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><body>
	<script>
	$(function() {
		$('#maintainorderEditBtn').linkbutton( {
			iconCls : 'ok',
			text : '确认',
			onClick : function() {
				$('#maintainorderEditForm').form('submit');
			}
		});
		$('#maintainorderEditForm').form( {
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
				$('#maintainorderEditBox').dialog('clear');
				$('#maintainorderEditBox').dialog('close');
				$('#maintainorderListBox').datagrid('reload');
			}
		});
		$('#maintainorderEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#maintainorderEditBox').dialog('clear');
				$('#maintainorderEditBox').dialog('close');
			}
		});
	})
</script>
	<form id='maintainorderEditForm' method='post'
		action='maintainorder/update.do'>
		<input type='hidden' name='id' value='${bean.id }' />
		<table class="s_box">
			<tr>
				<td class="left">
					维修级别：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="mlevel" type="text"
						value="${bean.mlevel }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					维修人：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="man" type="text"
						value="${bean.man }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					执行时间：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="dotime" type="text"
						value="${bean.dotime }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					维修项目：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="project" type="text"
						value="${bean.project }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					维修标准：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="standard" type="text"
						value="${bean.standard }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					维修信息：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="info" type="text"
						value="${bean.info }" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='maintainorderEditBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='maintainorderEditExit'>
					返回
				</div>
			</div>
		</div>
	</form>
</body>