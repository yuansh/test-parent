// JavaScript Document

$(function(){
	
	$("li.info-tip").mouseover(function(){
		$(".info-detail").show();
		$(this).click(function(){
			 window.location.href = "${ctx}/message";
		});
	});
	$("li.info-tip").mouseleave(function(){
		$(".info-detail").hide();
		});
	
	
	$("#gb_prompt").click(function(){
		$("#n_prompt").hide();
		});
	
	/*头部导航*/
		
	$('ul.nav_list li').click(function(){
		$(this).find('a').addClass('hover');;	
		$(this).siblings().find('a').removeClass('hover')	
	});
	
	/*左导航*/
		var oNav=$('.user_nav h4');
		var oLis=oNav.next().children();
		oNav.click(function(){
			if($(this).next('ul').css('display')=='block'){
				$(this).next('ul').slideUp();
				$(this).find('i').css('background-position','0 -8px');
			}else{
				$(this).next('ul').slideDown();
				$(this).find('i').css('background-position','0 0');
			}
		})
		oLis.click(function(){
			$(this).addClass('active').siblings().removeClass('active');
		})
		
	/*筛选更多*/	
	var $fold=$(".agency ul:gt(1)");
		$("#fold_more").click(function(){
			if($fold.is(":visible")){
				$fold.hide();
				$(this).addClass('fold_more').removeClass('fold_cut');
				$(this).html("更多");
			}else{
				$fold.show();
				$(this).addClass('fold_cut').removeClass('fold_more');
				$(this).html("收起");
				}
			});
	
	
	/*小提示*/			
	$("#ques_tip").hover(function(){
		$("#buy_tip").show();
		},function(){
		$("#buy_tip").hide();	
			});	

	/*支付列表*/
	var	$formlist=$("#tab_asset");
		$formlist.show();
		$("#paylist").click(function(){
			if($formlist.is(":visible")){
				$formlist.hide();
				$(this).addClass('fold_more').removeClass('fold_cut');
				$(this).html("支付列表");
			}else{
				$formlist.show();
				$(this).addClass('fold_cut').removeClass('fold_more');
				$(this).html("收起列表");
				}
			});
			
	
	/*计算器*/
	$("#calculator").hide();
	$("#shade").hide();


	$("#float-nav").click(function(){
		if($("#calculator").is(":hidden")){
			$("#calculator").show();
			$("#shade").show();
			
		}else{
			$("#calculator").hide();
			$("#shade").hide();	
		}
		$("#calculator_close").click(function(){
			$("#calculator").hide();
			$("#shade").hide();	
		});
	});

	/*协议弹出*/	
		$(function() {
            $("#protocol,#deal_list").click(function() { //注册删除按钮点击事件
                $(".mask").show(); //显示背景色
                showDialog(); //设置提示对话框的Top与Left
                $(".dialog").show(); //显示提示对话框
				
				
				$(".dealtitle").click(function(){
					if($(this).next('.protocol_datail').is(":hidden")){
						$(this).next('.protocol_datail').show();
						$(this).siblings().next('.protocol_datail').hide();
					}else{
						$(this).next('.protocol_datail').hide();
					}					
				});
            })
			
			/*************** 导入页面的弹出框们 ***************/
			
            $("#submit").click(function() { //注册删除按钮点击事件
                $(".mask").show(); //显示背景色
                showDialog(); //设置提示对话框的Top与Left
                $(".submit_dialog").show(); //显示提示对话框
            })
			
			
			
			$("#clear").click(function() { //注册删除按钮点击事件
                $(".mask").show(); //显示背景色
                showDialog(); //设置提示对话框的Top与Left
                $(".clear_dialog").show(); //显示提示对话框
            })
			
            /*
            *根据当前页面与滚动条位置，设置提示对话框的Top与Left
            */
            function showDialog() {
                var objW = $(window); //当前窗口
                var objC = $(".dialog"); //对话框
                var brsW = objW.width();
                var brsH = objW.height();
                var sclL = objW.scrollLeft();
                var sclT = objW.scrollTop();
                var curW = objC.width();
                var curH = objC.height();
                //计算对话框居中时的左边距
                var left = sclL + (brsW - curW) / 2;
                //计算对话框居中时的上边距
                var top = sclT + (brsH - curH) / 2;
                //设置对话框在页面中的位置
                objC.css({ "left": left, "top": top });
            }

            $(window).resize(function() {//页面窗口大小改变事件
                if (!$(".dialog").is(":visible")) {
                    return;
                }
                showDialog(); //设置提示对话框的Top与Left
            });

            $(".title img").click(function() { //注册关闭图片点击事件
                $(".dialog").hide();
                $(".mask").hide();
            })

            $("#Button3").click(function() {//注册取消按钮点击事件
                $(".dialog").hide();
                $(".mask").hide();
            })

            $("#Button2").click(function() {//注册确定按钮点击事件
                $(".dialog").hide();
                $(".mask").hide();
                if ($("#checkb").attr("checked","false")) {
					 $("#checkb").attr("checked","true");
					 }else{
						 return;
						 }
            })
        })



	/*tab切换*/	
	 function tabs(tabTit,on,tabCon){
		$(tabCon).each(function(){
		$(this).children().eq(0).show();
		});
		$(tabTit).each(function(){
			$(this).children().eq(0).addClass(on);
		});
		$(tabTit).children().click(function(event){
			event.stopPropagation();
			$(this).addClass(on).siblings().removeClass(on);
			var index = $(tabTit).children().index(this);
			$(tabCon).children().eq(index).show().siblings().hide();
		});
	}
	   tabs(".tab-head","active",".tab-content");
	  tabs(".tab-hd","active",".tab-ct");
	  tabs(".bankTriggers","active",".bankContents"); 

	/*点击变色*/

	/*input焦点失去获得*/
 $("input.foucs_blur").focus(function(){
              if($(this).val() == this.defaultValue){  
                  $(this).val("");           
              } 
        }).blur(function(){
             if ($(this).val() == '') {
                $(this).val(this.defaultValue);
             }
  });	  
	
	
$(".click_red").click(function(){
	$(this).parent('li').remove();
	}); 


/*问题*/	
$(".question").mouseover(function(){
		$('#question').show();
		});
	$(".question").mouseleave(function(){
		$('#question').hide();
		});

/*帮助中心左右高度处理*/
// if($("#left").offsetHeight>=$("#right").offsetHeight){
// 	$("#right").style.height=$("#left").offsetHeight + "px";
// }


/*活动01*/
$("#wmddtys").click(function(){
		$(".wmddtys").show();
		$(this).hide();
		});
$("#fxtsaqfk").click(function(){
		$(".fxtsaqfk").show();
		$(this).hide();
		});
		
$("#packUp").click(function(){
	if($("#packDown").is(':visible')){
		$("#packDown").hide();
		$(this).html("更多");
		}else{
			$("#packDown").show();
			$(this).html("收起");
			}
	});		
			
$("#help_info").click(function(){
	$("#wenti_content").show();
});
$("#wenti_close").click(function(){
	$("#wenti_content").hide();
});	


	var	$may_chose=$("#may_chose");
		$may_chose.hide();
		$("#may_btn").click(function(){
			if($may_chose.is(":visible")){
				$may_chose.hide();
				$(this).addClass('may_btn_up').removeClass('may_btn_down');
				$(this).html("展开可选项");
			}else{
				$may_chose.show();
				$(this).addClass('may_btn_down').removeClass('may_btn_up');
				$(this).html("收起可选项");
				}
			});
	
	
	
// $("#wenti_content").mouseleave(function(){
// 	$(this).hide();
// });
	
$("#addtf_btn").click(function(){
	if($("#add_transferor").is(':visible')){
		$("#add_transferor").hide();
		}else{
			$("#add_transferor").show();
			$("#vfy_add,#no_vfy_add").click(function(){
				$("#add_transferor").hide();
				});
			}
	});		

var showNext=$('.showNext');
		showNext.click(function(){
			var $next=$(this).parents('.brick').next('.brick_none');
			if($next.is(':visible')){
				$next.hide();
				}else{
					$next.show();
				}
					/*$('#ft_next').click(function(){
						
						
						$('#ph_step01').hide();
						$('#ph_step02').show();
					});
					$('#sd_next').click(function(){
						$('#ph_step01').hide();
						$('#ph_step02').hide();
						$('#ph_step03').show();
					});*/

		});
		
	 $("#first_nxt_bt").click(function(){
		 $("#bank_02").show();
		 $("#bank_01").hide();
		 });
	 $("#two_nxt_bt").click(function(){
		 $("#bank_03").show();
		 $("#bank_02").hide();
		 $("#bank_01").hide();
		 });
	  
	  
	  $("#amend_tip").mouseenter(function(){
		  $("#amend_shm").show();
		  });
		$("#amend_tip").mouseout(function(){
		  $("#amend_shm").hide();
		  });	  

});




