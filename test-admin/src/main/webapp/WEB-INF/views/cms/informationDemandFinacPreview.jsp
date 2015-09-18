<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html lang="en">
<head>
<meta charset="utf-8">
<title>投融信息</title>
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
<script type="text/javascript"
	src="${ctx}/static/jquery-easyui/jquery.min.js"></script>
<script src="${ctx}/static/wysiwyg/jquery.hotkeys.js"></script>

<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="${ctx}/static/wysiwyg/bootstrap-wysiwyg.js"></script>
<script type="text/javascript"
	src="${ctx}/static/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${ctx}/static/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript">
	function isAgree(auditStatus){
		var id = $("#informationDemandId").val();
        $.ajax({
					url : '${ctx }/informationDemand/isAgree',
					dataType : "json",
					data : {auditStatus:auditStatus,id:id},
					success : function(data) {
					console.info(data);
						if (data.code == 0) {
							alert('操作成功');
							window.location.href = '${ctx}/informationDemand/informationDemandManage'	
						} else {
							$.messager.alert('警告', '操作失败', "error");
						}
					},
					error : function(data) {
						$.messager.alert('提示', '操作失败！');
					}
				});
	}
</script>	
</head>
<body>
	<div>
		<h2 class="title clearfix ">投融信息</h2>
		<div class="hero-unit">
			<form id="form" name="form">
				<div> 
					<label style="display:inline-block; width:800px; text-align:left; margin-right:10px;font-size:20px;" for="title">
						${informationDemand.demandTitle} 
					</label>
				</div>
				<div>
					<label style="display:inline-block; width:200px; text-align:left; margin-right:10px;" for="username">时间：${lastModifiedBy}</label> 
					<label style="display:inline-block; width:200px; text-align:left; margin-right:10px;" for="type">分类：${informationDemand.type}</label>
					<label style="display:inline-block; width:200px; text-align:left; margin-right:10px;" for="publisher">发布人：${informationDemand.publisher.name}</label>
				</div>
				<div>
					<label style="display:inline-block; width:200px; text-align:left; margin-right:10px;" for="assetType">资产类型：${informationDemand.financing.assetType}</label> 
					<label style="display:inline-block; width:200px; text-align:left; margin-right:10px;" for="username">年化利率范围：${informationDemand.financing.rateLow} - ${informationDemand.financing.rateHigh}（%）</label>
					
				</div>
				<div>
					<label style="display:inline-block; width:200px; text-align:left; margin-right:10px;" for="username">希望期限：${informationDemand.financing.deadlineLow} - ${informationDemand.financing.deadlineHigh}（月）</label>
					<label style="display:inline-block; width:600px; text-align:left; margin-right:10px;" for="raising">融资金额：${informationDemand.financing.amount}（元）</label> 
				</div>
				<div>
					<label style="display:inline-block; width:400px; text-align:left; margin-right:10px;" for="username">联系方式：${informationDemand.financing.contact}</label>
					<label style="display:inline-block; width:200px; text-align:left; margin-right:10px;" for="raising"></label>
				</div>
				<div>
					<table>
						<tr>
							<td style="font-size:14px;">项目简述：</td>
							<td><textarea class="fl" style="line-height:40px;" disabled="disabled">${informationDemand.financing.description}</textarea></td>
						</tr>
					</table>	
				</div>
				<div>
					<c:if test="${isCheck eq '1'}">
						<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="javascript:isAgree('1');">通过</a>	&nbsp;&nbsp;&nbsp;
						<a id="submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:isAgree('2');">不通过</a>	
					</c:if>
				</div>
				<input type="hidden" name="informationDemandId" id="informationDemandId" value="${informationDemand.id}"/>	
			</form>
		</div>
	</div>
</html>
