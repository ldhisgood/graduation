<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><body>
	<script>
	$(function() {
		$('#equipmentEditBtn').linkbutton( {
			iconCls : 'ok',
			text : '确认',
			onClick : function() {
				$('#equipmentEditForm').form('submit');
			}
		});
		$('#equipmentEditForm').form( {
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
				$('#equipmentEditBox').dialog('clear');
				$('#equipmentEditBox').dialog('close');
				$('#equipmentListBox').datagrid('reload');
			}
		});
		$('#equipmentEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#equipmentEditBox').dialog('clear');
				$('#equipmentEditBox').dialog('close');
			}
		});
	})
</script>
	<form id='equipmentEditForm' method='post' action='equipment/update.do'>
		<input type='hidden' name='id' value='${bean.id }' />
		<table class="s_box">
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="name" type="text"
						value="${name }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="num" type="text"
						value="${num }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="unit" type="text"
						value="${unit }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="cid" type="text"
						value="${cid }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="category" type="text"
						value="${category }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="creater" type="text"
						value="${creater }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="supplier" type="text"
						value="${supplier }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="flag" type="text"
						value="${flag }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="intime" type="text"
						value="${intime }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="certifier" type="text"
						value="${certifier }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="deperction" type="text"
						value="${deperction }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="perPrice" type="text"
						value="${perPrice }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="rate" type="text"
						value="${rate }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="checkRound" type="text"
						value="${checkRound }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="preCheck" type="text"
						value="${preCheck }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="nextCheck" type="text"
						value="${nextCheck }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="preMaintain" type="text"
						value="${preMaintain }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="useStatus" type="text"
						value="${useStatus }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="did" type="text"
						value="${did }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="dname" type="text"
						value="${dname }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="operator" type="text"
						value="${operator }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="place" type="text"
						value="${place }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="ext1" type="text"
						value="${ext1 }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="ext7" type="text"
						value="${ext7 }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="ext2" type="text"
						value="${ext2 }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="ext3" type="text"
						value="${ext3 }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="ext4" type="text"
						value="${ext4 }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="ext5" type="text"
						value="${ext5 }" />
				</td>
			</tr>
			<tr>
				<td class="left">
					角色名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="ext6" type="text"
						value="${ext6 }" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='equipmentEditBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='equipmentEditExit'>
					返回
				</div>
			</div>
		</div>
	</form>
</body>