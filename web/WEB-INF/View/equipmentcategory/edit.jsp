<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<body>
	<script>
	$(function() {
		$('#equipmentcategoryEditBtn').linkbutton( {
			iconCls : 'ok',
			text : '确认',
			onClick : function() {
				$('#equipmentcategoryEditForm').form('submit');
			}
		});
		$('#equipmentcategoryEditForm').form( {
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
				$('#equipmentcategoryEditBox').dialog('clear');
				$('#equipmentcategoryEditBox').dialog('close');
				$('#equipmentcategoryListBox').datagrid('reload');
			}
		});
		$('#equipmentcategoryEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#equipmentcategoryEditBox').dialog('clear');
				$('#equipmentcategoryEditBox').dialog('close');
			}
		});
	})
</script>
	<form id='equipmentcategoryEditForm' method='post'
		action='equipmentcategory/update.do'>
		<input type='hidden' name='id' value='${bean.id }' />
		<table class="s_box">
					<tr>
				<td class="left">
					设备分类名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="name" type="text" value="${bean.name }"/>
				</td>
			</tr>
			<tr>
				<td class="left">
					有效性：
				</td>
				<td class="right">
					<select name="del">
						<option value="0" selected="selected">有效</option>
						<option value="1"
						<c:if test="${bean.del==1 }">
							selected="selected"
						</c:if>
						>无效</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="left">
					说明：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="info" type="text" value="${bean.info }" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='equipmentcategoryEditBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='equipmentcategoryEditExit'>
					返回
				</div>
			</div>
		</div>
	</form>
</body>