      
//持有中tab
function positionTab(){
	//隐藏样式
	$("#favoriteDiv").hide();
	$("#favoriteLi").removeClass();
	$("#inProgressDiv").hide();
	$("#inProgressLi").removeClass();
	$("#transferDiv").hide();
	$("#transferLi").removeClass();
	$("#delegationFailedDiv").hide();
	$("#delegationFailedLi").removeClass();
	//显示样式
	$("#positionDiv").show();
	$("#positionLi").addClass("hover");
	jQuery.ajax({
		url:"https://trade.tjfae.com/home/user/get_balance.htm",
		async:false,
		success:function(data){
			$("#positionTable tr td").remove();
			$("#positionTable").append(data);
		}
	});
}
//已兑付tab

//认购失败tab
function delegationFailedTab(){
	//隐藏样式
	$("#favoriteDiv").hide();
	$("#favoriteLi").removeClass();
	$("#inProgressDiv").hide();
	$("#inProgressLi").removeClass();
	$("#transferDiv").hide();
	$("#transferLi").removeClass();
	$("#positionDiv").hide();
	$("#positionLi").removeClass();
	//显示样式
	$("#delegationFailedDiv").show();
	$("#delegationFailedLi").addClass("hover");
	jQuery.ajax({
		url:"https://trade.tjfae.com/home/user/get_delegate_failed.htm",
		success:function(data){
			$("#delegationFailedTable tr td").remove();
			$("#delegationFailedTable").append(data);
		}
	});
}
//li标签hover切换
function changeHover(liId){
	var tempUrl = "";
	$("li[name='tableLi']").each(function(){ 
            tempUrl=$(this).attr("id") 
            if((tempUrl.indexOf(liId) >= 0 )){ 
                 $(this).attr("class","hover"); 
                return false; 
            }else{
				$(this).attr("class",""); 
			} 
       });
}

        <!--导航树-->
    	$(function(){
			$(".treebox .level1>a").click(function(){
				$(this).addClass('current')  
				.find('i').addClass('down')  
				.parent().next().slideDown('slow','easeOutQuad')  
				.parent().siblings().children('a').removeClass('current')
				.find('i').removeClass('down').parent().next().slideUp('slow','easeOutQuad');
				 return false; //阻止默认时间
			});
		})
    	
	
	$(function(){
    var liobj=$(".level2 li a");
    liobj.each(function(){
        $(this).click(function(){
        liobj.removeClass("selectedMenu")
            $(this).addClass("selectedMenu");
            //return false;    //加这句来阻止跳转 可用来调试效果
        });
    });
});


	$('#addUser').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").show();
  		$("#modify_ped").hide();
  		$("#my_infomation").hide();
  		$("#my_transaction").hide();
  		$("#my_asset").hide();
  		$("#jbxgk").hide();
    });
	$('#modify_pwd').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").show();
  		$("#my_infomation").hide();
  		$("#my_transaction").hide();
  		$("#my_asset").hide();
  		$("#jbxgk").hide();
    });
    $('#infomation').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").hide();
  		$("#my_infomation").show();
  		$("#my_transaction").hide();
  		$("#my_asset").hide();
  		$("#jbxgk").hide();
    });
    $('#transaction').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").hide();
  		$("#my_infomation").hide();
  		$("#my_transaction").show();
  		$("#my_asset").hide();
  		$("#jbxgk").hide();
    });
       $('#asset').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").hide();
  		$("#my_infomation").hide();
  		$("#my_transaction").hide();
  		$("#my_asset").show();
  		$("#jbxgk").hide();
    });
	$('#companyx').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addcompanyInfo").show();
  		$("#addUserInfo").hide();
    });
	$('#users').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
        $("#addcompanyInfo").hide();
  		$("#addUserInfo").show();
    });
  