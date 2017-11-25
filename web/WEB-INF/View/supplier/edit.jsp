<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><body>
	<script>
	$(function() {
		$('#supplierEditBtn').linkbutton( {
			iconCls : 'ok',
			text : '确认',
			onClick : function() {
				$('#supplierEditForm').form('submit');
			}
		});
		$('#supplierEditForm').form( {
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
				$('#supplierEditBox').dialog('clear');
				$('#supplierEditBox').dialog('close');
				$('#supplierListBox').datagrid('reload');
			}
		});
		$('#supplierEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#supplierEditBox').dialog('clear');
				$('#supplierEditBox').dialog('close');
			}
		});
	})
</script>
	<form id='supplierEditForm' method='post' action='supplier/update.do'>
		<input type='hidden' name='id' value='${bean.id }' />
		<table class="s_box">
			<tr>
				<td class="left">
					企业名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="name" type="text"
						value="${name }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					地址：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="address" type="text"
						value="${address }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					联系人：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="contact" type="text"
						value="${contact }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					电话：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="telphone" type="text"
						value="${telphone }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					冗余：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="remark" type="text"
						value="${remark }" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='supplierEditBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='supplierEditExit'>
					返回
				</div>
			</div>
		</div>
	</form>
</body>