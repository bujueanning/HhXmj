<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache,no-store">
	<meta http-equiv="expires" content="0"/>
	<title>鑫淼聚不良资产处置平台</title>
	<meta http-equiv="keywords" content="鑫淼聚,资产管理,鑫淼聚,东方证券资产管理有限公司,投资,理财,基金，私募,集合理财,券商,专户理财,券商资管,资管,定向客户,宏观经济,业绩,领先"/>
	<meta http-equiv="description" content="鑫淼聚资产管理有限公司是中国证券会批准设立的首家券商资产管理公司；自1998年开始从事客户资产管理业务，2002年首批获得从事客户资产管理业务资格，2005年成为首批开展券商集合理财业务的证券公司，2010年成为首家获准设立的券商资产管理公司。 "/>
	<link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css?t=201710102113"/>
	<link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css?t=201710102113"/>
	<link rel="stylesheet" type="text/css" href="pages/sys/kj/css/user.css?t=201710102113"/>
	<!-- bootstrap datepicker -->
	<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
	<script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/main.js"></script>

	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
	<style type="text/css">
		.thStyle{
			width:130px ;
			border-width:1px;
			text-align:center
		}

		.tdStyle{
			width: 150px;
			border-width:1px;
			text-align:center
		}
	</style>
</head>
<body>
<!-- 登陆注册 -->
<div class="personal-top"></div>


<!--导航-->
<div class="personal-banner"></div>
<!--网站公告-->
  <div class="notice">
      <div class="notice_c">
          <img src="pages/sys/kj/img/notice.png" class="fl img" />
          <div class="notices">
              <div class="bd">
                  <ul>
                      <li><a href="contents.html" >关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                      <li><a href="contents.html" >个人金融信息安全</a></li>
                      <li><a href="contents.html">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                  </ul>
              </div>
          </div>
      </div>
  </div>

  
<div class="wrap" style="    margin-top: 20px;">
    	
 	 	<div class="w1000 bc mt10">
			<!--左侧导航-->
			<div class="w1000 bc mt10">
		  	<div class="w130 fl">
			    <div class="treebox">
					<ul class="menu">
						<li class="level1" style="border-top:1px solid #ca0821;">
							<a href="#none"><em class="ico ico1"></em>个人信息<i class="down"></i></a>
							<ul class="level2">
								<li><a id="addUser" href="javascript:;">完善资料</a></li>
								<li><a id="modify_pwd" href="javascript:;">修改密码</a></li>
							</ul>
						</li>
						<li class="level1">
							<a href="#none"><em class="ico ico2"></em>发布管理<i></i></a>
							<ul class="level2">
								<li><a id="infomation" href="javascript:;">我的发布</a></li>
								<li><a id="asset" href="javascript:;">我的拍卖</a></li>
								<li><a id="transaction" href="javascript:;">购买资产</a></li>
							</ul>
						</li>
					</ul>
				</div>
			    <div class="ad mt10">
		        <img width="140px" src="pages/sys/kj/img/ad5.png">
		        </div>
		    </div>
		  </div>
			<!-- 右侧信息 -->		
			<div class="w850 fr"  id="my_infomation" style="display: none;">
				<div class="space-right w850 fr" style="background-color: white;">
					<div class="bc location bai_se" style="height:60px;border: 0;margin-bottom: 0px;">
					   <div style="float:left; width:240px; margin-top:0px; margin-left:0px;padding:0px;" align="left" height="100%"> 
						  <img height="60px;" width="200" style=" margin-left:-12px; " src="pages/sys/kj/img/infomation.png">
					   </div>
					   <div align="center" class="zcfb">
					       <a href="bond/disposal/index"> 信息发布	</a>
					   </div>					  
					</div>
					<div class="" style="background-color: white;border-bottom:1px #ccc solid;">
					<div class="tab-box">
						<div class="box_tab" style="border: none;border-bottom: 1px solid #e1e1e1;">
										<ul>            
								            <li id="positionLi" onclick="positionTab()" class="hover">资产处置</li>
								            <li id="delegationFailedLi" onclick="delegationFailedTab()" class="">资产委外</li>
									        <li style="margin-left: 475px;font-size: 12px;">
										        <select id="sel" class="inpt w100">
										        	<option value="">全部状态</option>
										        	<option value="01">待审核</option>
										        	<option value="03">已发布</option>
										        	<option value="09">已结束</option>
										        </select>
								            </li>
										</ul>
						</div>
						<!--资产处置-->
						<div id="positionDiv" class="btop-none p20 " style="display: block;">
							<div class="box p15" style="table-layout:automatic;" width="100%" border="0" cellspacing="0" cellpadding="0">
								<div id="bond_disposal" class="box_con1" style="border-style:none;">
									
								</div>
							</div>
						</div>
						<!-- 资产委外 -->
						<div id="delegationFailedDiv" class="btop-none p20 " style="display: none;">
							<div id="publish" class="box_con1" style="border-style:none;">
							</div>
						
						</div>	
					
					</div>				
				
				</div>
			
			
			</div>
			
		
		</div>
		<div class="clear"></div>	
				
</div>





<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>

<script type="text/javascript">
$(function(){
	
	$.post("bond/sheet/listtree",{},function (datas) {
    	$("#bond_disposal").html(datas);
    });
    $.post("bond/accept/listtree",{},function (datas) {
    	$("#publish").html(datas);
    });
    

});




</script>
<script type="text/javascript">


$(function(){
	$("#addUserInfo").hide();
	$("#modify_ped").hide();
	$("#my_infomation").show();
	$("#my_transaction").hide();
	$("#my_asset").hide();
});
   



</script>

 <script type="text/javascript">
      	//资产处置tab
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
//资产处置tab

//资产委外tab
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


    </script>
    
  
</body>
</html>