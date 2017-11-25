<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script>
	$(function() {

		$("#protectSaveBtn").linkbutton( {
			iconCls : 'ok',
			text : '保存',
			onClick : function() {
				$('#protectSaveForm').form('submit');
			}
		});
		$('#protectSaveForm').form( {
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
				$('#protectSaveBox').dialog('clear');
				$('#protectSaveBox').dialog('close');
				$('#protectListBox').datagrid('reload');
			}
		});
		$("#protectSaveExit").linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				var tab = $('#right').tabs('getSelected');
				var index = $('#right').tabs('getTabIndex', tab);
				$("#right").tabs('close', index);
			}
		});
		//设置自动补全
		$("#protect_serach_btn").linkbutton({
			text:'查找',
			onClick:function (){
				
				var value = $("#protect_serach").val();
				getEquipment(value);
			}
		})
		function getEquipment(num){
			var url = "equipment/queryByNum.do";
			$.post(url,{"num":num},function(data){
				$("#protect_id").val(data.id);
				$("#protect_mname").textbox('setValue',data.name);
				$("#protect_num").textbox('setValue',data.num);
				$("#protect_unit").textbox('setValue',data.unit);
				$("#protect_dname").textbox('setValue',data.dname);
			});
		}
		$("#chooseProtectInp").combobox({
			valueField:'id',    
   			textField:'text',
   			data:[
   				{"id":"有效","text":"有效"},
   				{"id":"已结束","text":"已结束"},
   				{"id":"保养中","text":"保养中"}
   			]
		});
	});
</script>
	<form id="protectSaveForm" method="post"
		action="protect/save.do">
		<table class="s_box">
			<tr>
				<td class="left2">
					设备编号：
				</td>
				<td class="right2">
					<input class="easyui-textbox" id="protect_serach" type="text" />
				</td> 
				<td class="left2">
					<span id="protect_serach_btn"></span>
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
					<input class='easyui-textbox' id="protect_mname" name="mname" type="text" data-options="editable:false"/>
					<input id="protect_id" name="eid" type="hidden" />
				</td>
				<td class="left2">
					设备编号：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="protect_num" name="num" type="text" data-options="editable:false"/>
				</td>
			</tr>
			<tr>
				<td class="left2">
					规格型号：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="protect_unit" name="unit" type="text" data-options="editable:false"/>
				</td>
				<td class="left2">
					使用部门：
				</td>
				<td class="right2">
					<input class='easyui-textbox' id="protect_dname" name="dname" type="text" data-options="editable:false" />
				</td>
			</tr>
			<tr>
				<td class="left2">设备保养信息&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan="3"><hr/></td>
			</tr>
			<tr>
				<td class="left2">
					保养级别：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="mlevel" type="text" />
				</td>
				<td class="left2">
					计划类型：
				</td>
				<td class="right2">
					<input name="method" type="radio" value="执行一次"/>执行一次
					<input name="method" type="radio" value="循环多次"/>循环多次
				</td>
			</tr>
			<tr>
				<td class="left2">
					保养人员：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="man" type="text" />
				</td>
				<td class="left2">
					下次保养时间：
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
				 	<input class='easyui-textbox' id="chooseProtectInp" name="state" type="text" />
				</td>
				 <td class="left2">
					保养项目：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="project" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
						计划单号：
				</td>
				<td class="right2">
						<input class='easyui-textbox' name="plannum" type="text" />
				</td>
				<td class="left2">
					保养标准：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="standard" type="text" />
				</td>
			</tr>
			<tr>
				<td class="left2">
						计划保养内容：
				</td>
				<td class="right2">
						<input class='easyui-textbox' name="ext2" type="text" />
				</td>
				<td class="left2">
					保养内容：
				</td>
				<td class="right2">
					<input class='easyui-textbox' name="info" type="text" />
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='protectSaveBtn'>
					保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='protectSaveExit'>
					返回
				</div>
			</div>
		</div>
	</form>

</body>