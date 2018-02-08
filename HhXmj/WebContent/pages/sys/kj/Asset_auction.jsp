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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache,no-store">
    <meta http-equiv="expires" content="0"/>
    <title>鑫淼聚不良资产处置平台</title>
    <meta http-equiv="keywords" content="鑫淼聚,资产管理,鑫淼聚资产管理有限公司,投资,理财,基金，私募,集合理财,券商,专户理财,券商资管,资管,定向客户,宏观经济,业绩,领先"/>
    <meta http-equiv="description"
          content="鑫淼聚资产管理有限公司是中国证券会批准设立的首家券商资产管理公司；自1998年开始从事客户资产管理业务，2002年首批获得从事客户资产管理业务资格，2005年成为首批开展券商集合理财业务的证券公司，2010年成为首家获准设立的券商资产管理公司。 "/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css"/>
    <script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jPages.js"></script>
    <c:set var="identity" value="${currentUser.sys_user_reg_type_n}" scope="session"></c:set>
</head>
<body>
<!--注册登录-->
<div class="personal-top"></div>

<!--导航-->
<div class="personal-banner"></div>
<!--网站公告-->
<div class="notice">
    <div class="notice_c">
        <img src="pages/sys/kj/img/notice.png" class="fl img"/>
        <div class="notices">
            <div class="bd">
                <ul>
                    <li><a href="pages/sys/kj/contact.jsp">关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                    <li><a href="pages/sys/kj/contact.jsp">个人金融信息安全</a></li>
                    <li><a href="pages/sys/kj/contact.jsp">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="wrap">
    <div class="hots_div ">
        <div class="screen">
            <div class="screen_b">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="screen_table" id="choice">
                    <tr>
                        <td width="120" style="background:#ca0821; color:#ffffff; font-size:14px;">产品类</td>
                        <td>
                            <ul class="product_ul c">
                                <li xmlb="" class="on li1">不限</li>
                                <li xmlb="jr02" class="">金融国资</li>
                                <li xmlb="jr01" class="">不良资产</li>
                                <li xmlb="jr03">非国有资产</li>
                                <li xmlb="jr04">招商</li>
                            </ul>
                        </td>
                    </tr>

                    <tr class="t">
                        <td style="background:#ca0821; color:#ffffff; font-size:14px;">权属金额</td>
                        <td>
                            <ul class="xmxl_ul c">
                                <li xmxl="" class="on li1">不限</li>
                                <li xmxl="01" class="">10万-50万</li>
                                <li xmxl="02">50万-100万</li>
                                <li xmxl="03">100万-200万</li>
                                <li xmxl="03">200万以上</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td style="background:#ca0821; color:#ffffff; font-size:14px;">期限</td>
                        <td>
                            <ul class="days_ul c">
                                <li data="" class="on li1">不限</li>
                                <li data="03" class="">3个月</li>
                                <li data="06">6个月</li>
                                <li data="12">12个月</li>
                                <li data="24">24个月</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td style="background:#ca0821; color:#ffffff; font-size:14px;">归属省份</td>
                        <td>
                            <ul class="deadline_ul c">
                                <li data="" class="on li1">不限</li>
                                <li data="03" class="">河北省</li>
                                <li data="06">石家庄市</li>
                            </ul>
                        </td>
                    </tr>

                    <tr>
                        <td width="120" style="background:#ca0821; color:#ffffff; font-size:14px;">分类</td>
                        <td>
                            <ul class="classify_ul c">
                                <li classify="" class="on li1">不限</li>
                                <li classify="jr02" class="">债权</li>
                                <li classify="jr01" class="">股权</li>
                                <li classify="jr03">实物</li>
                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="index_gdlc">
        <img src="pages/sys/kj/img/corner_1.png" class="corner corner1"/>
        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2"/>
        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3"/>
        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4"/>
        <div style=" min-height: 400px;" class="mainbox">
            <input type="hidden" id="listflag" value="null">

            <h3>
                资产拍卖
                <!--<ul class="ul">
                    <li class="li_curr"><span class="span">基金</span></li>
                    <li><span class="span">专项计划</span></li>
                </ul>-->
				<span align="center" class="zcfb">
				    <a class="publich_"> 拍卖发布 </a>
				</span>
                <div class="product_search">
                    <div class="input_div input_div2">
                        <input id="searchinp" type="text" class="input input2 inputFocus" value="请输入名称、产品类"/>
                        <input id="searchbtn" type="button" value="" class="btn_search1 hand"/>
                        <ul class="nsearchlist"></ul>
                    </div>
                    <script type="text/javascript">
                        var allFunds = ["xmgj-2,东方红...,产业升级-产业升级,zBond_disposal.html,东方红产业升级",];
                        $(function () {
                            //搜索框效果
                            $("#searchinp").bind("keyup", function () {
                                $.post("auction/assets/list1",{"conditionName": "allSearch", "conditionValue":$("#searchinp").val()},function (datas) {
                                    $(".mode").html(datas)
                                });
                            });
                            $("#searchbtn").click(function () {
                            	if($("#searchinp").val()=="请输入名称、产品类"){
                            		$("#searchinp").val("");
                            	}
                                $.post("auction/assets/list1",{"conditionName": "allSearch", "conditionValue":$("#searchinp").val()},function (datas) {
                                    $(".mode").html(datas)
                                });
                            });
                            $("#searchinp").bind("click", function (e) {
                                e.stopPropagation();
                            });
                            $(document).bind("click", function () {
                                $(".nsearchlist").hide();
                            });
                        });
                    </script>
                </div>
            </h3>
            <div class="mode">
                <jsp:include page="asset_aution_list.jsp"></jsp:include>
            </div>
        </div>
    </div>
