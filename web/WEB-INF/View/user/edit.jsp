<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<body>
	<script>
	$(function() {
		$('#userEditBtn').linkbutton( {
			iconCls : 'ok',
			text : '确认',
			onClick : function() {
				$('#userEditForm').form('submit');
			}
		});
		$('#userEditForm').form( {
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
				$('#userEditBox').dialog('clear');
				$('#userEditBox').dialog('close');
				$('#userListBox').datagrid('reload');
			}
		});
		$('#userEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#userEditBox').dialog('clear');
				$('#userEditBox').dialog('close');
			}
		});
		$("#echooseRoleInp").combobox({
			url:'role/show.do',
			valueField:'id',    
   			textField:'text'   
		});
		$("#echooseDeptInp").combobox({
			url:'department/show.do',
			valueField:'id',    
   			textField:'text'   
		});
	})
</script>
	<form id='userEditForm' method='post' action='user/update.do'>
		<input type='hidden' name='id' value='${bean.id }' />
			<table class="s_box">
			<tr>
				<td class="left" >
					性别：
				</td>
				<td class="right" style="line-height:36px;">
					男<input type="radio" name="sex" value="男" checked="checked"/>
					女<input type="radio" name="sex" value="女" 
						<c:if test="${bean.sex=='女' }">
							checked="checked"
						</c:if>
					/>
				</td>
			</tr>
			<tr>
				<td class="left" >
					电话：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="phone" type="text" value="${bean.phone }" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					邮箱：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="email" type="text" value="${bean.email }" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					地址：
				</td>
				<td class="right" >
					<input class='easyui-textbox' name="address" type="text" value="${bean.address }" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					角色：
				</td>
				<td class="right" >
					<input id="echooseRoleInp" name="rid" type="text"  value="${bean.rid }" />
				</td>
			</tr>
			<tr>
				<td class="left" >
					部门：
				</td>
				<td class="right" >
					<input id="echooseDeptInp" name="did" type="text" value="${bean.did }" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='userEditBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='userEditExit'>
					返回
				</div>
			</div>
		</div>
	</form>
</body>