<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><body>
	<script>
	$(function() {
		$('#departmentEditBtn').linkbutton( {
			iconCls : 'ok',
			text : '确认',
			onClick : function() {
				$('#departmentEditForm').form('submit');
			}
		});
		$('#departmentEditForm').form( {
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
				$('#departmentEditBox').dialog('clear');
				$('#departmentEditBox').dialog('close');
				$('#departmentListBox').datagrid('reload');
			}
		});
		$('#departmentEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#departmentEditBox').dialog('clear');
				$('#departmentEditBox').dialog('close');
			}
		});
	})
</script>
	<form id='departmentEditForm' method='post'
		action='department/update.do'>
		<input type='hidden' name='id' value='${bean.id }' />
		<table class="s_box">
			<tr>
				<td class="left">
					部门名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="name" type="text" value="${bean.name }" />
				</td>
			</tr>
<!--			<tr>-->
<!--				<td class="left">-->
<!--					所属部门-->
<!--				</td>-->
<!--				<td class="right">-->
<!--					<input class='easyui-textbox' name="fid" type="text" value="${bean.fid }"/>-->
<!--				</td>-->
<!--			</tr>-->
			<tr>
				<td class="left">
					简称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="jc" type="text" value="${bean.jc }"/>
				</td>
			</tr>
			<tr>
				<td class="left">
					管理人：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="man" type="text" value="${bean.man }"/>
				</td>
			</tr>
			<tr>
				<td class="left">
					部门电话：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="phone" type="text" value="${bean.phone }"/>
				</td>
			</tr>
			<tr>
				<td class="left">
					部门传真：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="email" type="text" value="${bean.email }"/>
				</td>
			</tr>
			<tr>
				<td class="left">
					部门信息：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="info" type="text" value="${bean.info }"/>
				</td>
			</tr>
			<tr>
				<td class="left">
					部门级别：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="level" type="text" value="${bean.level }"/>
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='departmentEditBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='departmentEditExit'>
					返回
				</div>
			</div>
		</div>
	</form>
</body>