
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ taglib prefix='sec'
	uri='http://www.springframework.org/security/tags'%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>易联天下——管理台</title>
<link rel="Stylesheet" type="text/css"
	href="${ctx}/static/jquery-easyui/themes/icon.css" />
<link rel="Stylesheet" type="text/css"
	href="${ctx}/static/jquery-easyui/themes/default/easyui.css" />
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
html, body {
	width: 100%;
	height: 100%;
}

#top_container {
	width: 100%;
	height: 100%;
	background: #305571;
}

#logo {
	width: 1024px;
	height: 100%;
	background: url(${ctx}/static/images/juno/top_back.jpg) no-repeat
		left 12px;
}

#btn_bar {
	position: absolute;
	top: 20px;
	right: 20px;
}

#btn_bar img {
	float: left;
	margin-top: -5px;
}

#btn_bar div {
	float: left;
	height: 35px;
	line-height: 35px;
	font-size: 16px;
	color: #FFF;
}

#btn_bar div .logoff {
	color: #FFF;
	text-decoration: none;
}

#btn_bar div .logoff:hover {
	text-decoration: underline;
}

#left_container {
	width: 100%;
	height: 100%;
	background: url(${ctx}/static/images/juno/left_bg.jpg) no-repeat
		bottom left;
}

#tabs_content {
	width: 100%;
	height: 100%;
	border: 0px;
}

#bottom_left {
	width: 46px;
	height: 24px;
	float: left;
	background: url(${ctx}/static/images/juno/foot_left.jpg) no-repeat;
}

#bottom_right {
	width: 49px;
	height: 24px;
	float: right;
	background: url(${ctx}/static/images/juno/foot_right.jpg) no-repeat;
}

.accordion-body {
	background-color: transparent;
}

/* #bottom_container { */
/* width: 100%; */
/* height: 25px; */
/* line-height: 25px; */
/* font-size: 14px; */
/* text-align: center; */
/* color: #000; */
/* margin-left: 150px; */
/* position: fixed; */
/* bottom: 0px; */
/* left: 0; */
/* background: #E0ECFF; */
/* border-top: 2px solid #95B8E7; */
/* border-left: 1px solid #95B8E7; */
/* } */

/* #bottom_container { */
/* 	width: 100%; */
/* 	height: 100%; */
/* 	background: url(${ctx}/static/images/juno/foot_center.jpg) repeat-x; */
/* 	text-align: center; */
/* 	line-height: 24px; */
/* 	color: #153F93; */
/* } */
#bottom_container {
	width: 100%;
	height: 100%;
	text-align: center;
	line-height: 23px;
	color: #121212;
}
</style>
<script type="text/javascript">
	$(function() {
		home.initialize("#left_container", "#tabs_bar", "#tabs_content");

		<sec:authorize ifNotGranted="nDanbao">
		var data = [ {
			"id" : 1,
			"text" : "后台首页",
			"attributes" : {
				"url" : "welcome"
			}
		}];
		home.addMenu("后台首页", data);
		
		var data = [ {
			"id" : 1,
			"text" : "会员管理",
			"attributes" : {
				"url" : "member/memberManage"
			}
		} ];
		home.addMenu("会员管理", data);

		var data = [
		 {
			"id" : 1,
			"text" : "资讯管理",
			"attributes" : {
				"url" : "content/contentManage"
			}
		},
		 {
			"id" : 2,
			"text" : "投融管理",
			"attributes" : {
				"url" : "informationDemand/informationDemandManage"
			}
		},
		{
			"id" : 3,
			"text" : "评论管理",
			"attributes" : {
				"url" : "comments/commentsManage"
			}
		},
		{
			"id" : 4,
			"text" : "私信管理",
			"attributes" : {
				"url" : "message/messageManage"
			}
		}
		 ];

		home.addMenu("内容管理", data);

		</sec:authorize>

		home.addTab("后台首页", "welcome", false);

		$("#logout").click(function() {
			scene.showConfirm("确定退出吗?", "退出", function(yes) {
				if (yes) {
					window.location = "${ctx}/j_spring_security_logout";
				}
			});

		});
	});

	<sec:authorize ifAnyGranted="nDanbao">
	$(function() {
		$(".panel-title").click();
	});
	</sec:authorize>
</script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north', border:false, height:65">
		<div id="top_container">
			<div id="logo"></div>
			<div id="btn_bar">
				<div>
					<img src="${ctx}/static/images/juno/user.png" alt="" />
					<sec:authentication property="principal.username" />
					,您好!
				</div>
				<div style="margin-left: 15px;">
					<img src="${ctx}/static/images/juno/logoff.png" alt="" /><a
						id="logout" href="javascript:void(0)" class="logoff">退出</a>
				</div>
			</div>



		</div>
	</div>
	<div
		data-options="region:'west', border:false, split:true, width:150, maxWidth:200">
		<div id="left_container"></div>
	</div>
	<div data-options="region:'center', border:false">
		<div class="easyui-layout" data-options="fit:'true'">
			<div data-options="region:'north', border:true, height:31">
				<div id="tabs_bar"></div>
			</div>
			<div data-options="region:'center', border:false"
				style="overflow: hidden">
				<iframe id="tabs_content"
					data-options='frameborder:"0",marginwidth:"0",
 					marginheight="0"'></iframe>
			</div>
		</div>
	</div>
	<div data-options="region:'south', border:false, height:24">
		<div id="bottom_container">版权所有 © 上海金鹿金融信息服务有限公司
			沪ICP备14004813号-3</div>



	</div>
</body>

</html>
