<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {

		$("#maintainorderSaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#maintainorderSaveForm').form('submit');
			}
		});
		$('#maintainorderSaveForm').form( {
			onSubmit : function() {
				var isValid = $(this).form('validate');
				if (!isValid) {
				}
				return true;
			},
			success : function(data) {
				$("#maintainorderSaveForm input").val("");
				$.messager.show( {
					title : '提示',
					msg : '保存成功',
					showType : 'slide',
					outTime : '1000'
				});
				$('#maintainorderSaveBox').dialog('clear');
				$('#maintainorderSaveBox').dialog('close');
				$('#maintainorderListBox').datagrid('reload');
			}
		});
		$("#maintainorderSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				var tab = $('#right').tabs('getSelected');
				var index = $('#right').tabs('getTabIndex', tab);
				$("#right").tabs('close', index);
			}
		});
		//设置自动补全
		$("#maintianorder_serach_btn").linkbutton({
			text:'查找',
			onClick:function (){
				
				var value = $("#maintianorder_serach").val();
				getEquipment(value);
			}
		})
		function getEquipment(num){
			var url = "equipment/queryByNum.do";
			$.post(url,{"num":num},function(data){
				$("#maintianorder_id").val(data.id);
				$("#maintianorder_mname").textbox('setValue',data.name);
				$("#maintianorder_num").textbox('setValue',data.num);
				$("#maintianorder_unit").textbox('setValue',data.unit);
				$("#maintianorder_dname").textbox('setValue',data.dname);
			});
		}
		$("#chooseMaintianorderInp").combobox({
			valueField:'id',    
   			textField:'text',
   			data:[
   				{"id":"启动","text":"启动"},
   				{"id":"未启用","text":"未启用"}
   			]
		});
	});
</script>
	<form id="maintainorderSaveForm" method="post"
		action="maintainorder/save.do">
		<table class="s_box">
			<tr>
				<td class="left2">
					设备编号：
				</td>
				<td class="right2">
					<input class="easyui-textbox" id="maintianorder_serach" type="text" />
				</td> 
				<td class="left2">
					<span id="maintianorder_serach_btn"></span>
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
					<input class='easyui-textbox' id="maintianorder_mname" name="mname" type="text" data-options="editable:false"/>
					<input id="maintianorder_id" name="eid" type="hidden" />
				</td>
				<td class="left2">
					设备编号：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="maintianorder_num" name="dnum" type="text" data-options="editable:false"/>
				</td>
			</tr>
			<tr>
				<td class="left2">
					规格型号：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="maintianorder_unit" name="unit" type="text" data-options="editable:false"/>
				</td>
				<td class="left2">
					使用部门：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="maintianorder_dname" name="dname" type="text" data-options="editable:false" />
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
					维修人员：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="man" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
					维修项目：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="project" type="text" />
				</td>
				<td class="left2">
					维修标准：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="standard" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
					维修详情：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="info" type="text" />
				</td>
				<td class="left2">
				</td>
				<td class="right2">
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='maintainorderSaveBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='maintainorderSaveExit'>
					返回
				</div>
			</div>
		</div>
	</form>

</body>