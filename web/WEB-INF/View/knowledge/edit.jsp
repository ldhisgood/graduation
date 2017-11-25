<%@ page language='java' import='java.util.*' pageEncoding='utf-8'%><body>
	<script type="text/javascript" src="js/jquery-form.js"></script>
	<!-- ajaxForm 依赖脚本  -->
	<script>
		$(function() {
			$('#knowledgeEditBtn').linkbutton({
				iconCls : 'ok',
				text : '确认',
				onClick : function() {
					$('#knowledgeEditForm').form('submit');
				}
			});
			$('#knowledgeEditForm').form({
				onSubmit : function() {
					var isValid = $(this).form('validate');
					if (!isValid) {
					}
					return true;
				},
				success : function(data) {
					$.messager.show({
						title : '提示',
						msg : '修改成功',
						showType : 'slide',
						outTime : '1000'
					});
					$('#knowledgeEditBox').dialog('clear');
					$('#knowledgeEditBox').dialog('close');
					$('#knowledgeListBox').datagrid('reload');
				}
			});
			$('#knowledgeEditExit').linkbutton({
				iconCls : 'ok',
				text : '返回',
				onClick : function() {
					$('#knowledgeEditBox').dialog('clear');
					$('#knowledgeEditBox').dialog('close');
				}
			});
		});
	</script>
	<script type="text/javascript">
		//上传图片
		function uploadlogoimg() {
			var shangchuan = $(".shangchuan");
			if (shangchuan.val() == "") {
				$.alert("请上传图片");
				return;
			}
			var ajax_option = {
				url : "knowledge/uploadPic11.do",
				type : "post",
				success : function(result) {
					var jsonObj = $.parseJSON(result);
					var relativePath = jsonObj.relativePath;
					$("#zhengjian").attr("value", jsonObj.relativePath);
					$("#logopic").attr("src", jsonObj.relativePath);
				}
			};
			$("#knowledgeEditForm").ajaxSubmit(ajax_option);
		}
	</script>
	<script type="text/javascript">
		//上传图片
		function uploadlogoimg1() {
			var shangchuan1 = $(".shangchuan1");
			if (shangchuan1.val() == "") {
				$.alert("请上传图片");
				return;
			}
			var ajax_option = {
				url : "knowledge/uploadPic22.do",
				type : "post",
				success : function(result) {
					var jsonObj = $.parseJSON(result);
					var relativePath = jsonObj.relativePath;
					$("#zhengjian1").attr("value", jsonObj.relativePath);
					$("#logopic1").attr("src", jsonObj.relativePath);
				}
			};
			$("#knowledgeEditForm").ajaxSubmit(ajax_option);
		}
	</script>
	<script type="text/javascript">
		//上传图片
		function uploadlogoimg2() {
			var shangchuan2 = $(".shangchuan2");
			if (shangchuan2.val() == "") {
				$.alert("请上传图片");
				return;
			}
			var ajax_option = {
				url : "knowledge/uploadPic33.do",
				type : "post",
				success : function(result) {
					var jsonObj = $.parseJSON(result);
					var relativePath = jsonObj.relativePath;
					$("#zhengjian2").attr("value", jsonObj.relativePath);
					$("#logopic2").attr("src", jsonObj.relativePath);
					alert(jsonObj.relativePath);
				}
			};
			$("#knowledgeEditForm").ajaxSubmit(ajax_option);
		}
	</script>
	<form id='knowledgeEditForm' method='post' action='knowledge/update.do'
		enctype="multipart/form-data">
		<input type='hidden' name='id' value='${bean.id }' />
		<table class="s_box">
			<tr>
				<td class="left">文件名称：</td>
				<td class="right"><input class='easyui-textbox' name="filename"
					type="text" value="${bean.filename}" /></td>
			</tr>
			<tr>
				<td class="left">文件类别：</td>
				<td class="right">
					<!-- <input class='easyui-textbox' name="classify" type="text" /> -->
					<select id="cc" class="easyui-combobox" name="classify" style="width:110px;heigth:100">
						
						<option>合同</option>
						<option>设计文档</option>
						<option>使用手册</option>
						<option>技术文档</option>
						<option>维修文档</option>
						<option>其他文档</option>
					</select>
				</td>
			</tr>
			<!-- <tr>				
				<td class="left">					上传时间：				</td>				
					<td class="right">					
					<input class='easyui-textbox' name="uploadDate" id="uploadDate" type="text" />				
				</td>			
			</tr> -->
			<tr>
				<td style="text-align:left; padding-left:15px;" colspan="2">维修图片：</td>
				<td>
			</tr>
			<tr>
				<td class="left"><img src="${bean.imgs}" id="logopic" width="130px"
					height="120px"> <input type="hidden" name="ext1"
					id="zhengjian1" value="图片地址..." class="tu"
					class="form-control-a clearfix" required /> <input type="hidden"
					name="ext2" id="zhengjian2" value="图片地址..." class="tu"
					class="form-control-a clearfix" required /> <input type="hidden"
					name="imgs" id="zhengjian" value="图片地址..." class="tu"
					class="form-control-a clearfix" required /></td>
				<td>
					<div class="form-group_c01"></div> <input type="file"
					class="shangchuan" value="身份证件" onchange="uploadlogoimg()"
					name="logoimg11"></td>
			</tr>
			<tr>
				<td class="left"><img src="${bean.ext1}" id="logopic1" width="130px"
					height="120px">
				</td>
				<td><input type="file" class="shangchuan1" value="身份证件"
					onchange="uploadlogoimg1()" name="logoimg22"></td>
			</tr>
			<tr>
				<td class="left"><img src="${bean.ext2}" id="logopic2" width="130px"
					height="120px">
				</td>
				<td><input type="file" class="shangchuan2" value="身份证件"
					onchange="uploadlogoimg2()" name="logoimg33">
				</td>
			</tr>
			<!-- <tr>				
				<td class="left">					待定3：				</td>				
					<td class="right">					
					<input class='easyui-textbox' name="ext3" type="text" />				
				</td>			
			</tr>			
			<tr>				
				<td class="left">					待定4：				</td>				
					<td class="right">					
					<input class='easyui-textbox' name="ext4" type="text" />				
				</td>			
			</tr>			
			<tr>				
				<td class="left">					待定5：				</td>				
					<td class="right">					
					<input class='easyui-textbox' name="ext5" type="text" />				
				</td>			
			</tr>	 -->
		</table>
		<div class="s_btn">
			<div class="s_btn_l fl">
				<div id='knowledgeEditBtn'>保存</div>
			</div>
			<div class="s_btn_r fl">
				<div id='knowledgeEditExit'>返回</div>
			</div>
		</div>
	</form>
</body>