/*添加银行卡*/
$(function(){
		var isOpen = false;
		$("#bank_open").click(function(event){
			if(isOpen){
				closeBank();
			}else{
				openBank();
			}
			event.stopPropagation();
		});
		$("body").click(function(){
			closeBank();
		});
		
		
	function openBank(){
				isOpen = true;
				$("#bank_open").removeClass("bank-click_off").addClass("bank-click_on");
				$("#bankPicker").show();
				$("#first_triger").click();
				$("#J_colse").click(function(){
					closeBank();
				});
	}
	function closeBank(){
				isOpen = false;
				$("#bank_open").removeClass("bank-click_on").addClass("bank-click_off");
				$("#bankPicker").hide();
	}
})


$(function(){
	$("#circle1").mouseover(function(){
		$("#circle01").fadeIn("slow");
		});
	$("#circle1").mouseleave(function(){
		$("#circle01").fadeOut("slow");
		});
	$("#circle2").mouseover(function(){
		$("#circle02").fadeIn("slow");
		});
	$("#circle2").mouseleave(function(){
		$("#circle02").fadeOut("slow");
		});
		
	$("#circle3").mouseover(function(){
		$("#circle03").fadeIn("slow");
		});
	$("#circle3").mouseleave(function(){
		$("#circle03").fadeOut("slow");
		});
	$("#circle4").mouseover(function(){
		$("#circle04").fadeIn("slow");
		});
	$("#circle4").mouseleave(function(){
		$("#circle04").fadeOut("slow");
		});
		
	$("#circle5").mouseover(function(){
		$("#circle05").fadeIn("slow");
		});
	$("#circle5").mouseleave(function(){
		$("#circle05").fadeOut("slow");
		});
	});

