<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {

		$("#departmentSaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#departmentSaveForm').form('submit');
			}
		});
		$('#departmentSaveForm').form( {
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
				$('#departmentSaveBox').dialog('clear');
				$('#departmentSaveBox').dialog('close');
				$('#departmentListBox').datagrid('reload');
			}
		});
		$("#departmentSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#departmentSaveBox').dialog('clear');
				$('#departmentSaveBox').dialog('close');
			}
		});

	})
</script>
	<form id="departmentSaveForm" method="post" action="department/save.do">
		<table class="s_box">
			<tr>
				<td class="left">
					部门名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="name" type="text" />
				</td>
			</tr>
<!--			<tr>-->
<!--				<td class="left">-->
<!--					所属部门-->
<!--				</td>-->
<!--				<td class="right">-->
<!--					<input class='easyui-textbox' name="fid" type="text" />-->
<!--				</td>-->
<!--			</tr>-->
			<tr>
				<td class="left">
					简称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="jc" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					管理人：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="man" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					部门电话：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="phone" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					部门传真：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="email" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					部门信息：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="info" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					部门级别：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="level" type="text" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='departmentSaveBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='departmentSaveExit'>
					返回
				</div>
			</div>
		</div>
	</form>

</body>