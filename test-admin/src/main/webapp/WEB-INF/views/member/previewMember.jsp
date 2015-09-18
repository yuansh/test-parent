<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>账户中心-会员中心-会员详情</title>
<style type="text/css">
.fl {
    float: left;
}


.w_wd245 {
}
.ml_20 {
    margin-left: 5px;
}
.j_details h3, .j_listleft h3, .j_listright h3 {
    text-align: right;
    width: 85px;
}
h1, h2, h3, h4, h5, h6 {
    font-size: 100%;
}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, fieldset, input, textarea, p, blockquote, th, td, img, area, param {
    margin: 0;
    padding: 0;
}


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
    border-bottom: 1px dashed #e4e4e4;
    color: #141414;
    font-size: 16px;
    height: 40px;
    line-height: 40px;
    padding-left: 10px;
}

.mb_40 {
    margin-bottom: 40px;
}
.mt_20 {
    margin-top: 20px;
}

.dialog{width:1000px;border:solid 1px #d8d8d8;position:absolute;display:none;z-index:101; background:#FFF;}
   .dialog .title{padding:10px 10px 10px 40px;color:#0b92dc;font-weight:bold; font-size:16px;}
   .dialog .title img{float:right; cursor:pointer;}
   .dialog .content02{background-color:#fff; margin-left:100px;}
   .dialog .content02 img{float:left}
   .dialog .content02 span{float:left;padding-top:10px;padding-left:10px}
   .dialog .bottom{text-align:right;padding:10px 10px 10px 0px;background-color:#eee; position:absolute; bottom:0; right:0;}
   .mask{width:100%;height:100%; background-color:#000;position:absolute;
		  top:0px;left:0px;filter:alpha(Opacity=50);-moz-opacity:0.5;opacity: 0.5;display:none;z-index:100} 
   .btn {border:#666 1px solid;padding:2px;width:65px;
   filter:progid:DXImageTransform.Microsoft.Gradient(GradientType=0,StartColorStr=#ffffff, EndColorStr=#ECE9D8);}
   
   .dialog01{width:960px;border:solid 1px #d8d8d8;position:absolute;display:none;z-index:101; background:#FFF;}
   .dialog01 .title{padding:10px 10px 10px 40px;color:#0b92dc;font-weight:bold; font-size:16px;}
   .dialog01 .title img{float:right; cursor:pointer;}
   .dialog01 .content02{background-color:#fff; margin-left:100px;}
   .dialog01 .content02 img{float:left}
   .dialog01 .content02 span{float:left;padding-top:10px;padding-left:10px}
   .dialog01 .bottom{text-align:right;padding:10px 10px 10px 0px;background-color:#eee; position:absolute; bottom:0; right:0;}
   a.auth_code{ padding:9px 25px; background:#d8d8d8; color:#000; margin-left:20px;}
   .ml130px{ margin-left:130px;}
   
   
</style>
<link type="text/css" rel="stylesheet" href="${ctx}/static/styles/styles/newsManagement.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/jtoast/css/jtoast.css" />
<script type="text/javascript">
</script>
</head>

<body>      
	
	<div class="fl" id="right">
                    <div class="m_block">
                        <h2 class="title clearfix ">
                            <div class="fl">会员详情</div>
                        </h2>
						<div class="j_details">
							<div style="margin-top: 1%;" class="clearfix mt_22">
								<h3 class="fl">${memberObj.name}</h3>
							</div>
							
							<div style="margin-top: 1%;" class="clearfix mt_22">
								<div class="clearfix mt_22">
									<span  class="attachment ml_20">
										 <div style="margin-left: 50px;margin-right:-1px;" class="re_position fl mr_10 j_overview">
											 <img src="${ctx}/attachment/${memberObj.imgMogid}" alt="${memberObj.name}"  onerror="javascript:this.src='${ctx}/static/images/US.png';"  class="j_attachment">
											 <div class="ab_position j_imgo"></div>
										 </div>
									   </span>  
								 </div>
							</div>	
							<div style="margin-top: 1%;" class="clearfix mt_22">
							<div class="j_listleft fl">
								<div class="clearfix mt_22">
									<h3 class="fl">邮箱</h3>
									<div class="fl w_wd245 ml_20">${memberObj.email}</div>
								</div>
								<div class="clearfix mt_22">
									<h3 class="fl">性别</h3>
									<div class="fl w_wd245 ml_20">
										<c:choose>
											<c:when test="${memberObj.sex=='1'}">
												男
											</c:when>
											<c:when test="${memberObj.sex=='2'}">
											          女
											</c:when>
											
											<c:otherwise>
												保密
											</c:otherwise>
										</c:choose>
									
									 </div>
								</div>
								<div class="clearfix mt_22">
									<h3 class="fl">生日</h3>
									<div class="fl w_wd245 ml_20"><fmt:formatDate value="${memberObj.birthday}" pattern="yyyy年MM月dd日"/> </div>
								</div>
								
							</div>
							
							
							<div class="j_listright fl">
								
								<div class="clearfix mt_22">
									<h3 class="fl">现居城市</h3>
									<div class="fl w_wd245 ml_20">
									
										<c:if test="${!empty memberObj.province}">${provinceAreaName}，</c:if>${cityAreaName}
									
									</div>
								</div>
								<div class="clearfix mt_22">
									<h3 class="fl">职业</h3>
									<div class="fl w_wd245 ml_20">
									  <c:if test="${memberObj.career eq '1' }"> 银行 </c:if>
									  <c:if test="${memberObj.career eq '2' }"> 保险 </c:if> 
									  <c:if test="${memberObj.career eq '3' }"> 基金 </c:if>
									  <c:if test="${memberObj.career eq '4' }"> 证券 </c:if> 
									  <c:if test="${memberObj.career eq '5' }"> 投资 </c:if> 
									  <c:if test="${memberObj.career eq '6' }"> 期货 </c:if> 
									  <c:if test="${memberObj.career eq '7' }"> 信托 </c:if> 
								      <c:if test="${memberObj.career eq '8' }"> 担保 </c:if> 
									  <c:if test="${memberObj.career eq '9' }"> 拍卖 </c:if> 
									  <c:if test="${memberObj.career eq '10' }">典当 </c:if> 
									</div>
								</div>
								<div class="clearfix mt_22">
									<h3 class="fl">所在公司</h3>
									<div class="fl w_wd245 ml_20">${memberObj.company}</div>
								</div>
							</div>
							</div>
							
							<div style="margin-top: 1%;" class="clearfix mt_22">
								<div class="clearfix mt_22">
									<h3 class="fl">介绍</h3>
									<div class="fl  w_wd580 ml_20">${memberObj.discription}</div>
								</div>
							</div>
						</div>
					</div>
                </div>
	
</body>
</html>