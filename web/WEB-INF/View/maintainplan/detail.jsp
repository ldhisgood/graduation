<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><body>
	<script>
	$(function() {
		$('#maintainplanEditExit').linkbutton( {
			iconCls : 'ok',
			text : '返回',
			onClick : function() {
				$('#maintainplanDetailBox').dialog('clear');
				$('#maintainplanDetailBox').dialog('close');
			}
		});
	})
</script>
		<table class="s_box">
			<tr>
				<td class="left">
					维修项目：
				</td>
				<td class="right">
					${bean.project }
				</td>
			</tr>
			<tr>
				<td class="left">
					维修标准：
				</td>
				<td class="right">
					${bean.standard }
				</td>
			</tr>
			<tr>
				<td class="left">
					维修地点：
				</td>
				<td class="right">
					${bean.ext2 }
				</td>
			</tr>
			<tr>
				<td class="left">
					维修详情：
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
				<div id='maintainplanEditExit'>
					返回
				</div>
			</div>
		</div>

</body>