<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {

		$("#maintainplanSaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#maintainplanSaveForm').form('submit');
			}
		});
		$('#maintainplanSaveForm').form( {
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
				$('#maintainplanSaveBox').dialog('clear');
				$('#maintainplanSaveBox').dialog('close');
				$('#maintainplanListBox').datagrid('reload');
			}
		});
		$("#maintainplanSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				var tab = $('#right').tabs('getSelected');
				var index = $('#right').tabs('getTabIndex', tab);
				$("#right").tabs('close', index);
			}
		});
		//设置自动补全
		$("#maintianplan_serach_btn").linkbutton({
			text:'查找',
			onClick:function (){
				
				var value = $("#maintianplan_serach").val();
				getEquipment(value);
			}
		})
		function getEquipment(num){
			var url = "equipment/queryByNum.do";
			$.post(url,{"num":num},function(data){
				$("#maintianplan_id").val(data.id);
				$("#maintianplan_mname").textbox('setValue',data.name);
				$("#maintianplan_num").textbox('setValue',data.num);
				$("#maintianplan_unit").textbox('setValue',data.unit);
				$("#maintianplan_dname").textbox('setValue',data.dname);
			});
		}
		$("#chooseMaintianplanInp").combobox({
			valueField:'id',    
   			textField:'text',
   			data:[
   				{"id":"启动","text":"启动"},
   				{"id":"未启用","text":"未启用"}
   			]
		});
	});
</script>
	<form id="maintainplanSaveForm" method="post"
		action="maintainplan/save.do">
		<table class="s_box">
			<tr>
				<td class="left2">
					设备编号：
				</td>
				<td class="right2">
					<input class="easyui-textbox" id="maintianplan_serach" type="text" />
				</td> 
				<td class="left2">
					<span id="maintianplan_serach_btn"></span>
				</td>
				<td class="right2">
				
				</td>
			</tr>
			<tr>
				<td class="left2">设备信息&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan="3"><hr/></td>
			</tr>
			<tr>
				<td class="left2">
					设备名称：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="maintianplan_mname" name="mname" type="text" data-options="editable:false"/>
					<input id="maintianplan_id" name="eid" type="hidden" />
				</td>
				<td class="left2">
					设备编号：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="maintianplan_num" name="num" type="text" data-options="editable:false"/>
				</td>
			</tr>
			<tr>
				<td class="left2">
					规格型号：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="maintianplan_unit" name="unit" type="text" data-options="editable:false"/>
				</td>
				<td class="left2">
					使用部门：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="maintianplan_dname" name="dname" type="text" data-options="editable:false" />
				</td>
			</tr>
			<tr>
				<td class="left2">设备维修信息&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan="3"><hr/></td>
			</tr>
			<tr>
				<td class="left2">
					维修级别：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="mlevel" type="text" />
				</td>
				<td class="left2">
					循环方式：
				</td>
				<td class="right2">
					<input name="method" type="radio" value="一次"/>一次
					<input name="method" type="radio" value="周循环"/>周循环
					<input name="method" type="radio" value="月循环"/>月循环
				</td>
			</tr>
			<tr>
				<td class="left2">
					维修人员：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="man" type="text" />
				</td>
				<td class="left2">
					计划维修时间：
				</td>
				<td class="right2">
					<input class='easyui-datebox' name="dotime" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
					状态：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="chooseMaintianplanInp" name="state" type="text" />
				</td>
				<td class="left2">
					维修项目：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="project" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
					维修标准：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="standard" type="text" />
				</td>
				<td class="left2">
					维修详情：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="info" type="text" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='maintainplanSaveBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='maintainplanSaveExit'>
					返回
				</div>
			</div>
		</div>
	</form>

</body>