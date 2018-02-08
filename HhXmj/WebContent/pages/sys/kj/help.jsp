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
              <div class="list_nav" >
                <ul id="search">
                  <li><a href="javascript:;" class="cur" id="Join">入会条件</a></li>
                  <li ><a href="javascript:;" id="guide">机构入会指南</a></li>
                  <li ><a href="javascript:;" id="guide_gr">个人入会指南</a></li>
                  <li ><a href="javascript:;" id="Prompt">风险提示</a></li>
                </ul>
              </div>
            </div>
            <div class="list_right fl">
              <div class="font-14 about-content">
              	<div class="fl" id="Join_condition">
					<div class="list_con">
					<h1 class="hd"><span class="hover">入会条件</span></h1>
					<div class="content">
		                <div style="height: 20px"></div>
		                <div class="clearfix"></div>
		                <ul>
		                    <li class="strongs">申请成为本所机构会员，须满足以下条件：</li>
		                    <li>（一）依法设立并有效存续的法人、其他组织和机构； </li>
		                    <li>（二）具备相关业务资质； </li>
		                    <li>（三）依法合规经营，具有健全的组织机构和严格的财务管理制度、决策管理制度； </li>
		                    <li>（四）具有丰富的投融资经验，具备独立的风险识别和评估能力，及与投资品种相对应的风险承受能力；</li>
		                    <li>（五）本所要求的其他条件。</li>
		                    
		                    <li class="strongs">申请成为代销类会员的机构还须满足以下条件：</li>
		                    <li>（一）具备开展中介服务的营销能力；</li>
		                    <li>（二）具备开展中介服务的办公场地及办公条件；</li>
		                    
		                    <li class="strongs">申请成为本所个人会员，须满足以下条件：</li>
		                    <li>（一）年满18周岁以上的自然人；</li>
		                    <li>（二）满足一定的适当性要求，包括但不限于：</li>
		                    <li>1.按照实名制要求，如实填写、提交开户材料； </li>
		                    <li>2.能全面评估自身能力，审慎决定是否参与交易，遵守“买卖自负”的原则，承担交易的履约责任及相关风险；</li>
		                    <li>3、须具备一定的产品认知水平和风险承受能力。</li>
		                    <li>（三）本所要求的其他条件。 </li>
		                </ul>
		            </div>
					</div>
				</div>
              <div class="list_right fl" id="guide_condition" style="display: none;">
					<div class="list_con">
					<h1 class="hd"><span class="hover">机构入会指南</span></h1>
					<div class="content">
		                <div style="height: 20px"></div>
		                <div class="clearfix"></div>
		                <ul>
		                    <li class="strongs">申请成为本所机构会员，须满足以下条件：</li>
		                    <li>（一）依法设立并有效存续的法人、其他组织和机构； </li>
		                    <li>（二）具备相关业务资质； </li>
		                    <li>（三）依法合规经营，具有健全的组织机构和严格的财务管理制度、决策管理制度； </li>
		                    <li>（四）具有丰富的投融资经验，具备独立的风险识别和评估能力，及与投资品种相对应的风险承受能力；</li>
		                    <li>（五）本所要求的其他条件。</li>
		                    
		                    <li class="strongs">申请成为代销类会员的机构还须满足以下条件：</li>
		                    <li>（一）具备开展中介服务的营销能力；</li>
		                    <li>（二）具备开展中介服务的办公场地及办公条件；</li>
		                    
		                    <li class="strongs">申请成为本所个人会员，须满足以下条件：</li>
		                    <li>（一）年满18周岁以上的自然人；</li>
		                    <li>（二）满足一定的适当性要求，包括但不限于：</li>
		                    <li>1.按照实名制要求，如实填写、提交开户材料； </li>
		                    <li>2.能全面评估自身能力，审慎决定是否参与交易，遵守“买卖自负”的原则，承担交易的履约责任及相关风险；</li>
		                    <li>3、须具备一定的产品认知水平和风险承受能力。</li>
		                    <li>（三）本所要求的其他条件。 </li>
		                </ul>
		            </div>
					</div>
				</div>
              <div class="list_right fl" id="guide_grcon" style="display: none;">
					<div class="list_con">
					<h1 class="hd"><span class="hover">个人入会指南</span></h1>
					<div class="content">
		                <div style="height: 20px"></div>
		                <div class="clearfix"></div>
		                <ul>
		                    <li class="strongs">申请成为本所机构会员，须满足以下条件：</li>
		                    <li>（一）依法设立并有效存续的法人、其他组织和机构； </li>
		                    <li>（二）具备相关业务资质； </li>
		                    <li>（三）依法合规经营，具有健全的组织机构和严格的财务管理制度、决策管理制度； </li>
		                    <li>（四）具有丰富的投融资经验，具备独立的风险识别和评估能力，及与投资品种相对应的风险承受能力；</li>
		                    <li>（五）本所要求的其他条件。</li>
		                    
		                    <li class="strongs">申请成为代销类会员的机构还须满足以下条件：</li>
		                    <li>（一）具备开展中介服务的营销能力；</li>
		                    <li>（二）具备开展中介服务的办公场地及办公条件；</li>
		                    
		                    <li class="strongs">申请成为本所个人会员，须满足以下条件：</li>
		                    <li>（一）年满18周岁以上的自然人；</li>
		                    <li>（二）满足一定的适当性要求，包括但不限于：</li>
		                    <li>1.按照实名制要求，如实填写、提交开户材料； </li>
		                    <li>2.能全面评估自身能力，审慎决定是否参与交易，遵守“买卖自负”的原则，承担交易的履约责任及相关风险；</li>
		                    <li>3、须具备一定的产品认知水平和风险承受能力。</li>
		                    <li>（三）本所要求的其他条件。 </li>
		                </ul>
		            </div>
					</div>
				</div>
              <div class="list_right fl" id="Prompt_condition" style="display: none;">
					<div class="list_con">
					<h1 class="hd"><span class="hover">风险提示</span></h1>
					<div class="main-content">
             <div class="content">
                <div class="title_na strongs" >这些风险您应该知道</div>
                <!--<div style="height: 20px"></div>-->
                <!--<div class="f-title strong">(2015暂行)</div>-->
                <div class="clearfix"></div>
                <ul>
                    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;鑫淼聚金融资产交易所（以下简称“鑫淼聚”）一直以来致力于为个人会员提供适当的金融产品。金融产品的收益与风险始终相伴相生。为了保障交易的安全与公平，我们一方面不断完善全面风险管理体系，另一方面持续进行交易风险提示。投资者如果能正确认识各种金融资产交易的风险，就能合理配置财富资源。具体来讲在本所从事金融资产交易的个人会员应该注意以下或有风险：</li>
                    <li> 1、宏观经济风险</li>
                    <li>由于我国宏观经济形势的变化以及周边国家、地区宏观经济环境的变化，可能会引起市场的波动，从而导致产品价格变化。</li>
                    <li>2、法律和政策风险</li>
                    <li>国家监管政策、货币政策、财政税收政策、产业政策、宏观政策及相关法律、法规的调整与变化可能会影响产品的运行或收益。</li>
                    <li>3、信用风险</li>
                    <li>产品转让人及基础资产投资项目的债务人等发生违约，信用状况恶化等可能影响产品的运行或收益。一般来说，该项风险出现时依据具体产品业务规则及相应担保文件由增信机构履行担保义务以保障约定收益实现。</li>
                    <li>4、信息传递风险</li>
                    <li>鑫淼聚按照有关信息披露条款的约定，发布产品信息。会员应根据信息披露条款的约定主动、及时登陆网站（http://www.鑫淼聚.com）获取相关信息。</li>
                    <li>5、技术风险</li>
                    <li>由于交易及行情揭示是通过电子通讯技术和电脑技术来实现的，这些技术存在着被网络黑客和计算机病毒攻击的可能。</li>
                    <li>6、不可抗力因素导致的风险</li>
                    <li>诸如地震、火灾、水灾、战争等不可抗力因素可能导致交易系统的瘫痪；无法控制和不可预测的系统故障、设备故障、通讯故障、电力故障等也可能导致交易系统非正常运行甚至瘫痪。</li>
                    <li>7、其他风险</li>
                    <li>以上并不能揭示从事交易的全部风险及市场的全部情形。会员在做出交易决策前，应通过本交易所公布的具体风险提示、产品信息及其他相关公告了解拟交易资产的风险收益特征，并根据自身的交易目标、风险承受能力和资产状况等谨慎决策。</li>
                </ul>
            </div>
        </div>
					</div>
				</div>
              
              </div>
            </div>
            <div class="clear"></div>
          </div>
        </div>
      </div>
    	<!--联系方式-->
   	</div>
<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>

      <script type="text/javascript">
    	
    	$(function(){
    var liobj=$("#search li a");
    liobj.each(function(){
        $(this).click(function(){
        liobj.removeClass("cur")
            $(this).addClass("cur");
            //return false;    //加这句来阻止跳转 可用来调试效果
        });
    });
});
    	
	
	$('#Join').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#Join_condition").show();
  		$("#guide_condition").hide();
  		$("#guide_grcon").hide();
  		$("#Prompt_condition").hide();
    });
	$('#guide').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#Join_condition").hide();
  		$("#guide_condition").show();
  		$("#guide_grcon").hide();
  		$("#Prompt_condition").hide();
    });
	$('#guide_gr').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#Join_condition").hide();
  		$("#guide_condition").hide();
  		$("#guide_grcon").show();
  		$("#Prompt_condition").hide();
    });
	$('#Prompt').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#Join_condition").hide();
  		$("#guide_condition").hide();
  		$("#guide_grcon").hide();
  		$("#Prompt_condition").show();
    });
    </script>
</body>
</html>