$(function(){
    var x = 10;  
	var y = 20;
	$("a.tooltip").mouseover(function(e){
       	this.myTitle = this.title;
		this.title = "";
	    var tooltip = "<div id='tooltip'>"+ this.myTitle +"<\/div>"; //创建 div 元素
		$("body").append(tooltip);	//把它追加到文档中
		$("#tooltip")
			.css({
				"top": (e.pageY+y) + "px",
				"left": (e.pageX+x)  + "px"
			}).show("fast");	  //设置x坐标和y坐标，并且显示
    }).mouseout(function(){	
		this.title = this.myTitle;
		$("#tooltip").remove();   //移除 
    }).mousemove(function(e){
		$("#tooltip")
			.css({
				"top": (e.pageY+y) + "px",
				"left": (e.pageX+x)  + "px"
			});
	});
})

/* $(function(){
	
	 setInterval(function(){
		 if($("#staticBar").offset().top<$(window).scrollTop()+$(window).height()){
				$("#fixBar").hide();
				$("#staticBar").css("visible","visible");
			}else{
				$("#fixBar").show();
				$("#staticBar").css("visible","hidden");
			}
	 },50);//1000为1秒钟
     	
	}); */
	
	
/*协议弹出*/	
$(function() {

	/*************** 导入页面的弹出框们 ***************/
	
	$(".publish").click(function() { //产品发布未认证
		$(".j_mask").show();
		showDialog();
		$(".j_dialog1").show();
	});
	
	$(".revoked").click(function() { //注册删除按钮点击事件
		$(".j_mask").show();
		showDialog();
		$(".j_dialog2").show();
	});
	$(".cancel").click(function() { //关闭按钮
		$(".j_dialog").hide();
		$(".j_mask").hide();
	});
	
	$(".j_submit").click(function() { //提交资产
		$(".j_mask").show();
		showDialog();
		$(".j_dialog3").show();
	});
	
	$(".j_hover").click(function() { //查看大图
		$(".j_mask").show();
		showDialog();
		$(".j_dialog5").show();
	});
	
	$(".j_moreinfo").click(function() { //更多详情
		$(".j_mask").show();
		showDialog();
		$(".j_dialog4").show();
	});
	
	
	$(".btn").click(function() { //上传图片 修改图片大小
		$(".j_mask").show();
		showDialog();
		$(".j_dialog6").show();
	});
	
	

	function showDialog() {		//根据当前页面与滚动条位置，设置提示对话框的Top与Left
		var objW = $(window);
		var objC = $(".j_dialog"); 
		var brsW = objW.width();
		var brsH = objW.height();
		var sclL = objW.scrollLeft();
		var sclT = objW.scrollTop();
		var curW = objC.width();
		var curH = objC.height();
		//计算对话框居中时的左边距
		var left = sclL + (brsW - curW) / 2;
		//计算对话框居中时的上边距
		var top = sclT + (brsH - curH) / 2;
		//设置对话框在页面中的位置
		objC.css({ "left": left, "top": top });
	}

	$(window).resize(function() {//页面窗口大小改变事件
		if (!$(".j_dialog").is(":visible")) {
			return;
		}
		showDialog(); //设置提示对话框的Top与Left
	});


})


