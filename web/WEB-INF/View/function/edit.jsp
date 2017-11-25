<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><body>
	<script>
	$(function() {
		$('#functionEditBtn').linkbutton( {
			iconCls : 'ok',
			text : '确认',
			onClick : function() {
				$('#functionEditForm').form('submit');
			}
		});
		$('#functionEditForm').form( {
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
				$('#functionEditBox').dialog('clear');
				$('#functionEditBox').dialog('close');
				$('#functionListBox').datagrid('reload');
			}
		});
		$('#functionEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#functionEditBox').dialog('clear');
				$('#functionEditBox').dialog('close');
			}
		});
		$("#functionEditPid").combobox({
			url:'function/show.do',
			valueField:'id',    
   			textField:'text'   
		});
	})
</script>
	<form id='functionEditForm' method='post' action='function/update.do'>
		<input type='hidden' name='id' value='${bean.id }' />
			<table class="s_box">
			<tr>
				<td class="left" >
					功能名称：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="name" type="text" value="${bean.name }" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					连接地址
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="href" type="text" value="${bean.href }" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					父级
				</td>
				<td class="right" >
					<input id="functionEditPid" name="fid" value="${bean.fid }"/>
				</td>
			</tr>
			<tr>
				<td class="left" >
					功能位置
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="ext2" type="text" value="${bean.ext2 }"/>
				</td>
			</tr>
		</table>

		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id="functionEditBtn">
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id="functionEditExit">
					返回
				</div>
			</div>
		</div>
	</form>
</body>