<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<body>
	<script>
	$(function() {
		$('#roleEditBtn').linkbutton( {
			iconCls : 'ok',
			text : '确认',
			onClick : function() {
				$('#roleEditForm').form('submit');
			}
		});
		$('#roleEditForm').form( {
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
				$('#roleEditBox').dialog('clear');
				$('#roleEditBox').dialog('close');
				$('#roleListBox').datagrid('reload');
			}
		});
		$('#roleEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#roleEditBox').dialog('clear');
				$('#roleEditBox').dialog('close');
			}
		});
	})
</script>
	<form id='roleEditForm' method='post' action='role/update.do'>
		<input type='hidden' name='id' value='${bean.id }' />
			<table class="s_box">
			<tr>
				<td class="left" >
					角色名称：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="name" type="text" value="${bean.name }" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					描述：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="ext1" type="text" value="${bean.ext1 }" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id="roleEditBtn">
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id="roleEditExit">
					返回
				</div>
			</div>
		</div>
	</form>
</body>