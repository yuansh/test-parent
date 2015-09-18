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
<title>资讯管理</title>
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
							url : '${ctx}/member/memberList',
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
										field : 'name',
										title : '用户名',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return rec.name;
										}
									},
									{
										field : 'email',
										title : '邮箱',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return rec.email;
										}
									},
									{
										field : 'fix',
										title : '操作',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											
											return '<a href="javascript:preview('+rec.id+');" target="">详情</a>';
										}
									}
									]]
						});
						
							
		$("#query").click(
				function() {
					isQuery = true;
					console.info(scene.getParams('#paramForm'));
					$('#dg').datagrid('options').queryParams = scene
							.getParams('#paramForm');
					$('#dg').datagrid("reload");
					
				
		});
				
});

    function fixWidth(percent)  
    {  
        return document.body.clientWidth * percent ; //这里你可以自己做调整  
    }  
	
	function preview(id) {
		window.location.href  ='${ctx}/member/preview?id=' + id + '';
	}
	
	
	

</script>
</head>
<body>
	<div id="queryParam">
		<form id="paramForm">
			<table style="margin-top: 20px;">
				<tr>
					<td><input id="qArticleTitle" type="text" name="qArticleTitle" style="width:200px;" />&nbsp;&nbsp;</td>
					<td class="title"><a href="javascript:void(0);" id="query"
						class="easyui-linkbutton" data-options="iconCls:'icon-search'"
						style="width: 80px">查询</a>&nbsp;</span>
				</tr>
			</table>
		</form>
	</div>
	<table id="dg">
	</table>
</body>
</html>
