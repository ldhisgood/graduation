<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<body>
	<script type="text/javascript" src="js/jquery-form.js"></script> <!-- ajaxForm 依赖脚本  -->
	<script>
		$(function(){
			$("#knowledgeSaveBtn").linkbutton( {
				iconCls : 'ok',
				text : '保存',
				onClick : function() {
					$('#knowledgeSaveForm').form('submit');
				}
			});
			$('#knowledgeSaveForm').form( {
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
					$('#knowledgeSaveBox').dialog('clear');
					$('#knowledgeSaveBox').dialog('close');
					$('#knowledgeListBox').datagrid('reload');
				}
			}); 
			$("#knowledgeSaveExit").linkbutton( {
				iconCls : 'ok',
				text : '返回',
				onClick:function(){
					$('#knowledgeSaveBox').dialog('clear');
					$('#knowledgeSaveBox').dialog('close');
				}
			});
		
		});
	</script>
	
<!--	 <script type="text/javascript">
		function checkForm() {
		var file = $("input[name='imagedefault']").val();
		if(file==""){ alert("请上传图片");return false;}
		return true;
	}
</script>
 	 <script type="text/javascript">
				function submitImgSize1Upload(num) {
			//var file = $("input[name='imagedefault[]']").val();
			var file = $("#imgsFile"+num).val();
			if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file))
        	{
          		alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
          		$("#imgsFile"+num).val("");
          		return false;
        	}
			var option = {
				url:"knowledge/uploadPic.do",//上传的url
				data:{
					num:num
				},
				dataType:"text",//回调值的数据类型
				success:function(responseText){
				//{"realPath":"http://...", "relativePath":"/upload/.."}
				var jsonObj = $.parseJSON(responseText);
				$("#imgsImgSrc"+num).attr("src",jsonObj.relativePath);
				$("#imgs"+num).val(jsonObj.relativePath);
				$("#lastRealPath"+num).val(jsonObj.realPath); 
				},
				error:function(){
					alert("系统错误");
				}
				}
				//使用ajax方式提交表单，上传文件
				$("#knowledgeSaveForm").ajaxSubmit(option);
			}
	</script>  -->
<script type="text/javascript">
 //上传图片
 function uploadlogoimg(){
 	var shangchuan = $(".shangchuan");
 	if(shangchuan.val()==""){
 		$.alert("请上传图片");
 		return;
 	}
 	var ajax_option={
	 	url:"knowledge/uploadPic.do",
	 	type:"post",
	 	success:function(result){
	 		var jsonObj = $.parseJSON(result);
	 		var relativePath = jsonObj.relativePath;
	 		$("#zhengjian").attr("value",jsonObj.relativePath);
	 		$("#logopic").attr("src",jsonObj.relativePath);
	 	}
 	};
 	$("#knowledgeSaveForm").ajaxSubmit(ajax_option);
 }
</script> 
<script type="text/javascript">
 //上传图片
 function uploadlogoimg1(){
 	var shangchuan1 = $(".shangchuan1");
 	if(shangchuan1.val()==""){
 		$.alert("请上传图片");
 		return;
 	}
 	var ajax_option={
	 	url:"knowledge/uploadPic1.do",
	 	type:"post",
	 	success:function(result){
	 		var jsonObj = $.parseJSON(result);
	 		var relativePath = jsonObj.relativePath;
	 		$("#zhengjian1").attr("value",jsonObj.relativePath);
	 		$("#logopic1").attr("src",jsonObj.relativePath);
	 	}
 	};
 	$("#knowledgeSaveForm").ajaxSubmit(ajax_option);
 }
</script> 
<script type="text/javascript">
 //上传图片
 function uploadlogoimg2(){
 	var shangchuan2 = $(".shangchuan2");
 	if(shangchuan2.val()==""){
 		$.alert("请上传图片");
 		return;
 	}
 	var ajax_option={
	 	url:"knowledge/uploadPic2.do",
	 	type:"post",
	 	success:function(result){
	 		var jsonObj = $.parseJSON(result);
	 		var relativePath = jsonObj.relativePath;
	 		$("#zhengjian2").attr("value",jsonObj.relativePath);
	 		$("#logopic2").attr("src",jsonObj.relativePath);
	 	}
 	};
 	$("#knowledgeSaveForm").ajaxSubmit(ajax_option);
 }
