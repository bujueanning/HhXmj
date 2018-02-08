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
    <script>
        $(function () {
            $("div.holder").jPages({
                containerID: "itemContainer"
            });
        });
    </script>
    <style type="text/css">
    .que {
        width: 268px;
        height: 48px;
        background: #f5b201;
        color: #fff;
       	margin-left: auto; 
       	margin-right: auto;
        font-size: 16px;
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
     	 <c:forEach items="${varList}" var="var" varStatus="vs">
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
  <div id="registration" style="display: block;">
   <form action="bond/sheet/save" method="post" enctype="multipart/form-data">
    <div class="bd" >
    	<c:forEach items="${varList}" var="var" varStatus="vs">
    		<input type="hidden" name="bond_disposal_id" id="bond_disposal_id" value="${var.bond_disposal_id}"/>
    	</c:forEach>
    	<table class="zrxq-tb-2" width="100%">    		
         <tr>
            <th colspan="8" class="jbxq"> 资产委外企业报名信息</th>
          </tr>
          <c:forEach items="${accList}" var="acc" varStatus="vs">
           <tr>
           <input type="hidden" name="bond_sheet_id" id="bond_sheet_id" value="${acc.bond_sheet_id}"/>
           <input type="hidden" name="bond_accept_id" id="bond_accept_id" value="${acc.bond_accept_id}"/>
           <input type="hidden" name="bond_disposal_createuid" id="bond_disposal_createuid" value="${acc.bond_disposal_createuid}"/>
           <input type="hidden" name="bond_disposal_id" id="bond_disposal_id" value="${acc.bond_disposal_id}"/>
            <th>转让方</th>
            <td><input id="bond_accept_name" name="bond_accept_name" value="${acc.bond_accept_name }" /></td>
          </tr>
          <tr>
            <th>企业性质</th>
            <td><input id="bond_accept_property" name="bond_accept_property" value="${acc.bond_accept_property }" /></td>
          </tr>
          <tr>
            <th>联系人</th>
            <td><input id="bond_deal_name" name="bond_deal_name"  value="${acc.bond_deal_name }"/></td>
          </tr>
          <tr>
            <th>联系方式</th>
            <td><input id="bond_deal_phone" name="bond_deal_phone"  value="${acc.bond_deal_phone }"/></td>
          </tr>
          <tr>
          	<th>处置方式</th>
          	<td><input id="bond_deal_type" name="bond_deal_type"  value="${acc.bond_deal_type }"/></td>
          </tr>
          <tr>
            <th>上传营业执照照片或省份证照片</th>
            <td>
            	<div class="bmxtxzp">
						点击上传照片
							<input type="file" id="bond_deal_img" name="bond_deal_img" value="" onchange="javascript:checkAttr('91','idCardFrontImg','N','N','[\s\S]*.(jpg|jpeg|gif|png|pdf|JPG|JPEG|GIF|PNG)$','','','edit','idCardFrontImg','null')">
				</div>
            </td>
          </tr>
            <input type="hidden" id="bond_company_name" name="bond_company_name" value=""/>
	        <input type="hidden" id="bond_asset_number" name="bond_asset_number" value=""/>
          
          </c:forEach>
    	</table>
    	
    	
    </div>
    <div class="foot-action" style="text-align:center;">
		<input class="que"  type='submit' value='确定处置方'/>
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
<!-- 将其放入最终订单表中 -->
<script type="text/javascript">
$(function(){
	var  company_name= $.trim($(".xm-name").text().replace("项目名称：",""));
	$("#bond_company_name").val(company_name);
	

	var number = $.trim($(".xm-num").text().replace("项目编号：",""));
	$("#bond_asset_number").val(number);
	var id=$("#bond_accept_id").val();
	console.log("内容："+company_name+","+number);
	console.log("id:"+id);
	
});

</script>
</body>
</html>