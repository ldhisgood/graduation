<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {

		$("#equipmentSaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#equipmentSaveForm').form('submit');
			}
		});
		$('#equipmentSaveForm').form( {
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
				$('#equipmentSaveBox').dialog('clear');
				$('#equipmentSaveBox').dialog('close');
				$('#equipmentListBox').datagrid('reload');
			}
		});
		$("#equipmentSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				var tab = $('#right').tabs('getSelected');
				var index = $('#right').tabs('getTabIndex', tab);
				$("#right").tabs('close', index);
			}
		});
		$("#chooseEquipCateInp").combobox({
			url:'equipmentcategory/show.do',
			valueField:'id',    
   			textField:'text'   
		});
		$("#chooseSupplierInp").combobox({
			url:'supplier/show.do',
			valueField:'id',    
   			textField:'text'   
		});
		$("#chooseUserStateInp").combobox({
			valueField:'id',    
   			textField:'text',
   			data:[
   				{"id":"在用","text":"在用"},
   				{"id":"未启用","text":"未启用"},
   				{"id":"出租","text":"出租"},
   				{"id":"停用","text":"停用"}
   			]
		});
		$("#chooseDepartmentInp").combobox({
			valueField:'id',    
   			textField:'text',
   			data:[
   				{"id":"办公室","text":"办公室"},
   				{"id":"质检部","text":"质检部"},
   				{"id":"生成部","text":"生成部"},
   				{"id":"维修部","text":"维修部"}
   			]
		});
	})
</script>
	<form id="equipmentSaveForm" method="post" action="equipment/save.do">
		<table class="s_box">
			<tr>
				<td class="left2">
					设备名称：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="name" type="text" />
				</td>
				<td class="left2">
				</td>
				<td class="right2">
				</td>
			</tr>
			<tr>
				<td class="left2">
					设备规格：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="unit" type="text" />
				</td>
				<td class="left2">
					类型：
				</td>
				<td class="right2">
					<input id="chooseEquipCateInp" class='easyui-textbox' name="cid" type="text" />
				</td>
			</tr>
			<tr>
<!--				<td class="left2">-->
<!--					类型：-->
<!--				</td>-->
<!--				<td class="right2">-->
<!--					<input class='easyui-textbox' name="category" type="text" />-->
<!--				</td>-->
				<td class="left2">
					生成商：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="creater" type="text" />
				</td>
				<td class="left2">
					供应商：
				</td>
				<td class="right2">
					<input id="chooseSupplierInp" class='easyui-textbox' name="sid" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
					设备标示：
				</td>
				<td class="right2">
					<input name="flag" type="radio"  value="0"/>重型设备&nbsp;&nbsp;
					<input name="flag" type="radio"  value="1"/>轻型设备&nbsp;&nbsp;
					<input name="flag" type="radio"  value="2"/>其他设备&nbsp;&nbsp;
				</td>
				<td class="left2">
				</td>
				<td class="right2">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<hr />
				</td>
			</tr>
			<tr>
				<td class="left2">
					购入时间：
				</td>
				<td class="right2">
					<input name="intime" type="text"  class= "easyui-datebox" required ="required"/>
				</td>
				<td class="left2">
					资产证明人：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="certifier" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
					折旧方式：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="deperction" type="text" />
				</td>
				<td class="left2">
					资产原值：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="perPrice" type="text" />（元）
				</td>
			</tr>
			<tr>
				<td class="left2">
					净残率：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="rate" type="text" />（%）
				</td>
				<td class="left2">
				</td>
				<td class="right2">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<hr />
				</td>
			</tr>
			<tr>

				<td class="left2">
					检验周期：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="checkRound" type="text" />
				</td>
				<td class="left2">
				</td>
				<td class="right2">
				</td>
			</tr>
			<tr>
				<td class="left2">
					上次检验：
				</td>
				<td class="right2">
					<input class= "easyui-datebox" required ="required" name="preCheck" type="text" />
				</td>
				<td class="left2">
					下次检验：
				</td>
				<td class="right2">
					<input class= "easyui-datebox" required ="required" name="nextCheck" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
					上次维修：
				</td>
				<td class="right2">
					<input class= "easyui-datebox" required ="required" name="preMaintain" type="text" />
				</td>
				<td class="left2">
					使用情况：
				</td>
				<td class="right2">
					<input id="chooseUserStateInp" class='easyui-textbox' name="useStatus" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
					使用部门：
				</td>
				<td class="right2">
					<input id="chooseDepartmentInp"  class='easyui-textbox' name="dname" type="text" />
				</td>
				<td class="left2">
					地点：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="place" type="text" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='equipmentSaveBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='equipmentSaveExit'>
					返回
				</div>
			</div>
		</div>
		<div style="height:100px;"></div>
	</form>

</body>