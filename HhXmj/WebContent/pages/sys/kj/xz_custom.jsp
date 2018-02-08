<%--
  Created by IntelliJ IDEA.
  User: 我
  Date: 2017/10/16
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
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
    <script>
        $(function () {
            $("div.holder").jPages({
                containerID: "itemContainer"
            });
        });
    </script>
    <script type="text/javascript">
    	
    	
    
    </script>    
</head>
<body>
    
<!-- 登陆注册 -->
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
                    <li><a href="contents.html">关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                    <li><a href="contents.html">个人金融信息安全</a></li>
                    <li><a href="contents.html">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
    
    
    
    
 <div class="wrap">        
        <div class="index_gdlc">
            <img src="pages/sys/kj/img/corner_1.png" class="corner corner1" />
	        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2" />
	        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3" />
	        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4" />
	        <div class="w1080 bc" style="margin-left:0px">
  <div class="clear"></div>
  <div class="zrxq-box-head">
  	 <div class="l-side">
         <img src="pages/sys/kj/img/xm-pic-1.png" width="275" height="237">
     </div>
     <div class="r-side">
     	 <c:forEach items="${disList}" var="var" varStatus="vs">
     	 <span class="tag-xmxx">项目信息</span>
     	 <ul class="ul-1">
         	<li class="xm-name">
            项目名称：${var.bond_company_name}
            </li>
            <li class="xm-num">
            	项目编号：${var.bond_asset_number}
            </li>
         </ul>
     	 <ul class="ul-2">
         	<li class="li-w-1">
            	欠款：<span class="f24 co4">${var.bond_disposal_arrears}</span>元
            </li>
            <li class="li-w-2">
            	转让比例：<span class="f24 co4">${var.bond_transfer_ratio }</span>
            </li>
            <li class="li-w-1">
            	挂牌起始时间：<fmt:formatDate value="${var.bond_listing_start_time}" pattern="yyyy-MM-dd"/>
            </li>
            <li class="li-w-2">
            	挂牌结束时间：<fmt:formatDate value="${var.bond_listing_end_time}" pattern="yyyy-MM-dd"/>
            </li>
            
         </ul>
         </c:forEach>
     </div>
  </div>
  <div class="h-shadow-2 clear"></div>
  
  <div class="zrxq-box-tqb">
	<form action="bond/accept/accSave" method="post" enctype="multipart/form-data">
  	<div class="hd">
    	<ul>
        	<li class="cur"><a>选择处置方</a></li>
           
        </ul>
    </div>
    <div class="bd" style="display: block;">
    	<ul class="xzczf">
    		 <c:forEach items="${disList}" var="var" varStatus="vs">
    		 	 <input name="bond_disposal_id" id="bond_disposal_id" value="${var.bond_disposal_id}" type="hidden"/>
    		 </c:forEach>
    		
    		<c:forEach items="${accList}" var="var" varStatus="vs">
				<li>
				<input name="bond_accept_id" id="bond_accept_id" type="radio" value="${var.bond_accept_id}" style="float:none;">
				<a class="accept">${var.bond_accept_name }</a>
				</li>    		
    		</c:forEach>
    	</ul>
    	
    	
    </div>
   <div class="foot-action">
		<input class="a-btn-sr " target="_blank" type='submit' value='确定处置方'/>
    </div>
    </form>
  </div>
</div>
        </div>
    </div>
    
    
    



<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
<!-- 载入处置方的公司名 -->
<script type="text/javascript">
 	$(function(){
 		$(".accept").click(function(){
 			nameId=$(this).prev().val();
 			console.log("id为："+nameId);
 		    disposalId = $("#bond_disposal_id").val();
 			console.log("disposalId为:"+disposalId);
 			$(this).attr("href","bond/accept/listAccept?bond_disposal_id="+disposalId+"&bond_accept_id="+nameId);
 			
 		});
 		
 		
 	});
</script>
</body>
</html>
