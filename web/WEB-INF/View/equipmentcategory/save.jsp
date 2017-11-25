<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {

		$("#equipmentcategorySaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#equipmentcategorySaveForm').form('submit');
			}
		});
		$('#equipmentcategorySaveForm').form( {
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
				$('#equipmentcategorySaveBox').dialog('clear');
				$('#equipmentcategorySaveBox').dialog('close');
				$('#equipmentcategoryListBox').datagrid('reload');
			}
		});
		$("#equipmentcategorySaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#equipmentcategorySaveBox').dialog('clear');
				$('#equipmentcategorySaveBox').dialog('close');
			}
		});

	})
</script>
	<form id="equipmentcategorySaveForm" method="post"
		action="equipmentcategory/save.do">
		<table class="s_box">
			<tr>
				<td class="left">
					设备分类名称：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="name" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left">
					有效性：
				</td>
				<td class="right">
					<select name="del">
						<option value="0" selected="selected">有效</option>
						<option value="1">无效</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="left">
					说明：
				</td>
				<td class="right">
					<input class='easyui-textbox' name="info" type="text" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='equipmentcategorySaveBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='equipmentcategorySaveExit'>
					返回
				</div>
			</div>
		</div>
	</form>

</body>