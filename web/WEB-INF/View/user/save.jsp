<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {
		$("#userSaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#userSaveForm').form('submit');
			}
		});
		$('#userSaveForm').form( {
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
				$('#userSaveBox').dialog('clear');
				$('#userSaveBox').dialog('close');
				$('#userListBox').datagrid('reload');
			}
		});
		$("#userSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#userSaveBox').dialog('clear');
				$('#userSaveBox').dialog('close');
			}
		});
		$("#chooseRoleInp").combobox({
			url:'role/show.do',
			valueField:'id',    
   			textField:'text'   
		});
		$("#chooseDeptInp").combobox({
			url:'department/show.do',
			valueField:'id',    
   			textField:'text'   
		});
	})
</script>
	<form id="userSaveForm" method="post" action="user/save.do">
		<table class="s_box">
			<tr>
				<td class="left" >
					用户名:
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="uname" type="text" value="请输入用户名" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					密码：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="pwd" type="password" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					确认密码
				</td>
				<td class="right" >
					<input class='easyui-textbox' type="password" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					真是姓名：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="truename" type="text"  />
				</td>
			</tr>
			<tr>
				<td class="left" >
					性别：
				</td>
				<td class="right" style="line-height:36px;">
					男<input type="radio" name="sex" value="0" checked="checked"/>
					女<input type="radio" name="sex" value="1"/>
				</td>
			</tr>
			<tr>
				<td class="left" >
					电话：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="phone" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					邮箱：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="email" type="text"  />
				</td>
			</tr>
			<tr>
				<td class="left" >
					地址：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="address" type="text"  />
				</td>
			</tr>
			<tr>
				<td class="left" >
					角色：
				</td>
				<td class="right" >
					<input id="chooseRoleInp" name="rid" type="text"  />
				</td>
			</tr>
			<tr>
				<td class="left" >
					部门：
				</td>
				<td class="right" >
					<input id="chooseDeptInp" name="did" type="text"  />
				</td>
			</tr>
		</table>

		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id="userSaveBtn">
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id="userSaveExit">
					返回
				</div>
			</div>
		</div>
	</form>

</body>