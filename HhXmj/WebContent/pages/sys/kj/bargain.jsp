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
                    <li><a href="pages/company/contents.jsp" >关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                    <li><a href="pages/company/contents.jsp" >个人金融信息安全</a></li>
                    <li><a href="pages/company/contents.jsp">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

    <div class="content">  
        <div class="cont_right" style="width:950px;margin: 0 auto;float: none;">
			<p class="page_pos" style="margin: 0 auto;width: 950px;margin-top: 10px;">当前位置：
				<a href="sys/kj/index" title="首页">首页</a>
		         &gt; <span>成交信息</span>
		    </p>
           <div class="information" style="width:950px;margin-bottom: 10px;">
                <div class="wzgg_r">
		<h2>成交公告</h2>
        <ul class="C_xw">
        	<li>
            	<a href="pages/sys/kj/bargain_xq.html"><span>【HBF2013Z0004】成交公告</span><span>2017-08-20</span> </a>
            </li>
			<li>
            	<a href="pages/sys/kj/bargain_xq.html"><span>【HBF2013Z0004】成交公告</span><span>2017-08-05</span> </a>
            </li>
			 <li>
            	<a href="pages/sys/kj/bargain_xq.html"><span>【HBF2013Z0004】成交公告</span><span>2017-08-01</span> </a>
            </li>
            <li>
            	<a href="pages/sys/kj/bargain_xq.html"><span>【HBF2013Z0004】成交公告</span><span>2016-11-05</span> </a>
            </li>
            <li>
            	<a href="pages/sys/kj/bargain_xq.html"><span>【HBF2013Z0004】成交公告</span><span>2015-11-05</span> </a>
            </li>
            <li>
            	<a href="pages/sys/kj/bargain_xq.html"><span>【HBF2013Z0004】成交公告</span><span>2013-11-05</span> </a>
            </li>
            <li>
            	<a href=""><span>【HBF2013Z0004】成交公告</span><span>2013-11-05</span> </a>
            </li>
        </ul>
    </div>
           </div>
		</div>
	</div>



<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $.ajax({
            url: "about/us/details",
            data: {title: "公司介绍"},
            async: false,
            success: function (data) {
                var json = data.resultObj;
                console.log(json);
                $(".hover").html(json.title);
                $("#context").html(json.aboutUsInfo.text)
            }
        })
    }
</script>
</body>
</html>
