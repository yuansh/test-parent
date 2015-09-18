<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html lang="en">
<head>
<meta charset="utf-8">
<title>资讯信息</title>

<link
	href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css"
	rel="stylesheet">
<link href="${ctx}/static/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="${ctx}/static/styles/wysiwyg.css" rel="stylesheet">
<link rel="Stylesheet" type="text/css"
	href="${ctx}/static/jquery-easyui/themes/icon.css" />
<link rel="Stylesheet" type="text/css"
	href="${ctx}/static/jquery-easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="${ctx}/static/editor/themes/default/default.css" />
<style type="text/css">	
.clearfix {
    display: block;
}


.clearfix::after {
    clear: both;
    content: " ";
    display: block;
    height: 0;
    line-height: 0;
    visibility: hidden;
}

h2.title {
    color: #141414;
    font-size: 16px;
    height: 40px;
    line-height: 40px;
    padding-left: 10px;
}
</style>
<script type="text/javascript"
	src="${ctx}/static/jquery-easyui/jquery.min.js"></script>
<script src="${ctx}/static/wysiwyg/jquery.hotkeys.js"></script>

<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="${ctx}/static/wysiwyg/bootstrap-wysiwyg.js"></script>
<script type="text/javascript"
	src="${ctx}/static/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx}/static/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/editor/kindeditor-all.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/editor/zh_CN.js"></script>
