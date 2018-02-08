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
    <c:set var="name" value="${currentUser.sys_user_name}"/>
	<script type="text/javascript">
    var name = "${name}";
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
       <input type="hidden" id="site" value="${varList.bond_location}"/>
     	 <span class="tag-xmxx">项目信息</span>
     	 <ul class="ul-1">
         	<li class="xm-name">
            项目名称：${varList.bond_company_name}
            </li>
            <li class="xm-num">
            	项目编号：${varList.bond_asset_number}
            </li>
         </ul>
     	 <ul class="ul-2">
         	<li class="li-w-1">
            	欠款：<span class="f24 co4">${varList.bond_disposal_arrears}</span>元
            </li>
            <li class="li-w-2">
            	转让比例：<span class="f24 co4">${varList.bond_transfer_ratio }</span>
            </li>
            <li class="li-w-1">
            	发布时间：<fmt:formatDate value="${varList.bond_release_time}" pattern="yyyy-MM-dd"/>
            </li>
         </ul>
     </div>
  </div>
  <div class="h-shadow-2 clear"></div>
  
  <div class="zrxq-box-tqb">
  	<div class="hd">
    	<ul>
        	<li class="cur"><a>资产信息</a></li>
            
            
        </ul>
    </div>
    <div class="bd" style="display: block;">
    	<table class="zrxq-tb-2" width="100%">
          <tbody><tr>
            <th>交易类别</th>
            <input type="hidden" name="bond_disposal_id" id="bond_disposal_id" value="${varList.bond_disposal_id}"/>
            <input type="hidden" name="bond_disposal_createuid" id="bond_disposal_createuid" value="${varList.bond_disposal_createuid}"/>
            <input type="hidden" name="use_id" id="use_id" value="${currentUser.sys_user_id}"/>
            <input type="hidden" id="debt_site" value="${varList.bond_debt_location}"/>
            <c:if  test="${varList.bond_deal==1}"><td>单笔委外</td></c:if>
            <c:if  test="${varList.bond_deal==2}"><td>委外资产包</td></c:if>
			<td>
			  
			</td>
          </tr>
		  <tr>
            <th>资产处置模式</th>
             <c:if  test="${varList.bond_classify==1}"><td>处置方抢单</td></c:if>
             <c:if  test="${varList.bond_classify==2}"><td>处置方竟单</td></c:if>
          </tr>
          <tr>
            <th>所在地区</th>
            <td id="location"></td>
          </tr>
           <tr>
            <th>债务人所在地区</th>
            <td id="debt_location"></td>
          </tr>
          <tr>
            <th>发布方联系人</th>
            <td>${varList.bond_contacts }</td>
          </tr>
          <tr>
            <th>发布方联系人电话</th>
            <td>${varList.bond_contact_number}</td>
          </tr>
          <tr>
          	<th>发布时间</th>
          	<td> <fmt:formatDate value="${varList.bond_release_time}" pattern="yyyy-MM-dd"/></td>
          </tr>
         
        </tbody>
        </table>

    </div>
    <div class="hd">
    	<ul>
        	<li><a>处置方信息</a></li>
            
        </ul>
    </div>
    <div class="bd none" style="display: block;">
    	<table class="zrxq-tb-2" width="100%">
          <tbody><tr>
            <th>接单处置方</th>
            <td>${varSheet.bond_accept_name}</td>
          </tr>
          <tr>
            <th>处置方性质</th>
            <td>${varSheet.bond_accept_property}</td>
          </tr>
          <tr>
            <th>处置方联系人</th>
            <td>${varSheet.bond_deal_name }</td>
          </tr>
          <tr>
            <th>处置方联系电话</th>
            <td>${varSheet.bond_deal_phone }</td>
          </tr>
          <tr>
          	<th>处置方式</th>
          	<td>${varSheet.bond_deal_type }</td>
          </tr>
        </tbody>
        </table>
    </div>
    
    <div class="foot-action">
		<a class="a-btn-sr len" target="_blank" >修改信息</a>
    </div>
  </div>
</div>
        </div>
    </div>    
    
    <script type="text/javascript">
    	$(function(){
    		$(".len").click(function(){
    			debugger
    			var createuid = $("#bond_disposal_createuid").val();
    			var use_id = $("#use_id").val();
    			var bond_disposal_id = $("#bond_disposal_id").val();
    			var bond_location =$("#site").val();
    			var bond_debt_location = $("#debt_site").val();
    			if(createuid==use_id){
    				console.log("这个债权人的地址id是:"+bond_disposal_id+"债务人的地址id"+bond_debt_location);
        			$(this).attr("href","bond/disposal/goedit?bond_disposal_id="+bond_disposal_id+"&bond_location="+bond_location
        					+"&bond_debt_location="+bond_debt_location);
    			}else{
    				alert("不是本人，无法进行操作");
    			}
    		});
    	});
    </script>
    
    
    
    
    
    



<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
<!-- 将地址填入 -->
<script type="text/javascript">
	$(function(){
		var bond_site_id =$("#site").val();
		$.post("bond/site/upjson",{"bond_site":bond_site_id},function(map){
			console.log(JSON.stringify(map));
			var site = map.resultObj.varList;
			var site_name=null;
			var province_id = null;
			for( var i in site){
			  site_name=site[i].bond_location_name;
			  province_id = site[i].bond_site_pid;
			}
			console.log("市的名字："+site_name+",省的id:"+province_id);
			
			$.post("bond/site/upjson",{"bond_site":province_id},function(map){
				
				var bond_site = map.resultObj.varList;
				var province_name = null;
				for(var i in bond_site){
					province_name = bond_site[i].bond_location_name;
					console.log("省的名字："+province_name);
					$("#location").text(province_name+""+site_name);
				}				
				
			});
			
		});
		
	});

</script>
<!-- 将债务人的地址填入 -->
<script type="text/javascript">
	$(function(){
		var bond_site_id =$("#debt_site").val();
		$.post("bond/site/upjson",{"bond_site":bond_site_id},function(map){
			console.log(JSON.stringify(map));
			var site = map.resultObj.varList;
			var site_name=null;
			var province_id = null;
			for( var i in site){
			  site_name=site[i].bond_location_name;
			  province_id = site[i].bond_site_pid;
			}
			console.log("市的名字："+site_name+",省的id:"+province_id);
			
			$.post("bond/site/upjson",{"bond_site":province_id},function(map){
				
				var bond_site = map.resultObj.varList;
				var province_name = null;
				for(var i in bond_site){
					province_name = bond_site[i].bond_location_name;
					console.log("省的名字："+province_name);
					$("#debt_location").text(province_name+""+site_name);
				}				
			});
			
		});
		
	});

</script>
</body>
</html>
