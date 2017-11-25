<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {

		$("#supplierSaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#supplierSaveForm').form('submit');
			}
		});
		$('#supplierSaveForm').form( {
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
				$('#supplierSaveBox').dialog('clear');
				$('#supplierSaveBox').dialog('close');
				$('#supplierListBox').datagrid('reload');
			}
		});
		$("#supplierSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#supplierSaveBox').dialog('clear');
				$('#supplierSaveBox').dialog('close');
			}
		});

	})
</script>
	<form id="supplierSaveForm" method="post" action="supplier/save.do">
		<table class="s_box">
			<tr>
				<td class="left">
					企业名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="name" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					地址：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="address" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					联系人：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="contact" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					电话：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="telphone" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					备注：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="remark" type="text" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='supplierSaveBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='supplierSaveExit'>
					返回
				</div>
			</div>
		</div>
	</form>

</body>