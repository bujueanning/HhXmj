<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css"/>
     <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/login.css"/>
    <script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/main.js"></script>
    <style type="text/css">
        .sitemap{
        	position:absolute;
            bottom:0;
        }
        
		html, body {
		    height: 100%;
		    margin: 0px;
		    padding: 0px;
		}
		.ul1{
			 position: absolute;
			 top:250px;left: 400px;
			 
		}
		
    </style>
</head>
<body>
<div class="top_wrap">
	<!--头部-->
    <div class="top">
        <a href="sys/kj/index"><img src="pages/sys/kj/img/logo9.png" class="fl logo"/></a>
        <img src="pages/sys/kj/img/tel1.jpg" alt="" class="fl tel" />
        <div class="fl links">
             <c:if test="currentUser.sys_user_name">
	        	<span class="hidden-xs">${currentUser.sys_user_name}已登陆</span>
		        <a href="sys/login/logoutjs" class="btn btn-default btn-flat">退出</a>
	        </c:if>
		    <c:if test="currentUser.sys_user_name">
	        	 <a href="sys/kj/login">登录</a><br/>
	            <a href="sys/kj/goreg">注册</a>
	        </c:if>
        </div>
        <div class="fr search">
            <form name="formT" id="formT" method="post" target="_blank" action="http://www.dfham.com/infoseek/search">
                <input class="input inputFocus" type="text" name="inputSearchQuery" id="inputSearchQueryT" maxlength="12"/>
                <input type="hidden" name="service" value="direct/0/Home/searchForm"/>
                <input type="hidden" name="sp" value="S0"/>
                <input type="hidden" name="Form0" value="category,inputSearchQuery,$Submit"/>
                <input type="hidden" name="category" value="-1"/>
                <input type="submit" value="" class="btn_search hand" />
            </form>
        </div>
    </div>
</div>
<!--导航-->
<div class="login_box" style="    border-top: 10px solid #f7f7f7; height: 100%;">
   <div style="background:#f2fbfe;height:100%;" class="reg-s">
        <ul class="ul1">
			<li class="l-a" style="float:right"><a href="sys/kj/goreguser"></a></li>
			<li class="l-c"><a href="sys/kj/goregcompany"></a></li>
		</ul>
    </div>
</div>
<!--尾部-->
<div class="sitemap">
    <div class="sitemap_c">
  		<div class="foot-box clearfix">
			<p class="a-box">
				<a href="javascript:void(0);" >客户中心</a> |
				<a href="javascript:void(0);">关于我们</a> |
				<a href="javascript:void(0);" title="联系我们">联系我们</a> |
				<a href="" title="">服务热线</a>
				<strong style="color: #fff;">0311-85338599</strong>
			</p>
			<p class="foot-auth">版权所有·河北汇海征信 © 2018 |<a href="http://www.miitbeian.gov.cn" style="color: #fff;"> 京ICP证160759</a></p>
			<p class="a-box" style="font-size: 12px;">河北汇海征信服务有限公司&nbsp; &nbsp;&nbsp; |&nbsp; &nbsp;&nbsp;  石家庄市桥西区中华南大街一江国际大厦B座409</p>
		</div>
    </div>
</div>

</body>
</html>