</script> 
	<form id="knowledgeSaveForm" method="post" action="knowledge/save1.do" enctype="multipart/form-data">
		<table class="s_box">
			<tr>				
				<td class="left">					文件名称：				</td>				
					<td class="right">					
					<input class='easyui-textbox' name="filename" type="text" />				
				</td>			
			</tr>				
			<tr>				
				<td class="left">					文件类别：				</td>				
					<td class="right">					
					<!-- <input class='easyui-textbox' name="classify" type="text" /> -->
					<select id="cc" class="easyui-combobox" name="classify" style="width:110px;heigth:150">  
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
				<td class="left">					上传文件：				</td>				
					<td class="right">		
      				<input type="file" name="uploadfile" onchange="uploadfile()">
					<input class='easyui-textbox' name="accessory" type="hidden" value="accessory" />				
				</td>			
			</tr>		 -->			
			<!--  <tr>
				<td class="left">					维修图片：				</td>		
				<input type="hidden" name="imgs" id="zhengjian" value="图片地址..." class="tu" class="form-control-a clearfix" placeholder=""  required/>					   
				<input type="hidden" name="ext1" id="zhengjian1" value="图片地址..." class="tu" class="form-control-a clearfix" placeholder=""  required/>					   
				<input type="hidden" name="ext2" id="zhengjian2" value="图片地址..." class="tu" class="form-control-a clearfix" placeholder=""  required/>					   
				<div class="form-group_e">	
					<div  id="logo" class="form-group_c fl">
						 <div class="form-group_c01">
						 <img src="" id="logopic" width="100px" height="100px">
						 <img src="" id="logopic1" width="100px" height="100px">
						 <img src="" id="logopic2" width="100px" height="100px">				  	
						 </div>
						 <div class="form-group_c02" id="logo">
						 <input type="file" class="shangchuan" value="身份证件"  onchange="uploadlogoimg()" name="logoimg" >
						 <input type="file" class="shangchuan1" value="身份证件"  onchange="uploadlogoimg1()" name="logoimg1" >
						 <input type="file" class="shangchuan2" value="身份证件"  onchange="uploadlogoimg2()" name="logoimg2" >
						 </div>
					</div>
				</div>
			</tr>   -->
			<tr>
				<td style="text-align:left; padding-left:15px;" colspan="2">维修图片：</td>
				<td>
			</tr>
			<tr>
				<td class="left"><img src="" id="logopic" width="130px"
					height="120px"> <input type="hidden" name="ext1"
					id="zhengjian1" value="" class="tu"
					class="form-control-a clearfix" required /> <input type="hidden"
					name="ext2" id="zhengjian2" value="" class="tu"
					class="form-control-a clearfix" required /> <input type="hidden"
					name="imgs" id="zhengjian" value="" class="tu"
					class="form-control-a clearfix" required /></td>
				<td>
					<div class="form-group_c01"></div> <input type="file"
					class="shangchuan" value="" onchange="uploadlogoimg()"
					name="logoimg"></td>
			</tr>
			<tr>
				<td class="left"><img src="" id="logopic1" width="130px"
					height="120px">
				</td>
				<td><input type="file" class="shangchuan1" value=""
					onchange="uploadlogoimg1()" name="logoimg1"></td>
			</tr>
			<tr>
				<td class="left"><img src="" id="logopic2" width="130px"
					height="120px">
				</td>
				<td><input type="file" class="shangchuan2" value=""
					onchange="uploadlogoimg2()" name="logoimg2">
				</td>
			</tr>
			<%--  <tr>
               <td class="left">					维修图片：				</td>	
                <td class="right">	
                    <ul>
		               <li class="fl"><input type='file' size='27' id='imgsFile1'
		                	name='imagedefault[]' onchange='submitImgSize1Upload("1")'/></li>
		               <li class="fl"> <input type="hidden" id="imgs1" name="imgs" value="${imgs0 }" /></li>
		                <li class="fl"><input type='file' size='27' id='imgsFile2'
		                	name='imagedefault[]' onchange='submitImgSize1Upload("2")'/></li>
		               <li class="fl"><input type="hidden" id="imgs2" name="imgs" value="${imgs1 }" /></li> 
		              <li class="fl"><input type='file' size='27' id='imgsFile3'
		                	name='imagedefault[]' onchange='submitImgSize1Upload("3")'/></li>  
		               <li class="fl"><input type="hidden" id="imgs3" name="imgs" value="${imgs2 }" /></li> 
	                </ul>
                </td>	
            </tr>
            <tr>
            <input type="hidden" id="lastRealPath1" name="lastRealPath" value="${imgs0 }" />
            <input type="hidden" id="lastRealPath2" name="lastRealPath" value="${imgs1 }" />
             <input type="hidden" id="lastRealPath3" name="lastRealPath" value="${imgs2 }" />
            <div class="mian_r clearfix">
               <div class="fl mian_left">
					<img id='imgsImgSrc1' src="${imgs0 }" height="100" width="100" value=""/>
               </div>
               <div class="fl mian_left">
					<img id='imgsImgSrc2' src="${imgs1 }" height="100" width="100" value=""/>
               </div> 
               <div class="fl mian_left">
					<img id='imgsImgSrc3' src="${imgs2 }" height="100" width="100" value=""/>
               </div>
            </div>
            </tr> --%>		
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
				<div id='knowledgeSaveBtn'>
				保存
				</div>
			</div>
			<div class="s_btn_r fl">
				<div id='knowledgeSaveExit'>
					返回
				</div>
			</div>
		</div>
	</form>
</body>