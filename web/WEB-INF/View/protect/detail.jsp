<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><body>
	<script>
	$(function() {
		$('#protectEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#protectDetailBox').dialog('clear');
				$('#protectDetailBox').dialog('close');
			}
		});
	})
</script>
		<table class="s_box">
			<tr>
				<td class="left">
					保养项目：
				</td>
				<td class="right">
					${bean.project }
				</td>
			</tr>
			<tr>
				<td class="left">
					保养标准：
				</td>
				<td class="right">
					${bean.standard }
				</td>
			</tr>
			<%-- <tr>
				<td class="left">
					保养地点：
				</td>
				<td class="right">
					${bean.ext2 }
				</td>
			</tr> --%>
			<tr>
				<td class="left">
					保养内容：
				</td>
				<td class="right">
					${bean.info }
				</td>
			</tr>
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="s_btn_r fl">
				<div id='protectEditExit'>
					返回
				</div>
			</div>
		</div>

</body>