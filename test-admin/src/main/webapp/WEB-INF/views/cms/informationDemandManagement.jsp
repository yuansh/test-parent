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
<title>投融管理</title>
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
	//var unCheckCount = 0;//未审核总数
	var isQuery = false;
	$(function() {
		$('#dg').datagrid({
							url : '${ctx}/informationDemand/informationDemandList',
							method : 'POST',
							pagination : true,
							pageSize : 10,
							fitColumns : true,
							queryParams : scene.getParams('#paramForm'),
							rownumbers : true,
							toolbar : '#queryParam',
							singleSelect : false,
							remoteSort : false,
							onLoadSuccess : function(data) {
								
								//for(var i=0;i<data.rows.length;i++){
								//	if(data.rows[i].auditStatus == "0"){
								//		unCheckCount+=1;
								//	}
								//}
								//$("#unCheckCount").html(unCheckCount);
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
										field : 'title',
										title : '文章标题',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return rec.demandTitle;
										}
									},
									{
										field : 'lastModifiedDate',
										title : '更新时间',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return transTime(rec.lastModifiedDate);
										}
									},
									{
										field : 'type',
										title : '所属分类',
										width:fixWidth(0.25),
										align : 'center',
										sortable : true,
										formatter : function(value, rec) {
											//if(rec.type=="2"){
											//	return "投资需求";
											//}
											//if(rec.type=="3"){
											//	return "融资需求";
											//}
											return rec.type;
										}
									},
									{
										field : 'createdBy',
										title : '发布人',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return rec.memberName;
										}
									},
									{
										field : 'auditStatus',
										title : '发布状态',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											if(rec.auditStatus == "0"){
												return "未审核";
											}
											if(rec.auditStatus == "1"){
												return "审核通过";
											}
											if(rec.auditStatus == "2"){
												return "审核未通过";
											}
											
										}
									},
									{
										field : 'fix',
										title : '操作',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											var preview = 'preview('
													+ rec.id
													+ ')';
											var check = 'check('
													+ rec.id
													+ ')';
													
											if(rec.auditStatus == "0"){
												return '<a href="javascript:'+preview+';" target="">预览</a>&nbsp;&nbsp;</a><a href="javascript:'+check+';">审核</a>';
											}else{
												return '<a href="javascript:'+preview+'" target="">预览</a>';
											}
											
										}		
									}
									]]
						});
		$.ajax({
            url : '${ctx}/informationDemand/informationDemandList',
            type : 'post',
            data : {auditStatus:"0"},
            async : false, //默认为true 异步     
            success : function(data) {
                 console.info(data);
                 $("#unCheckCount").html(data.total);
            }
    });
    
    $("#query").click(
				function() {
					isQuery = true;
					$("#auditStatus").val("0");
					console.info(scene.getParams('#paramForm'));
					$('#dg').datagrid('options').queryParams = scene
							.getParams('#paramForm');
					$('#dg').datagrid("reload");
					
				
		});
							
});

	function preview(id){
		window.location.href = '${ctx}/informationDemand/preview?id=' + id;
	}
	
	function check(id) {
		window.location.href = '${ctx}/informationDemand/isCheck?id=' + id;
	}

</script>
</head>
<body>
	<div id="queryParam">
		<form id="paramForm">
			<span style="font-size:20px;">投融管理</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href ='javascript:void(0);' id="query" class="easyui-linkbutton" data-options="iconCls:'icon-search'">未审核（<em id = "unCheckCount" >0</em>）</a>
			<input id="auditStatus" type="hidden" name="auditStatus" style="width:200px;" value="" />
		</form>
	</div>
	<table id="dg">
	</table>
</body>
</html>