/**** 附件上传 ****/

$(function() {
	var j_imgo = $(".attachment .j_overview");
	var j_hover = $(".j_hover");
	var j_delete = $(".j_delete");
	
	for(var i = 0; i < j_imgo.length; i++){
		j_imgo[i].idx = i;
		j_imgo.eq(i).mouseenter(function(event){
			var idx = this.idx;
			for(var j = 0; j < j_hover.length; j++){
				if(j == idx){
					j_hover.eq(j).show();
					j_delete.eq(j).show();
					event.stopPropagation(); 
					
				}else{
					j_hover.eq(j).hide();
					j_delete.eq(j).hide();
				}
			}
		});
		j_imgo.eq(i).mouseleave(function(event){
			var idx = this.idx;
			for(var j = 0; j < j_hover.length; j++){
				if(j == idx){
					j_hover.eq(j).hide();
					j_delete.eq(j).hide();
					event.stopPropagation(); 
				}
			}
		});
		
		j_delete.click(function(){
			$(this).parent('.j_overview').css("display","none");
			return false;
		});
	}
	
	
	var j_addmore = $(".attachment .j_addmore");
	var j_file = $(".attachment .j_addmore div");
	for(var m = 0; m < j_addmore.length; m++){
		j_addmore[m].idx = m;
		j_addmore.eq(m).mouseenter(function(event){
			var idx = this.idx;
			for(var n = 0; n < j_file.length; n++){
				if(n == idx){
					j_file.eq(n).show();
					event.stopPropagation(); 
				}else{
					j_file.eq(n).hide();
				}
			}
		});
		j_addmore.eq(m).mouseleave(function(event){
			var idx = this.idx;
			for(var n = 0; n < j_file.length; n++){
				if(n == idx){
					j_file.eq(n).hide();
					event.stopPropagation(); 
				}
			}
		});
	}
	

	
})

	function previewImage(url) {
		var html = $('<div class="jtoast-view mode-shade" id="hideview"><div class="jtoast-shade"></div><div class="jtoast-box" style="width:1000px"><div class="jtoast-title" style="height:16px"><span id="close"></span> <span id="title"></span></div><div class="jtoast-content" style="text-align:center;min-height:200px"><img src="'+url+'" alt="" style="max-width:900px;max-height:680px"></div></div></div>');
		html.find("#close").click(function() {
			$(this).parents("div:eq(2)").remove();
		});
		$('body').append(html);
	}




		
		
		
		
		
		
		
		
		
		