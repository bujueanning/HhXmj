<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <meta http-equiv="keywords" content="鑫淼聚,资产管理,鑫淼聚资产管理有限公司,投资,理财,基金，私募,集合理财,券商,专户理财,券商资管,资管,定向客户,宏观经济,业绩,领先"/>
    <meta http-equiv="description" content="鑫淼聚资产管理有限公司是中国证券会批准设立的首家券商资产管理公司；自1998年开始从事客户资产管理业务，2002年首批获得从事客户资产管理业务资格，2005年成为首批开展券商集合理财业务的证券公司，2010年成为首家获准设立的券商资产管理公司。 "/>
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
    <script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
	<style type="text/css">
		a{ 
			cursor:pointer
		 }
		.padding20{
			margin-top: 0px;
		    margin-bottom: 0px; 
		    padding: 0px 20px; 
		    color: rgb(40, 40, 40); 
		    font-family: 微软雅黑, 仿宋, arial, sans-seri; 
		    font-size: 14px; text-indent: 30px; 
		    white-space: normal; 
		    background-color: rgb(255, 255, 255);
		} 
	</style>


</head>
<body style="background-color: #fff;">
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
                    <li><a href="pages/sys/kj/contact.jsp" >关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                    <li><a href="pages/sys/kj/contact.jsp" >个人金融信息安全</a></li>
                    <li><a href="pages/sys/kj/contact.jsp">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="wrap" style="background-color: #fff;">
    <div  class="img aboutbj"></div>

    <!--公司简介-->
    <div class="container">
        <div class="wrap-page border-none">
            <div class="w1080 bc">
                <div class="list_left fl">
                    <div class="list_nav">
                        <ul>
                            <li onclick="introduce()"><a id="com" class="cur">公司介绍</a></li>
                            <li><a href="pages/sys/kj/contact.jsp">联系我们</a></li>
                            <li onclick="invest()"><a id="inv">投资之道</a></li>
                            <li onclick="face()"><a id="face">面对面</a></li>
                            <li onclick="winning()"><a id="win">长期致胜之道</a></li>
                        </ul>
                    </div>
                </div>
                <div class="list_right fl a1" style="display: block;">
                    <div class="font-14 about-content">
                        <div class="fl">
                            <div class="list_con">
                                <h1 class="hd"><span class="hover introduce">公司介绍</span></h1>
                                <div id="context">
                                	<p class="padding20">
	                                	<span style="font-size: 16px; line-height: 30px;">
	                                	        鑫淼聚，是我国金融建设与发展必备的基础性工程，为中国金融资产的登记、托管、结算、清退提供专业化的服务，为金融资产实现标准化奠定了基础，为加速金融产品流转创造了条件。 注册资本3000万元人民币，是继中债登、中证登之后，中国第三家专业性的登记、托管、结算机构。公司本着“安全高效、至诚至信”的服务理念,服务于各交易机构,与交易机构联合运作，为金融资产的流转提供资产登记、发行认购、交易、托管、结算的全方位全流程的专业化服务。
	                                	</span>
                                	</p>
                                	<p class="p1 padding20" >
                                	<span style="font-size: 16px; line-height: 30px;">
                                	登记结算公司严格遵循国际国内行业标准，确立了“诚信、服务、专业、效率”的核心价值观，形成了“安全高效、至诚至信”的服务理念。目前，公司已与多家大型金融机构签署合作协议，内容涉及信贷资产、信托资产、租赁资产、基金资产和相关创新金融产品，还按照中国保监会关于保险资产管理产品在天津金融资产交易所交易的批文，被确定为保险资产管理产品的登记、托管、结算机构。
                                	</span>
                                	</p>
                                	<p class="p1 padding20">
                                	<span style="font-size: 16px; line-height: 30px;">
                                	公司目前主要服务于鑫淼聚，为其产品提供登记、结算和托管服务，各类金融产品发行及其交易的登记、托管、结算；金融创新产品的咨询、研究、开发、设计与相关服务，并不断完善职能、扩展业务范围，力争将其发展成为可为各类金融资本市场配套服务且独立于发行交易的第三方非金融中介机构，建立一个符合规范化、市场化和国际化要求，为保险、银行、各类基金、信托型金融产品提供专业的第三方的登记托管结算服务平台。</span>
                                	</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list_right f1 a2" style="display: none;">
                    <div class="font-14 about-content">
                        <div class="fl">
                            <div class="list_con">
                                <h1 class="hd"><span class="hover">投资之道</span></h1>
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list_right f1 a3" style="display: none;">
                    <div class="font-14 about-content">
                        <div class="fl">
                            <div class="list_con">
                                <h1 class="hd"><span class="hover">面对面</span></h1>
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list_right f1 a4" style="display: none;">
                    <div class="font-14 about-content">
                        <div class="fl">
                            <div class="list_con">
                                <h1 class="hd"><span class="hover">长期致胜之道</span></h1>
                                <div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear">		</div>
            </div>
        </div>
    </div>
    <!--联系方式-->
    	<%  
            String type = request.getParameter("aa");  
         %>  
</div>
<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->

<script type="text/javascript">
	$(function(){
		var type = <%=type %>
		$(".nav_sub").children().children().removeClass('libg');
		//alert(type);
		if(type==1){
			$("#com").trigger("click");
		}else if(type==2){
			$("#inv").trigger("click");
		}else if(type==3){
			$("#face").trigger("click");
		}else if(type==4){
			$("#win").trigger("click");
		}
	});
	
</script>
<script type="text/javascript">
    window.onload = function () {
       // $.ajax({
           // url: "about/us/details",
           // data: {title: "公司介绍"},
           // async: false,
           // success: function (data) {
               // var json = data.resultObj;
               // console.log(json);
                //$(".introduce").html(json.title);
                //$("#context").html(json.aboutUsInfo.text)
           // }
        //})
    }
    
    function move(){
    	$("#com").removeClass("cur");
    	$("#inv").removeClass("cur");
    	$("#face").removeClass("cur");
    	$("#win").removeClass("cur");
    } 
    function introduce(){
    	$(".a1").show();
    	$(".a2").hide();
    	$(".a3").hide();
    	$(".a4").hide();
    	move();
    	$("#com").addClass("cur");
    }
    function invest(){
    	$(".a1").hide();
    	$(".a2").show();
    	$(".a3").hide();
    	$(".a4").hide();
    	move();
    	$("#inv").addClass("cur");
    }
    function face(){
    	$(".a1").hide();
    	$(".a2").hide();
    	$(".a3").show();
    	$(".a4").hide();
    	move();
    	$("#face").addClass("cur");
    }
    function winning(){
    	$(".a1").hide();
    	$(".a2").hide();
    	$(".a3").hide();
    	$(".a4").show();
    	move();
    	$("#win").addClass("cur");
    }
</script>
</body>
</html>