</div>
<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
<script type="text/javascript">
	$(function(){
		$(".publich_").click(function(){
			var user_type = "企业发布方";
			var identity ="${identity}";
			if(user_type==identity){
				window.location.href="auction/assets/index";
			}else{
				alert("不好意思，尊敬的"+name+"。只有发布方可以进行拍卖发布！");
			}
		});
	});
</script>
<script>
function  removeCl(){
		$(".xmxl_ul li").each(function(){
			$(".xmxl_ul li").removeClass("on");
			
		});
		$(".deadline_ul li").each(function(){
			$(".deadline_ul li").removeClass("on");
		});
		$(".days_ul li").each(function(){
			$(".days_ul li").removeClass("on");
		});
		$(".product_ul li").each(function(){
			$(".product_ul li").removeClass("on");
		});
		$(".classify_ul li").each(function(){
			$(".classify_ul li").removeClass("on");
		});
		$(".li1").addClass("on");
	};
    $(function(){
        var liobj=$(".xmxl_ul li");
        liobj.each(function(){
            $(this).click(function(){
            	removeCl();
                liobj.removeClass("on")
                $(this).addClass("on");
                var conditionValue =  $(this).text();
                if (conditionValue != "不限") {
                    $.post("auction/assets/list1",{"conditionName": "auction_ownership_amount", "conditionValue": conditionValue},function (datas) {
                        $(".mode").html(datas)
                    });
                }else {
                    $.post("auction/assets/list1",{},function (datas) {
                        $(".mode").html(datas)
                    });
                }
            });
        });
    });
    $(function(){
        var liobj=$(".deadline_ul li");
        liobj.each(function(){
            $(this).click(function(){
            	removeCl();
                liobj.removeClass("on")
                $(this).addClass("on");
                var conditionValue =  $(this).text();
                if (conditionValue != "不限" && conditionValue != "河北省") {
                    $.post("auction/assets/list1",{"conditionName": "auction_location", "conditionValue": conditionValue},function (datas) {
                        $(".mode").html(datas)
                    });
                }else {
                    $.post("auction/assets/list1",{},function (datas) {
                        $(".mode").html(datas)
                    });
                }
            });
        });
    });
    $(function(){
        var liobj=$(".days_ul li");
        liobj.each(function(){
            $(this).click(function(){
            	removeCl();
                liobj.removeClass("on")
                $(this).addClass("on");
                var conditionValue =  $(this).text();
                if (conditionValue != "不限") {
                    $.post("auction/assets/list1",{"conditionName": "auction_bidding_cycle", "conditionValue": $(this).text()},function (datas) {
                        $(".mode").html(datas)
                    });
                }else {
                    $.post("auction/assets/list1",{},function (datas) {
                        $(".mode").html(datas)
                    });
                }
            });
        });
    });
    $(function(){
        var liobj=$(".product_ul li");
        liobj.each(function(){
            $(this).click(function(){
            	removeCl();
                liobj.removeClass("on")
                $(this).addClass("on");
                var conditionValue =  $(this).text();
                if (conditionValue != "不限") {
                    $.post("auction/assets/list1",{"conditionName": "auction_product_solutions", "conditionValue": $(this).text()},function (datas) {
                        $(".mode").html(datas)
                    });
                }else {
                    $.post("auction/assets/list1",{},function (datas) {
                        $(".mode").html(datas)
                    });
                }
            });
        });
    });

    $(function(){
        var liobj=$(".classify_ul li");
        liobj.each(function(){
            $(this).click(function(){
            	removeCl();
                liobj.removeClass("on")
                $(this).addClass("on");
                var conditionValue =  $(this).text();
                if (conditionValue != "不限") {
                    $.post("auction/assets/list1",{"conditionName": "auction_classify", "conditionValue": $(this).text()},function (datas) {
                        $(".mode").html(datas)
                    });
                }else {
                    $.post("auction/assets/list1",{},function (datas) {
                        $(".mode").html(datas)
                    });
                }
            });
        });
    });
</script>
</body>
</html>