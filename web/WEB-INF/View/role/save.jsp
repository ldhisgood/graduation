<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {

		$("#roleSaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#roleSaveForm').form('submit');
			}
		});
		$('#roleSaveForm').form( {
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
				$('#roleSaveBox').dialog('clear');
				$('#roleSaveBox').dialog('close');
				$('#roleListBox').datagrid('reload');
			}
		});
		$("#roleSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#roleSaveBox').dialog('clear');
				$('#roleSaveBox').dialog('close');
			}
		});

	})
</script>
	<form id="roleSaveForm" method="post" action="role/save.do">
		<table class="s_box">
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="name" type="text"
						value="请输入用户名" />
				</td>
			</tr>
			<tr>
				<td class="left">
					描述：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="ext1" type="text" />
				</td>
			</tr>
		</table>

		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id="roleSaveBtn">
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id="roleSaveExit">
					返回
				</div>
			</div>
		</div>
	</form>

</body>