<script>
	$(function(){
	var id = "${information.id}";
		if(id.length!=0){
		var type = "${information.type}";
			$("#firClassify").combobox('setValue',type);
		}
		
		//initToolbarBootstrapBindings();
		$('#editor').wysiwyg({
			fileUploadError : showErrorAlert
		});
		window.prettyPrint && prettyPrint();
	});
	
	
	var maxwidth = 1000;
	var maxheight = 768;
	var maxcount = 6;

	function showErrorAlert(reason, detail) {
		var msg = '';
		if (reason === 'unsupported-file-type') {
			msg = "Unsupported format " + detail;
		} else {
			console.log("error uploading file", reason, detail);
		}
		$(
				'<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'
						+ '<strong>File upload error</strong> '
						+ msg
						+ ' </div>').prependTo('#alerts');
	};

	function createSave(type) {
		if (!validSize())
			return false;
			$(".easyui-validatebox").validatebox("enableValidation");
			if ($('#form').form("validate")) {
			var typeJuno = "";
				var firClass = $("#firClassify").combobox("getValue");
				if(firClass != '-1') {
					typeJuno = firClass;
				} 
				if(firClass=='-1'){
					$.messager.alert("消息", "请选择分类。");
					return false;
				}
			}
			$("#articlecontext").attr("value",editor.html());
			$('#form').form('submit', {
					url :'${ctx}/content/saveContent',
					onSubmit : function() {
						return $(this).form('validate');
					},
					success : function(data) {
						var result = eval('(' + data + ')');
						if (result.code == "0") {
							$.messager.alert("消息", "文章提交成功。", "info", function() {
								if(type==='1'){
									window.location = "${ctx}/content/publishContent";
								}else{
									window.location = "${ctx}/content/contentManage";
								}
							});
							$(".panel-tool-close").css("display", "none");
						} else if (data1.code == 1) {
							$.messager.alert("警告", "文章提交失败,原因:"
									+ data1.attachment.field
									+ data1.attachment.defaultMessage + "。", "warn");
						} else{
							$.messager.alert("警告", "文章提交失败.", "warn");
						}	
					}
				});			
		}
	
	function editSave() {
		if (!validSize())
			return false;
		$(".easyui-validatebox").validatebox("enableValidation");
		if ($('#form').form("validate")) {
			var typeJuno = "";
				var firClass = $("#firClassify").combobox("getValue");
				if(firClass != '-1') {
					typeJuno = firClass;
				} 
				if(firClass=='-1'){
					$.messager.alert("消息", "请选择分类。");
					return false;
				}
			}
			$("#articlecontext").attr("value",editor.html()); 
			$('#form').form('submit', {
				url :'${ctx}/content/saveContent',
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					var result = eval('(' + data + ')');
					if (result.code == "0") {
						$.messager.alert("消息", "修改文章成功。", "info", function() {
							window.location = "${ctx}/content/contentManage";
						});
						$(".panel-tool-close").css("display", "none");
					} else if (data1.code == 1) {
						$.messager.alert("警告", "修改文章失败,原因:"
								+ data1.attachment.field
								+ data1.attachment.defaultMessage + "。", "warn");
					} else{
						$.messager.alert("警告", "修改公告失败.", "warn");	
					}	
				}
			});		
		}
	
	function loadData(id, type) {
		$.post('${ctx}/contentClassify/getSomeClass', {
			id : id,
			type : '一级'
		}, function(result) {
			$("#firClassify").combobox('setValue', "-1");
			$("#firClassify").combobox('setValue', result.id);
			$.post('${ctx}/contentClassify/getSomeClass', {
				id : id,
				type : '二级'
			}, function(result) {
				$("#secClassify").combobox('setValue', result.id);

				$("#thClassify").combobox('setValue', id);

				$('#fm').form('validate');
				MaskUtil.unmask();
			}, 'json');
		}, 'json');
	}

	function validSize() {
		if ($("#editor img").size() > maxcount) {
			$.messager.alert("警告", "图片数量过多，请小于等于" + maxcount, "warn");
			return false;
		}
		var isOk = true;
		$("#editor img").each(function() {
			if ($(this).width() > maxwidth) {
				$.messager.alert("警告", "有图片宽度超过" + maxwidth+"像素！", "warn");
				isOk = false;
				return false;
			}
		});
		
		var edit = editor.text();
				if(edit.trim()===''&&(editor.html().indexOf('img')==-1)){
					$.messager.alert("消息", "请输入内容！");
					return false;
				}
		if(edit.trim().length>10000){
			$.messager.alert("提示", "不能超过10000个汉字！");
			return false;
		}
			
			
			return isOk;
		
	}
	
	function findSort(type){
		$.ajax({
            url : '${ctx }/content/findSort',
            type : 'post',
            data : 'contentClassifyId='+type,
            async : false, //默认为true 异步     
            success : function(data) {
                 $('#position').numberbox('setValue', data);
            }
        });
	}
	var options = {
            //cssPath : '/css/index.css',
            pasteType : 2,
            id :$("#id").val(),
            filterMode : true,
            uploadJson : '${ctx}/content/img/upload',
            //fileManagerJson : '',
            allowFileManager : false,
            autoHeightMode : true,
            fillDescAfterUploadImage:true,
            zIndex:8000,
            afterUpload:function(url){
            	//var id = url.split("\/");
        		//id = id[id.length-1];//附件id
  				//$("#imgId").val(id);
            	return '${ctx}'+url;
            },
            items:[
                   'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                   'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                   'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                   'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                   'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                   'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
                    'table', 'hr', 'pagebreak',
                   'anchor', 'link', 'unlink', '|', 'about'
           ]
    };
	 var editor;
   KindEditor.ready(function(K) {
   	editor =  K.create('#editor', options);
    });
    
    //检查图片的格式是否正确,同时实现预览
	function setImagePreview(obj, localImagId, imgObjPreview) {
	    var array = new Array('jpeg', 'png', 'jpg'); //可以上传的文件类型
	    
		var imgFileSize=Math.ceil(obj.files[0].size/1024*100)/100;//取得图片文件的大小 
		if(imgFileSize>500){
			$('#preview').attr({src:''}); 
	        $('#logo').val(''); 
			$.messager.alert("错误","请选择500K以下的图片！");
			return false;
		}
		
	    if (obj.value == '') {
	        $.messager.alert("错误","请选择要上传的图片!");
	        return false;
	    } else {
	        var fileContentType = obj.value.match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用 
	        ////布尔型变量
	        var isExists = false;
	        //循环判断图片的格式是否正确
	        for (var i in array) {
	            if (fileContentType.toLowerCase() == array[i].toLowerCase()) {
	                //图片格式正确之后，根据浏览器的不同设置图片的大小
	                if (obj.files && obj.files[0]) {
	                    //火狐下，直接设img属性 
	                    imgObjPreview.style.display = 'block';
	                    imgObjPreview.style.width = '180px';
	                    imgObjPreview.style.height = '120px';
	                    //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
	                    imgObjPreview.src = window.URL.createObjectURL(obj.files[0]);
	                }else {
	                    //IE下，使用滤镜 
	                    obj.select();
	                    var imgSrc = document.selection.createRange().text;
	                    alert(imgSrc);
	                    //必须设置初始大小 
	                    localImagId.style.width = "180px";
	                    localImagId.style.height = "120px";
	                    //图片异常的捕捉，防止用户修改后缀来伪造图片 
	                    try {
	                        localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
	                        localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader=").src = imgSrc;
	                    }
	                    catch (e) {
	                        $.messager.alert("错误","您上传的图片格式不正确，请重新选择!");
	                        return false;
	                    }
	                    imgObjPreview.style.display = 'none';
	                    document.selection.empty();
	                }
	                isExists = true;
	                return true;
	            }
	        }
	        if (isExists == false) {
	            $('#preview').attr({src:''}); 
	            $('#logo').val(''); 
	            $.messager.alert("错误","上传图片类型不正确!");
	            return false;
	        }
	        return false;
	    }
	}
	
	//显示图片  
	function over(imgid, obj, imgbig) {
	    //大图显示的最大尺寸  4比3的大小  400 300  
	    maxwidth = 180;
	    maxheight = 120;
	
	    //显示  
	    obj.style.display = "";
	    imgbig.src = imgid.src;
	
	    //1、宽和高都超过了，看谁超过的多，谁超的多就将谁设置为最大值，其余策略按照2、3  
	    //2、如果宽超过了并且高没有超，设置宽为最大值  
	    //3、如果宽没超过并且高超过了，设置高为最大值  
		
	    if (img.width > maxwidth && img.height > maxheight) {
	        pare = (img.width - maxwidth) - (img.height - maxheight);
	        if (pare >= 0)
	            img.width = maxwidth;
	        else
	            img.height = maxheight;
	    }
	    else if (img.width > maxwidth && img.height <= maxheight) {
	        img.width = maxwidth;
	    }
	    else if (img.width <= maxwidth && img.height > maxheight) {
	        img.height = maxheight;
	    }
	}
	function deletePicture(){
		$("#logo").attr("value","");
		$("#logoname").attr("value","");
		var repalceDelete = '</br><img id="preview" alt="" onclick="over(preview,divImage,imgbig);" src="" style="width: 200px; height: 120px;margin-left:-2%;"/>';	
	    $("#localImag").html(repalceDelete);	
	    var repalcLogo = '<input  id="logo" style="width:224px"  name="logo" value="" onchange="javascript:setImagePreview(this,localImag,preview);" type="file" />' 
	                      + '<input type="hidden" name="logoname" id="logoname" readonly="readonly"/>';
	    $("#logofile").html(repalcLogo);
	    $("#isdel").val("1");
	}
