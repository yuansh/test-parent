<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>私信管理</title>
<link rel="Stylesheet" type="text/css"
	href="${ctx}/static/jquery-easyui/themes/icon.css" />
<link rel="Stylesheet" type="text/css"
	href="${ctx}/static/jquery-easyui/themes/default/easyui.css" />
<link rel="Stylesheet" type="text/css"
	href="${ctx}/static/styles/common.css" />
<script type="text/javascript"
	src="${ctx}/static/jquery-easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/static/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx}/static/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${ctx}/static/frames/home.js"></script>
<script type="text/javascript" src="${ctx}/static/frames/scene.js"></script>
<script type="text/javascript" src="${ctx}/static/common/resource.js"></script>
<style type="text/css">
#fm {
	margin: 0;
	padding: 10px 30px;
}

.ftitle {
	font-size: 14px;
	font-weight: bold;
	color: #666;
	padding: 5px 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.fitem {
	margin-bottom: 5px;
}

.fitem label {
	display: inline-block;
	width: 80px;
}
</style>
<script type="text/javascript">



	var isQuery = false;
	$(function() {
		
		$('#dg').datagrid({
							url : '${ctx}/message/messageInfoBysenderIdAndreceiverId?senderId=${senderId}&receiverId=${receiverId}',
							method : 'POST',
							pagination : true,
							pageSize : 10,
							fitColumns : true,
							queryParams : scene.getParams('#paramForm'),
							rownumbers : true,
							toolbar : '#queryParam',
							singleSelect : false,
							remoteSort : false,
							onLoadSuccess : function() {
								if(isQuery) {
									var data = $('#dg').datagrid('getData');
									if (data.total == 0) {
										var hint = "";
										if ($("#qArticleTitle").val() != "") {
											hint = '"' + $("#qArticleTitle").val()
													+ '"';
										}
										$.messager.alert('提示', '抱歉，没有找到' + hint
												+ '相关的用户');
									}
								}
								isQuery = false;
							},
							//frozenColumns : [ [ {
							//	field : 'ck',
							//	checkbox : true
							//} ] ],
							columns : [[
									{
										field : 'id',
										title : '编号',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return ("000000" + rec.id)
													.substr(
															("000000" + rec.id).length - 6,
															6);
										}

									},
									{
										field : 'sender_name',
										title : '发送人',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return rec.sender_name;
										}
									},{
										field : 'send_time',
										title : '发送时间',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return rec.send_time;
										}
									},{
										field : 'content',
										title : '发送内容',
										width:fixWidth(0.55),
										align : 'center',
										formatter : function(value, rec) {
											if(rec.content.length<=50){
												return rec.content;
											}else{
												return "<span title='"+rec.content+"'>"+rec.content.substr(0,50)+'...'+"</span>";
											}
										}
									}
									]]
						});
						
							
				
});

    function fixWidth(percent)  
    {  
        return document.body.clientWidth * percent ; //这里你可以自己做调整   BysenderIdAndreceiverId
    }  
	
	
	
	

</script>
</head>
<body>
	<div id="queryParam">
		<form id="paramForm">
			<span style="font-size:20px;">私信详情</span>&nbsp;&nbsp;&nbsp;&nbsp;
		</form>
	</div>
	<table id="dg">
	</table>
</body>
</html>
