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
    <div class="screen_large hide" style="display: block;">
       
        	<table  class="table_gdlc">
				   
            <c:choose>
            <c:when test="${not empty varList}">
            <thead>
				    <tr class="tr1">
				        <th width="80">企业名称</th>
				        <th width="80">资产编号</th>
				        <th width="80">接单时间</th>
				        <th width="80">接单处置方</th>
				        <th width="80">处置方性质</th>
				        <th width="80">联系人</th>
				        <th width="80">联系人电话</th>
				        <th width="80">处置方式</th>
				        <th width="100">操作</th>
				    </tr>
			</thead>
            <tbody id="itemContainer" class="table_to">  
            <c:forEach items="${varList}" var="var" varStatus="vs">
            	<tr>
					 <td><a class="aSheet">${var.bond_company_name}</a></td>
					 <td>${var.bond_asset_number}</td>
   					 <td>${var.bond_sheet_time}</td>
					 <td>${var.bond_accept_name}</td>
					 <td>${var.bond_accept_property}</td>
					 <td>${var.bond_deal_name}</td>
					 <td>${var.bond_deal_phone}</td>
					 <td>${var.bond_deal_type}</td>
					 <td><a class="jdan tn">查看详情</a></td>
                </tr>
            
            
            </c:forEach>
            </tbody>
            </c:when>
            <c:when test="${not empty accList}">
            <thead>
				    <tr class="tr1">
				        <th width="80">企业名称</th>
				        <th width="80">资产编号</th>
				        <th width="80">报名时间</th>
				        <th width="80">报名处置方</th>
				        <th width="80">处置方性质</th>
				        <th width="80">联系人</th>
				        <th width="80">联系人电话</th>
				        <th width="80">处置方式</th>
				        <th width="100">操作</th>
				    </tr>
			</thead>
            <tbody id="itemContainer" class="table_to">  
            <c:forEach items="${accList}" var="var" varStatus="vs">
            	<tr>
					 <td><a href="custom.html">${var.bond_company_name}</a></td>
					 <td>${var.bond_asset_number}</td>
   					 <td>${var.bond_accept_time}</td>
					 <td>${var.bond_accept_name}</td>
					 <td>${var.bond_accept_property}</td>
					 <td>${var.bond_deal_name}</td>
					 <td>${var.bond_deal_phone}</td>
					 <td>${var.bond_deal_type}</td>
					 <td><a class="jdan tn">选择处置方</a></td>
                </tr>
            
            
            </c:forEach>
            </tbody>
            </c:when>
            <c:otherwise>
            <thead>
				    <tr class="tr1">
				        <th width="80">企业名称</th>
				        <th width="80">资产编号</th>
				        <th width="80">接单时间</th>
				        <th width="80">接单处置方</th>
				        <th width="80">处置方性质</th>
				        <th width="80">联系人</th>
				        <th width="80">联系人电话</th>
				        <th width="80">处置方式</th>
				        <th width="100">操作</th>
				    </tr>
				    <tr class="main_info">
                		<td colspan="100" class="center">没有相关数据</td>
            		</tr>
			</thead>
            
            </c:otherwise>
            </c:choose>
            </table>
        
        <div class="holder"></div>
</div>


<script type="text/javascript">
	$(function(){
		$(".aSheet").click(function(){
			var bond_asset_number = $(this).parent().next().text();
			$(this).attr("href","bond/sheet/goedit?bond_asset_number="+bond_asset_number);
		});
		
	})
</script>
<script type="text/javascript">


    $(function(){
    	
     
    	$(".tn").click(function(){
    		var text = $(this).text();
    		var bond_asset_number = $(this).parent().siblings().eq(1).text();
    		console.log("我找的是这个按钮的第二个兄弟，bond_asset_number:"+bond_asset_number);
    		if(text == "查看详情"){
    			console.log("已经进入方法");
    			$(this).attr("href","bond/sheet/goedit?bond_asset_number="+bond_asset_number);
    		}else{
    			console.log("发送到选择处置方");
    			$(this).attr("href","bond/accept/list?conditionName="+bond_asset_number);
    		}
 		
    	});
	
    });

</script>


</body>
</html>
