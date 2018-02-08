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
    <c:set var="identity" value="${currentUser.sys_user_reg_type_n}" scope="session"></c:set>
    <style type="text/css">
		.pos_abs{
			position:absolute;
			left:600px
		}
		a{ 
			cursor:pointer
		 }
		 .begin{
		 	width:400px;height:32px;
		 }
		 #begin,#end,button{
		 	float:left;
		 	width:50px;
		 	height:20px;
		 	-web-kit-appearance:none;
 			-moz-appearance: none;
 			font-size:0.8em;
			border-radius:4px;
			border:1px solid #c8cccf;
			color:#6a6f77;
			position: relative;
		    top: 4px;
		    text-align:center;
		 }
		 .test{
		 	float:left;
		 	width:25px;
		 	height:20px;
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
                    <li><a href="pages/sys/kj/contact.jsp">关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                    <li><a href="pages/sys/kj/contact.jsp">个人金融信息安全</a></li>
                    <li><a href="pages/sys/kj/contact.jsp">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="wrap">
    <div class="hots_div ">
        <div class="screen">
            <div class="screen_b">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="screen_table" id="choice">
                    <tr>
                        <td width="120" style="background:#ca0821; color:#ffffff; font-size:14px;">债权类型</td>
                        <td>
                            <ul class="product_ul c">
                                <li xmlb="" class="on li1">不限</li>
                                <li xmlb="jr02" class="">信誉贷</li>
                                <li xmlb="jr01" class="">抵押贷</li>
                                <li xmlb="jr03">担保贷</li>
                            </ul>
                        </td>
                    </tr>
					
                    <tr class="t">
                        <td style="background:#ca0821; color:#ffffff; font-size:14px;">权属金额</td>
                        <td>
                            <ul class="xmxl_ul c">
                                <li id="one" xmxl="" class="on li1" onclick="ship(this.id,0);">不限</li>
                                <li id="two" xmxl="01" class="" onclick="ship(this.id,1);">1万以下</li>
                                <li id="three" xmxl="02" onclick="ship(this.id,2);">1万-10万</li>
                                <li id="four" xmxl="03" onclick="ship(this.id,3);">10万-20万</li>
                                <li id="five" xmxl="04" onclick="ship(this.id,4);">20万以上</li>
                                <li>
                                	<div class="begin">
                          				<input id="begin" type="text" maxlength="4">
                          				<span class="test">-</span>
                          				<input id="end" type="text" maxlength="4"/>
                          				<span class="test">万</span>
                          				<button id="screen">确定</button>
                                	</div>
                                </li>
                                
                            </ul>
                        </td>
                    </tr>
                    <!-- 
                    <tr>
                        <td style="background:#ca0821; color:#ffffff; font-size:14px;">期限</td>
                        <td>
                            <ul class="days_ul c">
                                <li data="" class="on li1">不限</li>
                                <li data="03" class="">3个月</li>
                                <li data="06">6个月</li>
                                <li data="12">12个月</li>
                                <li data="24">24个月</li>
                            </ul>
                        </td>
                    </tr>
                     -->
                    <tr>
	              <td style="background:#ca0821; color:#ffffff; font-size:14px;">类别属性</td>
	              <td>	              
                    <ul class="rates_ul c">
                      	  <li data="" class="on li1">不限</li>
		                <li data="03" class="" id="zc_table">处置方接单</li>
		                <li data="06" id="zcw_table">处置方竞单</li>
		            </ul>
	              </td>
	            </tr>
	            <tr>
	              <td style="background:#ca0821; color:#ffffff; font-size:14px;">归属省份</td>
	              <td>	              
	                  <div class="row">
	                    <div class="col-md-8">
	                        <div class="form-group">
	                            <div class="col-sm-10">
	                            	<!-- 省 -->
	                                <select class="inpt w200" id="bond_site"
	                                        name="bond_site_city" style="float: left;">
	                                        <option value="">
	                                        	请选择省份
	                                        </option>
	                                    <c:forEach items="${siteList}" var="varMap" varStatus="vs">
	                                            <option value="${varMap.bond_site_id}">
	                                                    ${varMap.bond_location_name}
	                                            </option>
	                                    </c:forEach>
	                                </select>
	                                	<!-- 市 -->
		                                <select class="inpt w200" id="bond_site_city"
		                                        name="bond_site_city" style="float: left;">
		                                    
		                                            <option value="">
		                                                   请选择城市
		                                            </option>
		                                       
		                                </select>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	              </td>
	            </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="index_gdlc">
        <img src="pages/sys/kj/img/corner_1.png" class="corner corner1"/>
        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2"/>
        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3"/>
        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4"/>
        <div style=" min-height: 400px;" class="mainbox">
            <input type="hidden" id="listflag" value="null">

            <h3>
                资产委外
				<span class="pos_abs">
				    <a class="publich_"> 委外发布 </a>
				</span>
				
                <div class="product_search">
                    <div class="input_div input_div2">
                        <input id="searchinp" type="text" class="input input2 inputFocus" value="请输入产品代码、名称、类型"/>
                        <input id="searchbtn" type="button" value="" class="btn_search1 hand"/>
                        <ul class="nsearchlist"></ul>
                    </div>
                    <script type="text/javascript">
                        var allFunds = ["xmgj-2,东方红...,产业升级-产业升级,zBond_disposal.html,东方红产业升级",];
                        $(function () {
                            //搜索框效果
                            $("#searchinp").bind("keyup", function () {
                                $.post("bond/disposal/listtree",{"conditionName": "allSearch", "conditionValue":$("#searchinp").val()},function (datas) {
                                	
                                });
                            });
                            $("#searchbtn").click(function () {
                            	if($("#searchinp").val()=="请输入产品代码、名称、类型"){
                            		$("#searchinp").val("");
                            	}
                            	disType("allSearch",$("#searchinp").val());
                           		
                            });
                            $("#searchinp").bind("click", function (e) {
                                e.stopPropagation();
                            });
                            $(document).bind("click", function () {
                                $(".nsearchlist").hide();
                            });
                        });
                    </script>
                </div>
                <!---资产委外--->
    
            </h3>
            
	        <div class="index_gdlc_c">
		        <ul class="ul_qxjj" style="padding-top: 11px;height: 28px;">
		            <li class="li_first li_curr">资产委外(单笔)<img src="pages/sys/kj/img/line_arrow1.png"/></li>
		            <li>资产委外(资产包)<img src="pages/sys/kj/img/line_arrow1.png"/></li>
		        </ul>
	        	<!--资产委外-->
			    <div class="tr12 table_gdlc" >
			    	<jsp:include page="list_index.jsp"></jsp:include>
			    </div>
			      
	   			<!---资产包信息--->
		        <div class="table_gdlc none" >
			         <div class="screen_large hide" style="display: block;margin-top: 10px;">
				         <div style=" min-height: 400px;" class="deal mainbox">
				         	<jsp:include page="bond_deal.jsp"></jsp:include>
					     </div>
			      	 </div>
		        </div>
	        
	       </div>
             
        </div>
    </div>
</div>
<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
<input type="hidden" id="error" value="<%=session.getAttribute("error") %>"/>
<input type="hidden" id="success" value="<%=session.getAttribute("success") %>"/>
<script type="text/javascript">
	$(function(){
		$(".publich_").click(function(){
			var user_type = "企业发布方";
			var identity ="${identity}";
			if(user_type==identity){
				window.location.href="bond/disposal/index";
			}else{
				alert("不好意思，尊敬的"+name+"。只有发布方可以进行拍卖发布！");
			}
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		$("#screen").click(function(){
			var data ={};
	    	var nature1 = "begin";
	    	var nature2 = "end";
	    	if($("#begin").val()!=null && $("#begin").val()!='' &&$("#end").val()!=null && $("#end").val()!=''){
	    		data[nature1] = parseInt($("#begin").val())*10000;
		    	data[nature2] = parseInt($("#end").val())*10000;
		    	$.ajax({
		            url: "bond/disposal/listtree",
		            type:'POST',
		            data:data,
		            success: function (datas) {
		                 $(".tr12").html(datas);
		            }
	        	});
		    	$.ajax({
		            url: "bond/disposal/listdeal",
		            type:'POST',
		            data:data,
		            success: function (datas) {
		                 $(".deal").html(datas);
		            }
	        	});
	    	}
		});
 	})
	    function ship(id,stage){
    			//alert($("#"+id).text());
    			removeCl();
            	$(".xmxl_ul li").removeClass("on")
                $("#"+id).addClass("on");
            	cityEm();
                //console.log("权属金额");
                var conditionValue = $("#"+id).text();
                if (conditionValue != "不限") {
                	if(stage==1){
                		findbd("begin","10000","end","")
                	}else if(stage==2){
                		find("begin","10000","end","100000")
                	}else if(stage==3){
                		find("begin","100000","end","200000")
                	}else{
                		findbd("end","200000")
                	}
                }else {
                    disType("","");
                }
    }
    function find(name1,val1,name2,val2){
    	//alert(name1+","+val1+","+name2+","+val2)
    	var data ={};
    	var nature1 = name1;
    	var nature2 = name2;
    	data[nature1] = val1;
    	data[nature2] = val2;
    	$.ajax({
            url: "bond/disposal/listtree",
            type:'POST',
            data:data,
            success: function (datas) {
                 $(".tr12").html(datas);
            }
        });
    	$.ajax({
            url: "bond/disposal/listdeal",
            type:'POST',
            data:data,
            success: function (datas) {
                 $(".deal").html(datas);
            }
        });
    }
    function findbd(name,val){
    	var data ={};
    	var nature = name+"ol";
    	data[nature] = val;
    	$.ajax({
            url: "bond/disposal/listtree",
            type:'POST',
            data:data,
            success: function (datas) {
                 $(".tr12").html(datas);
            }
        });
    	$.ajax({
            url: "bond/disposal/listdeal",
            type:'POST',
            data:data,
            success: function (datas) {
                 $(".deal").html(datas);
            }
       });
    }
</script>
<script type="text/javascript">
		var error = $("#error").val();
		var success =$("#success").val();
		if(error!= "null" && error !="" && error!=null){
			alert(error);
			$.post("bond/sheet/remove",{},function(){});
		}
		if(success!="null"&&success!=''&&success!=null){
			alert(success);
			$.post("bond/sheet/remove",{},function(){});
		}
</script>
<!-- Bootstrap 3.3.6 -->

<!-- 转换显示 -->
<script type="text/javascript">
function disType(name,val){
	
	
        $.post("bond/disposal/listtree",{"conditionName": name, "conditionValue":val},function (datas) {
             $(".tr12").html(datas);
        });
    
        $.post("bond/disposal/listdeal",{"conditionName": name, "conditionValue":val},function(datas){
			 $(".deal").html(datas);
        });
	
}

	//$(function(){
		//$(".case1").click(function(){
			// $(".case1").attr("href","pages/sys/kj/bonddeal_list.jsp");
		//});
		//$(".mode1").click(function(){
			//$(".mode1").attr("href","pages/sys/kj/bonddisposal_list.jsp");
		//});
	//});
	
</script>
<!-- 全国的地址 -->
<script type="text/javascript">
	$(function(){
		if($("#bond_site option").size()<=1){
			$.post("bond/site/listjson",{"bond_site":"0"},function(map){
				var varList = map.resultObj.varList
				var select = $("#bond_site");
				select.empty(); 
				select.append('<option value="">请选择省份</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
		}
		
	});
	$(function(){
		$("#bond_site").change(function(){
			var bond_site = $("#bond_site").find("option:selected").text();
			var bond_site_pid = $("#bond_site").val();
			//console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				//console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#bond_site_city");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
		});
	})
</script>
<!-- 根据地址查资产 -->
<script type="text/javascript">
	$(function(){
		$("#bond_site_city").change(function(){
			var bond_site = $("#bond_site_city").find("option:selected").text();
			var bond_site_id = $("#bond_site_city").val();
			//console.log("id:"+bond_site_id+","+bond_site);
			//$.post("bond/disposal/listdeal",{"conditionName": "bond_location", "conditionValue": bond_site_id},function(datas){
				// $(".case").html(datas);
			//});
			removeCl();
			disType("bond_location",bond_site_id);
			
		});
		
	});
 
</script>
<script>
function  removeCl(){
		$(".xmxl_ul li").each(function(){
			$(".xmxl_ul li").removeClass("on");
			
		});
		$(".deadline_ul li").each(function(){
			$(".deadline_ul li").removeClass("on");
		});
		$(".days_ul li").each(function(){
			$(".days_ul li").removeClass("on");
		});
		$(".product_ul li").each(function(){
			$(".product_ul li").removeClass("on");
		});
		$(".rates_ul li").each(function(){
			$(".rates_ul li").removeClass("on");
		});
		$(".li1").addClass("on");
	};
	function cityEm(){
	$("#bond_site").val("");
	$("#bond_site_city").empty();
	$("#bond_site_city").append('<option value="">请选择城市</option>');
	}	



    
    $(function(){
        var liobj=$(".days_ul li");
        liobj.each(function(){
            $(this).click(function(){
            	removeCl();
                liobj.removeClass("on")
                $(this).addClass("on");
                cityEm();
                var conditionValue =  $(this).text();
                //console.log("自动计算天数的期限");
                if (conditionValue != "不限") {
                    //$.post("bond/disposal/listdeal",{"conditionName": "bond_bidding_cycle", "conditionValue": $(this).text()},function (datas) {
                       // $(".case").html(datas)
                   // });
                     disType("bond_bidding_cycle",conditionValue);
                }else {
                    //$.post("bond/disposal/listdeal",{},function (datas) {
                        //$(".case").html(datas)
                    //});
                    disType("","");
                }
            });
        });
    });
    $(function(){
        var liobj=$(".product_ul li");
        liobj.each(function(){
            $(this).click(function(){
            	removeCl();
                liobj.removeClass("on")
                $(this).addClass("on");
                cityEm();
                var conditionValue =  $(this).text();
                //console.log("债权分类");
                if (conditionValue != "不限") {
                    //$.post("bond/disposal/listdeal",{"conditionName": "bond_product_solutions", "conditionValue": $(this).text()},function (datas) {
                        //$(".case").html(datas)
                    //});
                    disType("bond_product_solutions",conditionValue);
                }else {
                    //$.post("bond/disposal/listdeal",{},function (datas) {
                        //$(".case").html(datas)
                    //});
                    disType("","");
                }
            });
        });
    });

    $(function(){
        var liobj=$(".rates_ul li");
        liobj.each(function(){
            $(this).click(function(){
            	removeCl();
                liobj.removeClass("on")
                $(this).addClass("on");
                cityEm();
                var conditionValue =  $(this).text();
               // console.log("类别属性");
                if (conditionValue != "不限") {
                    //$.post("bond/disposal/listdeal",{"conditionName": "bond_classify", "conditionValue": $(this).text()},function (datas) {
                        //$(".case").html(datas)
                    //});
                    disType("bond_classify",conditionValue);
                }else {
                    //$.post("bond/disposal/listdeal",{},function (datas) {
                        //$(".case").html(datas)
                    //});
                    disType("","");
                }
            });
        });
    });
</script>

</body>
</html>