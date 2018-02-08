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
    	<!--业务统计-->
    	<div class="container">
        <div class="tongji height50">
          <div class="tongji-body w1080 bc">
            <ul class="padding50">
              <li><i class="ico ico-1"></i>累积访问人数<span id="info" class="co_r2 f22"> 8988.9</span>万<span class="vline"></span></li>
              <li><i class="ico ico-2"></i>资产登记规模<span class="co_r2 f22">1.231万</span> 亿<span class="vline"></span></li>
              <li><i class="ico ico-3"></i>资产结算规模<span class="co_r2 f22">2.507万</span> 亿</li>
            </ul>
          </div>
        </div>
      </div>
    	<!--业务服务-->
    	<div class="container">
        <div class="w1080 service">
          <div class="title-wrap">
            <div class="title">业务服务</div>
          </div>
          <div class="service-content">
            <div style="margin-left: 0;" class="service-content-item">
              <div class="service-img-wrap"><img src="pages/sys/kj/img/service-1.png" alt="" class="service-img"></div>
              <div class="service-item-title">注册登记</div>
              <div class="service-item-txt">为各类金融产品、资产提供的专业的登记服务，包括各类常规性登记及其他登记，同时可提供信息披露、监管报备、上传证件等支持服务。</div>
            </div>
            <div class="service-content-item">
              <div class="service-img-wrap"><img src="pages/sys/kj/img/service-2.png" alt="" class="service-img"></div>
              <div class="service-item-title">资产拍卖</div>
              <div class="service-item-txt">为各类金融产品、资产的持有者提供权益查询、证明服务，包括持有产品、资产要素及份额等信息，出具相关权益登记凭证，可查询、可下载。</div>
            </div>
            <div class="service-content-item">
              <div class="service-img-wrap"><img src="pages/sys/kj/img/service-3.png" alt="" class="service-img"></div>
              <div class="service-item-title">资产委外</div>
              <div class="service-item-txt">为各类金融产品、资产的流转提供托管服务，并接受非上市股份公司或有限公司及其股东委托，为其提供股权登记、股权管理及其它业务服务。</div>
            </div>
            <div style="margin-right: 0;" class="service-content-item">
              <div class="service-img-wrap"><img src="pages/sys/kj/img/service-4.png" alt="" class="service-img"></div>
              <div class="service-item-title">资金结算</div>
              <div class="service-item-txt">为各类金融产品、资产的发行认购、交易、分红付息、清退提供独立的第三方资金的计算和结清服务，维护交易双方的资金安全。</div>
            </div>
          </div>
        </div>
      </div>
      <!--优势选择-->
      <div class="container">
        <div class="w1080 service">
          <div class="title-wrap">
            <div class="title">为什么选择我们</div>
          </div>
          <div class="whychoose-content">
            <div class="whychoose-item">
              <div class="service-img-wrap"><img src="pages/sys/kj/img/whychoose-1.png" alt="" class="service-img"></div>
              <div class="title-wrap">
                <h2 class="whychoose-item-title">合规性</h2>
              </div>
              <div class="title-wrap">
                <div class="whychoose-item-txt">特别设立的专业机构，独立的第三方登记、托管、结算</div>
              </div>
            </div>
            <div class="whychoose-item">
              <div class="service-img-wrap"><img src="pages/sys/kj/img/whychoose-2.png" alt="" class="service-img"></div>
              <div class="title-wrap">
                <h2 style="border-bottom: 2px solid #e37e24" class="whychoose-item-title">公允性</h2>
              </div>
              <div class="title-wrap">
                <div class="whychoose-item-txt">集中统一的登记托管，为提供公开集中的资产信息平台提供鉴证查询功能</div>
              </div>
            </div>
            <div class="whychoose-item">
              <div class="service-img-wrap"><img src="pages/sys/kj/img/whychoose-3.png" alt="" class="service-img"></div>
              <div class="title-wrap">
                <h2 style="border-bottom: 2px solid #3583b4" class="whychoose-item-title">安全性</h2>
              </div>
              <div class="title-wrap">
                <div class="whychoose-item-txt">专业精准的资金结算，与资产交易 相分离，保证资金安全</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    	<!--合作伙伴-->
    	<div style="width: 100%;padding-top:20px;">
        <div class="why-join w1080 bc">
          <div class="title-wrap">
            <div class="title">合作伙伴</div>
          </div>
          <div style="width: 100%;padding: 50px 0 50px 0px;">
            <div>
              <ul>
                <li><a href="http://www.circ.gov.cn" target="_blank"><img src="pages/sys/kj/img/fr1.png" alt=""></a></li>
                <li><a href="http://www.cib.com.cn" target="_blank"><img src="pages/sys/kj/img/fr2.png" alt=""></a></li>
                <li><a href="http://www.cdb.com.cn/" target="_blank"><img src="pages/sys/kj/img/fr3.png" alt=""></a></li>
                <li><a href="http://www.chinabond.com.cn/" target="_blank"><img src="pages/sys/kj/img/fr4.png" alt=""></a></li>
                <li><a href="http://www.abchina.com/cn/" target="_blank"><img src="pages/sys/kj/img/fr5.png" alt=""></a></li>
                <li><a href="http://www.adbc.com.cn/"><img src="pages/sys/kj/img/fr6.png" alt="" target="_blank"></a></li>
              </ul>
              <ul style="position: relative;top: -70px;left: 80px">
                <li><a href="http://jr.jd.com/" target="_blank"><img src="pages/sys/kj/img/fr7.png" alt=""></a></li>
                <li><a href="https://zcbprod.alipay.com/index.htm" target="_blank"><img src="pages/sys/kj/img/fr8.png" alt=""></a></li>
                <li><a href="https://qian.qq.com/" target="_blank"><img src="pages/sys/kj/img/fr9.png" alt=""></a></li>
                <li><a href="https://www.sncfc.com.cn" target="_blank"><img src="pages/sys/kj/img/fr10.png" alt=""></a></li>
                <li><a href="http://www.fengjr.com/" target="_blank"><img src="pages/sys/kj/img/fr11.png" alt=""></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
<!--尾部-->
<div class="personal-footer"></div>
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
</body>
</html>