</script>
</head>
<body>
	<div>
		<c:if test="${information.id == null}">
			<h2 class="title clearfix ">发布资讯</h2>
		</c:if>
		<c:if test="${information.id != null}">
			<h2 class="title clearfix ">修改资讯</h2>
		</c:if>
		<div class="hero-unit">
			<form id="form" name="form" method="post" enctype="multipart/form-data">
				<div> 
					<label style="display:inline-block; width:100px; text-align:right; margin-right:5px;" for="title">
						<font color='red'>*</font>文章标题: 
					</label>
					<input id="title" name="title" type="text" class="easyui-validatebox input" 
						 style="display:inline-block; width:800px;" required="true" validType="length[5,100]" value="${information.title}"/>
				</div>
				<div>
					<label style="display:inline-block; width:100px; text-align:right; margin-right:10px;" for="username">发布人:</label>${information.defaultPublisherName} 
				</div>
				<div>
					<label for="classify" style="display:inline-block; width:100px; text-align:right; margin-right:5px;" class="lab_wid">
						<font color='red'>*</font>所属分类: 
					</label>
						<select class="easyui-combobox"
							data-options="editable:false,valueField: 'id',textField: 'name'"
							name="firClassify" id="firClassify" style="width: 120px;">
								<option value="-1">选择分类</option>
								<option value="0">行业资讯</option>
						</select>
				</div>
				<div>
					<label for="keywords" style="display:inline-block; width:100px; text-align:right; margin-right:5px;" class="lab_wid">
						文章关键字: 
					</label>
					<input id="keywords" name="keywords" type="text"
						 value="${information.keywords}" style="display:inline-block; width:800px;" 
						class="easyui-validatebox input" validType="length[2,100]" />
				</div>
				<div>
					<label for="description" style="display:inline-block; width:100px; text-align:right; margin-right:5px;" class="lab_wid">
						文章描述: 
					</label>
					<input id="description" name="description" type="text" style="display:inline-block; width:800px;" 
						class="easyui-validatebox" value="${information.description}"
						data-options="validType:'length[2,200]',novalidate:'true'" />
					<input id="id" name="id" type="hidden" value="${information.id}" />
					<input id="imgId" name="imgId" type="hidden" value="${information.imgMogid}" />
					<input type="hidden" name="articlecontext" id="articlecontext" value=""/>
					<input type="hidden" name="isdel" id="isdel" value=""/>
				</div>
				<div class="fitem">
	            	<label style="margin-left: 2%;">文章缩略图:</label>
	            	<div id = "logofile" style="margin-top: -25px;margin-left: 7%;">
	            		<input  id="logo" style="width:224px"  name="logo" value="" onchange="javascript:setImagePreview(this,localImag,preview);" type="file" />
						<input type="hidden" name="logoname" id="logoname" readonly="readonly"/>
	            	</div>
	            	<button style="margin-left: 7%;margin-top: -6px;height: 22px;width: 64px;" type="button" onclick="deletePicture();">删除</button>
					<div id="localImag" class="fitem" style="margin-left:9%;"></br>
						<c:if test="${article != null}">
							<img id="preview"  src="${ctx}/content/picture/${information.id}" onclick="over(preview,divImage,imgbig);" style="width: 200px; height: 120px;margin-left:-2%;"/>
						</c:if>
						<c:if test="${article == null}">
							<img id="preview" alt="" onclick="over(preview,divImage,imgbig);" src="" style="width: 200px; height: 120px;margin-left:-2%;"/> 	
						</c:if>
					</div> 
	        	</div>
				<textarea id="editor" name="content" style="min-width:1000px;min-height:500px;visibility:hidden;">${information.contextString}</textarea>
				<a id="submit" href="#" class="easyui-linkbutton"
					data-options="iconCls:'icon-ok'"
					<c:if test="${information.id == null}">onclick="javascript:createSave('0');"</c:if>
					<c:if test="${information.id != null}">onclick="javascript:editSave();"</c:if>>提交</a>
				<c:if test="${information.id == null}">
					<a id="submit" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-ok'"
						onclick="javascript:createSave('1');">提交并继续发布</a>
				</c:if>	
			</form>
		</div>
	</div>
</html>
