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
							url : '${ctx}/content/contentList',
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
							console.info(data);
								if(isQuery) {
									var data = $('#dg').datagrid('getData');
									if (data.total == 0) {
										var hint = "";
										if ($("#qArticleTitle").val() != "") {
											hint = '"' + $("#qArticleTitle").val()
													+ '"';
										}
										$.messager.alert('提示', '抱歉，没有找到' + hint
												+ '相关的文章');
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
										field : 'title',
										title : '文章标题',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return rec.title;
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
											return rec.type;
										}
									},
									{
										field : 'createdBy',
										title : '发布人',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											return rec.defaultPublisherName;
										}
									},
									{
										field : 'fix',
										title : '操作',
										width:fixWidth(0.25),
										align : 'center',
										formatter : function(value, rec) {
											var editLink = 'edit('
													+ rec.id
													+ ')';
											var preview = 'preview('
													+ rec.id
													+ ')';
											var del = 'deleteContent('
													+ rec.id
													+ ')';
											if(rec.status == "0"){
												return '<a href="javascript:'+preview+';" target="">预览</a>';
											}else{
												return '<a href="javascript:'+preview+';" target="">预览</a>&nbsp;&nbsp;<a href="javascript:'+editLink+';">编辑&nbsp;&nbsp;</a><a href="javascript:'+del+';">删除</a>';
											}
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

	function edit(id) {
		window.location.href = '${ctx}/content/editContent?id=' + id;
	}

	function del() {
		var selectedRows = $('#dg').datagrid('getSelections');
		if (selectedRows.length == 0) {
			$.messager.alert('信息', '没有选中数据！');
			return;
		}
		$.messager.confirm('确认', '确认删除选中的行?', function(r) {
			if (r) {
				var ids = new Array;
				for (var i = 0, len = selectedRows.length; i < len; i++) {
					ids[i] = selectedRows[i].id;
				}
				$.ajax({
					url : '${ctx}/content/batDelete?ids=' + ids.join(","),
					dataType : "json",
					success : function(data) {
						if (data.code == 0) {
							$.messager.alert('信息', '操作成功');

							$('#dg').datagrid("reload");
						} else {
							$.messager.alert('警告', '操作失败', "error");
						}
						selectedRows.length = 0;
					},
					error : function(data) {
						$.messager.alert('提示', '操作失败！');
					}
				});
			}
		})
	}

	function add() {
		$('#buildDate').datebox('enable');
		$('#dlg').dialog('open').dialog('setTitle', '新增');
		$('#fm').form('clear');
	}
	function deleteContent(id) {
		$.messager.confirm('确认', '您确定要删除？', function(r) {
			if (r) {
				$.post('${ctx}/content/deleteContent', {
					id : id
				}, function(result) {
					if (result.code == "0") {
						$('#dg').datagrid("reload");
						$.messager.show({
							title : '信息',
							msg : "删除成功"
						});
					} else {
						$.messager.show({
							title : '错误',
							msg : "删除失败"
						});
					}
					$(".panel-tool-close").css("display", "none");
				}, 'json');
			}
		});
	}

	function preview(id) {
		window.location.href = '${ctx}/content/preview?id=' + id + '';
	}
</script>
</head>
<body>
	<div id="queryParam">
		<form id="paramForm">
			<table style="margin-top: 20px;">
				<tr>
					<td><input id="qArticleTitle" type="text" name="qArticleTitle" style="width:200px;" /></td>
					<td class="title"><a href="javascript:void(0);" id="query"
						class="easyui-linkbutton" data-options="iconCls:'icon-search'"
						style="width: 80px">查询</a>&nbsp;&nbsp;<a target="_blank" id="add"
						href="javascript：void(0)" class="easyui-linkbutton"
						onclick='javascript:location.href = "${ctx}/content/publishContent"'
						data-options="iconCls:'icon-add'">发布资讯</a>
				</tr>
			</table>
		</form>
	</div>
	<table id="dg">
	</table>
</body>
</html>
