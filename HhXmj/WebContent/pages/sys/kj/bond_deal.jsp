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
    <script>
        $(function () {
            $("#deal").jPages({
                containerID: "itemContainer"
            });
        });
    </script>
    
    
   

</head>
<body>
    <div class="screen_large hide" style="display: block;">
       		<input name="sys_user_reg" id="sys_user_reg" value="${currentUser.sys_user_reg_type_d}" type="hidden"/>
       		<input name="sys_user_status_d" id="sys_user_status_d" value="${currentUser.sys_user_status_d}" type="hidden"/>
        	<table  class="table_gdlc">
				   <thead>
				    <tr class="tr1">
				        <th width="150">名称</th>
				        <th width="100">资产编号</th>
				        <th>案件数量</th>
				        <th width="100">债权类型</th>
				        <th>欠款(元)</th>
				        <th>佣金比例</th>
				        <th width="100">逾期时间</th>
				        <th width="100">委外期限</th>
				        <th>状态</th>
				        <th>发布时间</th>
				        <th width="100">操作</th>
				    </tr>
				    </thead>
            <c:choose>
            <c:when test="${not empty dealList}">
            <tbody id="itemContainer" class="table_to">  
            <c:forEach items="${dealList}" var="var" varStatus="vs">
            	<tr>
            	   	 <input name="bond_unable" value="${var.bond_unable}" type="hidden"/>
            	   	 <input name="bond_disposal_id" value="${var.bond_disposal_id}" type="hidden"/>
            	   	 
					 <td><a class="a1">${var.bond_company_name}</a></td>
					 <td>${var.bond_asset_number}</td>
					 <td>${var.bond_case }</td>
					 <c:forEach items="${dictList}" var="varMap">
							<c:if test="${varMap.dict_assets_pid == 'bond_product_solutions'}">
								<c:if test="${varMap.dict_assets_key==var.bond_product_solutions}">
									<td>${varMap.dict_assets_name}</td>
								</c:if>
							</c:if>
					 </c:forEach>
					 <td>${var.bond_disposal_arrears}</td>
					 <td>${var.bond_transfer_ratio}</td>
					 <td>${var.bond_overdue }</td>
					 <td>${var.bond_deadline }</td>
					 
					 <c:if  test="${var.bond_unable==0}"><td>待签约</td></c:if>
					 <c:if  test="${var.bond_unable==1}"><td>已签约</td></c:if>
					 <td> <fmt:formatDate value="${var.bond_release_time}" pattern="yyyy-MM-dd"/></td>
					 <c:if  test="${var.bond_classify==1}"><td><a class="jdan bn">我要抢单</a></td></c:if>
					 <c:if  test="${var.bond_classify==2}"><td><a class="jdan bn">我要竟单</a></td></c:if>
					
       				
       			
                </tr>
            
            
            </c:forEach>
            </tbody>
            </c:when>
            <c:otherwise>
            <tr class="main_info">
                <td colspan="100" class="center">没有相关数据</td>
            </tr>
            </c:otherwise>
            </c:choose>
            </table>
        
        
		  <div id="deal" class="holder"></div>

</div>
<script type="text/javascript">
	$(function(){
		$(".a1").click(function(){
			var bond_disposal_id = $(this).parent().siblings().eq(1).val();
			$(this).attr("href","bond/sheet/goedit?bond_disposal_id="+bond_disposal_id);
			
		});
	})
</script>



<script type="text/javascript">
	
	
	 $(function(){
    	$(".bn").click(function(){
    		if($(".tr12").css("display")=="none"){
    			
    		
	    		var sys_user_reg =$("#sys_user_reg").val();
				var sys_user_status_d =$("#sys_user_status_d").val();
				var bond_unable =$(this).parent().siblings().eq(0).val();
				var bond_disposal_id = $(this).parent().siblings().eq(1).val();
				var btn = $(this).text();
				
	    		//判断用户登陆
	    		if(name){
	    			console.log("用户类型，sys_user_reg："+sys_user_reg);
	    			//判断发布方
	    			if(sys_user_reg!='0'){
	    				 console.log("用户有没有通过审核："+sys_user_status_d);
	    				 var status="0b34577203734a9b94ea5dade26879ca";
	    				 
	    				 if(sys_user_status_d==status){
	    					 
	    					console.log("通过了审核");
	    				
	    				 	user_reg(bond_unable,bond_disposal_id,btn);
	    			    }else{
	    						alert("处置方请完善信息，等待审核！");
	    				}
	    				
	    			}else{
	    				alert("不好意思，"+name+"。发布方，无法进行此次操作！")
	    			}
	    		}else{
	    			console.log("用户不存在，无法操作"); 
	    			$(this).attr("href","pages/sys/kj/login/login.jsp");
	    		}
    		}
    	});
		
    });
	 function user_reg(bond_unable,bond_disposal_id,btn){
		 console.log("数据是否可以操作:"+bond_unable);
		 
				//判断操作
				if(bond_unable!="1"){
					console.log("可以操作");
					console.log("进入,btn:"+btn+",bond_disposal_id:"+bond_disposal_id);
					//判断接单报名
					if(btn=="我要抢单"){
						console.log(btn)
						$(".bn").attr("href","bond/sheet/index?bond_disposal_id="+bond_disposal_id);
					}else if(btn=="我要竟单"){
						console.log(btn)
						$(".bn").attr("href","bond/accept/index?bond_disposal_id="+bond_disposal_id);
					}			
				}else if(bond_unable=="1"){
					alert("后台正在审核签约内容！");
				}else{
					alert("最终订单已经确认，请选择其他资产");
				}
			
	 }
	 

</script>

</body>
</html>
