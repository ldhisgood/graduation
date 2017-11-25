<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
		$("#equipmentConSaveBtn").linkbutton({
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				var conditions = $("#equipmentConSaveForm input").map(function(){
					var value = null;
					if($(this).val()){
						value = $(this).val();
					}
 					return ($(this).attr("name")+'='+value);
				}).get();
				for(var i=0;i<conditions.length;i++){
					var temp = conditions[i];
					if(temp.endWith("null")||temp.startWith("undefined")){
						conditions.splice(i,1);
						i--;
					}
				}
				var condition = conditions.join("&");
				alert(condition);
				var tab = $('#right').tabs('getSelected');  // 获取选择的面板
				tab.panel('refresh', 'equipment/conditionQuery.do?'+condition);
			}
		});
		$("#equipmentConSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				var tab = $('#right').tabs('getSelected');
				var index = $('#right').tabs('getTabIndex', tab);
				$("#right").tabs('close', index);
			}
		});
		$("#chooseEquipCateInpCon").combobox({
			url:'equipmentcategory/show.do',
			valueField:'id',    
   			textField:'text'   
		});
		$("#chooseUserStateInpCon").combobox({
			valueField:'id',    
   			textField:'text',
   			data:[
   				{"id":"在用","text":"在用"},
   				{"id":"未启用","text":"未启用"},
   				{"id":"出租","text":"出租"},
   				{"id":"停用","text":"停用"}
   			]
		});
		$("#chooseDepartmentInpCon").combobox({
			valueField:'id',    
   			textField:'text',
   			data:[
   				{"id":"办公室","text":"办公室"},
   				{"id":"质检部","text":"质检部"},
   				{"id":"生成部","text":"生成部"},
   				{"id":"维修部","text":"维修部"}
   			]
		});

</script>
	<form id="equipmentConSaveForm" method="post" action="equipment/conditionQuery.do">
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
					<input id="chooseEquipCateInpCon" class='easyui-textbox' name="cid" type="text" />
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
					<input id="chooseUserStateInpCon" class='easyui-textbox' name="useStatus" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
					使用部门：
				</td>
				<td class="right2">
					<input id="chooseDepartmentInpCon"  class='easyui-textbox' name="dname" type="text" />
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
				<div id='equipmentConSaveBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='equipmentConSaveExit'>
					返回
				</div>
			</div>
		</div>
		<div style="height:100px;"></div>
	</form>

</body>