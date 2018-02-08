<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache,no-store">
    <meta http-equiv="expires" content="0"/>
    <title>鑫淼聚不良资产处置平台</title>
    <meta http-equiv="keywords" content="鑫淼聚,资产管理,鑫淼聚,东方证券资产管理有限公司,投资,理财,基金，私募,集合理财,券商,专户理财,券商资管,资管,定向客户,宏观经济,业绩,领先"/>
    <meta http-equiv="description" content="鑫淼聚资产管理有限公司是中国证券会批准设立的首家券商资产管理公司；自1998年开始从事客户资产管理业务，2002年首批获得从事客户资产管理业务资格，2005年成为首批开展券商集合理财业务的证券公司，2010年成为首家获准设立的券商资产管理公司。 "/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css"/>
     <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/user.css"/>
    <script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.form.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/main.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/easing.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/bond_sheet.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/bond_show.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/bond_sheetcoll.js"></script>
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
	<style type="text/css">
		a{ 
			cursor:pointer
		 }
	</style>
</head>
<body>
<!--注册登录-->
<div class="top_wrap"> 	
    <div class="top">
        <a href="sys/kj/index"><img src="pages/sys/kj/img/logo9.png"  class="fl logo"/></a>
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
            <form name="formT" id="formT" method="post" target="_blank" action="">
                <input class="input inputFocus" type="text" name="inputSearchQuery" id="inputSearchQueryT" maxlength="12"/>
                <input type="hidden" name="service" value=""/>
                <input type="hidden" name="sp" value="S0"/>
                <input type="hidden" name="Form0" value="category,inputSearchQuery,$Submit"/>
                <input type="hidden" name="category" value="-1"/>
                <input type="submit" value="" class="btn_search hand" />
            </form>
        </div>
    </div>
</div>
<!--导航-->
<div class="nav">
    <div class="nav_c">
        <ul class="ul">
            <li class="li li_first">
                <a href="sys/kj/index" class="span">首页</a>
            </li>
		    <li class="li">
		        <a href="bond/disposal/list" class="span">资产委外</a>
		   </li>
		    <li class="li">
		        <a href="auction/assets/list" class="span">资产拍卖</a>
		    </li>
		    <li class="li">
		        <a href="pages/sys/kj/service.jsp" class="span">业务服务</a>
		    </li>
		    <li class="li libg">
		        <a href="pages/sys/kj/help.jsp" class="span">客户专区</a>
		    </li>
		    <li class="li">
		        <a href="pages/sys/kj/about.jsp" class="span">走进鑫淼聚</a>
				<div class="nav_sub">
				        <dl>
				            <dd>
				                <a href="pages/sys/kj/about.jsp">公司介绍</a>
				                | <br/>
				                <a href="pages/sys/kj/contact.jsp">联系我们</a>
				                | 
				            </dd>
				        </dl>
				</div>
		    </li>    
        </ul>
    </div>
</div>
<!--网站公告-->
  <div class="notice">
      <div class="notice_c">
          <img src="pages/sys/kj/img/notice.png" class="fl img" />
          <div class="notices">
              <div class="bd">
                  <ul>
                      <li><a href="contents.html" >关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                      <li><a href="contents.html" >个人金融信息安全</a></li>
                      <li><a href="contents.html">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                  </ul>
              </div>
          </div>
      </div>
  </div>
  
  
    <div class="wrap">
    	<div  class="img aboutbj"></div>
 	 	<div class="w1000 bc mt10">
		<!--左侧导航-->
		<div class="w1000 bc mt10">
		  	<div class="w130 fl">
			    <div class="treebox">
					<ul class="menu">
						<li class="level1" style="border-top:1px solid #ca0821;">
							<a href="#none"><em class="ico ico1"></em>个人信息<i class="down"></i></a>
							<ul class="level2">
								<li><a id="addUser" href="javascript:;">修改资料</a></li>
								<li><a id="modify_pwd" href="javascript:;">修改密码</a></li>
							</ul>
						</li>
						<li class="level1">
							<a href="#none"><em class="ico ico2"></em>发布管理<i></i></a>
							<ul class="level2">
								<li><a id="infomation" href="javascript:;">我的发布</a></li>
								<li><a id="asset" href="javascript:;">我的拍卖</a></li>
								<li><a id="transaction" href="javascript:;">购买资产</a></li>
								<li><a id="contract" href="javascript:;">合同管理</a></li>
								<li><a id="collection" href="javascript:;">我的催收</a></li>
								<li><a id="collection" href="http://192.168.1.160:8080/huihai/myapp/index.html">进入催收系统</a></li>
							</ul>
						</li>
					</ul>
				</div>
			    <div class="ad mt10">
		        <img width="140px" src="pages/sys/kj/img/ad5.png">
		        </div>
		    </div>
		  </div>
		<!--右侧信息-->
		<div class="space-right left" style="margin-left: 8px;">
			<!--基本信息-->
			<div class="w850 fr" id="jbxgk" style="display: block;">			
				<div class="border h100 p10">
						<div class="my-info-left fl">
						<p class="my-info-photo"><span class="photo"><img src="https://stc.tjfae.com/front/images/my-photo.png" width="60"></span>
						</p>
						<div class="my-info-txt">
							<p>
								<span class="mr30 f14">会员编码：<strong class="co_dr"> 123456</strong></span><br>
								<span class="f14 mt30 fl mr20">上次登录时间：2017-08-15 22:11:12</span>
								<!--<span>
									安全度：
										<strong class="co_r mr5">中</strong>
										<b class="savebar mt5" style="background:url(pages/sys/kj/img/savebar.png)"></b>　
										<a href="http://u.tjfae.com:443/user/modify_pwd.htm" class="co_r">修改密码</a>
								</span>-->
							</p>
							<!-- <div class="uc-zt-box">
								<span class="f14 mt30 fl mr20">上次登录时间：2017-08-15 22:11:12</span>						
							</div> -->
							<div class="clear"></div>
						</div>
					</div>			
				</div>
							
				<div class="clear"></div>
				<!--总体概况-->
				<div class="border h100 p10" style="height:454px;">
					<div class="my-info-left fl" style="width:430px;height:300px;padding: 17px 10px 17px 30px;">
						<div class="box_tab">
					       <h5>待办事项</h5>
						</div>
							<div class="box_con p15">
									<ul>
										<li class="f14 mt5 fl mr50">转让待办（<span><strong class="co_r mr5">0</strong></span>个）&nbsp;&nbsp;&nbsp;
					        				<br><a onclick="todo('transferToDo','waitSubmit');">
					        					<span style="color: #999;">上传挂牌资料：0个</span>
					        				</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="todo('transferToDo','undoRejected');">
												<span style="color: #999;">撤牌申请不通过：0个</span>
											</a>
					        			</li>
					                    <li class="f14 mt5 fl mr50">受让待办（<span><strong class="co_r mr5">0</strong></span>个）&nbsp;&nbsp;&nbsp;
					                        <br><a onclick="todo('srToDo','intentUpload');">
					                        	<span style="color: #999;">上传受让资料：0个</span>
					                        </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="todo('srToDo','intentRejected');">
												<span style="color: #999;">受让申请不通过：0个</span>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<br><a onclick="todo('srToDo','bondPay');">
												<span style="color: #999;">保证金缴纳：0个</span>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="todo('srToDo','bondUpload');">
												<span style="color: #999;">上传保证金资料：0个</span>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                        <br><a onclick="todo('srToDo','bondPayRejected');">
					                        	<span style="color: #999;">保证金缴款审核不通过：0个</span>
					                        </a>
										</li>
					                    <li class="f14 mt5 fl mr50">签约待办（<span><strong class="co_r mr5">0</strong></span>个）&nbsp;&nbsp;&nbsp;
											<br><a onclick="todo('signToDo','paymentSettleWay');">
												<span style="color: #999;">缴费设置和拟打款录入：0个</span>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a onclick="todo('signToDo','paymentSettleRejected');">
												<span style="color: #999;">缴费设置不通过：0个</span>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<br><a onclick="todo('signToDo','uploadData');">
												<span style="color: #999;">上传成交协议及指令等：0个</span>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<br><a onclick="todo('signToDo','uploadDataRejected');">
												<span style="color: #999;">上传成交协议及指令等：0个</span>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<br><a onclick="todo('signToDo','feePayType');">
												<span style="color: #999;">手续费扣除方式设置：0个</span>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<br><a onclick="todo('signToDo','feePayRejected');">
												<span style="color: #999;">手续费扣除设置不通过：0个</span>
											</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</li>
									</ul>
					       </div>
					       </div>
					
					<div class="my-info-right fr" style="width:300px;height:300px;text-align:left;padding: 17px 30px 17px 10px;">
						<div class="box_tab">
					       <h5>项目统计</h5>
						</div>
							<div class="box_con p15" style="height:160px;">
									<ul>					
										<li><span class="f14 mt5 fl mr50">挂牌金额（万元）：<strong class="co_r mr5">0</strong></span></li>
										<li><span class="f14 mt5 fl mr50">挂牌数量：<strong class="co_r mr5">0</strong></span></li>
										<li><span class="f14 mt5 fl mr50">受让金额（万元）：<strong class="co_r mr5">0</strong></span></li>
										<li><span class="f14 mt5 fl mr50">受让数量：<strong class="co_r mr5">0</strong></span></li>
										<li><span class="f14 mt5 fl mr50">成交金额（万元）：<strong class="co_r mr5">0</strong></span></li>
										<li><span class="f14 mt5 fl mr50">成交数量：<strong class="co_r mr5">0</strong></span></li>
					                </ul>
					        </div>
					</div>
				
				</div>
			</div>
			<!--修改资料信息-->
			<div class="w850 fr" id="addcompanyInfo" style="display: none;">
		<div class="box_tab">
			    <h5>修改资料信息</h5>
		</div>
		<div class="border no-topb">
		    <div class="info-box-body">
		    	<form action="sys/login/saveregfile" id="modifyCompanyForm" method="post" enctype="multipart/form-data">			   
					<table style="width:520px;" class="reg-table-1">
						<input type="hidden" id="formCode" name="formCode" value="MARDEAL_REG_FORM">
						<input type="hidden" id="userInfoStatus" name="userInfoStatus" value="1">
						<input type="hidden" id="sys_user_id" name="sys_user_id" value="${sysUser.sys_user_id}">
		             </table>
		             <table class="table-c-5" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
		          			<th style="width:150px">
									登录账号：
							 </th>
		          			<td>
								${sysUser.sys_user_account}
							</td>
		        		</tr>
				
				        <tr>
				          <th style="width:150px"><font color="red">*</font>&nbsp;机构名称：</th>
				          <td>
							<input type="text" id="sys_user_name" name="sys_user_name" class="inpt w200" value="${sysUser.sys_user_name}">
				            <label id="error_name" class="error"></label>
						  </td>
				        </tr>
						<tr>
				          <th style="width:150px"><font color="red">*</font>&nbsp;联系方式：</th>
				          <td>
							<input type="text" id="sys_user_account" name="sys_user_account" class="inpt w200" value="${sysUser.sys_user_account}">
				            <label id="error_name" class="error"></label>
						  </td>
				        </tr>
						<tr id="certNo">
				          <th style="width:150px"><font color="red">*</font>&nbsp;组织机构代码 ：</th>
				          <td>
							<input type="text" id="sys_org_id" name="sys_org_id" class="inpt w200" value="${sysUser.sys_org_id}">
				            <label id="error_name" class="error"></label>
						  </td>
				        </tr>
						<tr id="certNo">
				          <th style="width:150px"><font color="red">*</font>&nbsp;地址 ：</th>
				          <td>
							<select class="inpt w200" id="com_site" name="com_site" style="float: left;">
								<!-- 省 -->
								<c:forEach items="${province}" var="varMap">
									
										<option value="${varMap.bond_site_id}"
												 <c:if test="${varMap.bond_site_id == siteOne.bond_site_pid}">selected </c:if>>
												${varMap.bond_location_name}
										</option>
								</c:forEach>
							</select>
							<select class="inpt w200 company" id="sys_area_id1" name="sys_area_id" style="float: left;">
								<!-- 市 -->
								<c:forEach items="${city}" var="varMap">
										<option value="${varMap.bond_site_id}"
												 <c:if test="${varMap.bond_site_id == siteOne.bond_site_id}">selected </c:if>>
												${varMap.bond_location_name}
										</option>
								</c:forEach>
							</select>
						</td>
				        </tr>
				         <!-- 修改添加公司地址 -->
<script type="text/javascript">
	$(function(){
		$("#com_site").change(function(){
			var bond_site = $("#com_site").find("option:selected").text();
			var bond_site_pid = $("#com_site").val();
			console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#sys_area_id1");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
		});
		$("#sys_area_id1").change(function(){
			
			var location_name = $("#sys_area_id1").find("option:selected").text();
			var location_id = $("#sys_area_id1").val();
			console.log("name:"+location_name+",id:"+location_id);
			console.log("地址栏："+$("#sys_area_id1").val());
			
		});
		
	})
</script>
				        
				        <tr id="certNo">
				          <th style="width:150px"><font color="red">*</font>&nbsp;附件1 ：</th>
				          <td>
							<input type="file" id="sys_file_1" name="sys_file_1" class="inpt w200" onchange="companyclickfile1()">
				            <img id="image1" width="200px" height="200px" src="${file.sys_file1_addr}" alt="" />
						  </td>
				        </tr>
				        <tr id="certNo">
				          <th style="width:150px"><font color="red">*</font>&nbsp;附件2 ：</th>
				          <td>
							<input type="file" id="sys_file_2" name="sys_file_2" class="inpt w200" onchange="companyclickfile2()">
				            <img id="image2" width="200px" height="200px" src="${file.sys_file2_addr}" alt="" />
						  </td>
				        </tr>
						<tr>
							<th>&nbsp;</th>
							<td>
						   		<input type="button" id="submitBtn" value="保存并修改" class="btn-1" onclick="check()">
								<span style="color: #00A0EA;font-size: 12px;    float: right;"><a href="javascript:;" id="users">个人信息修改</a></span>
								&nbsp;&nbsp;
								</td>
							</tr>
			             </tbody>
		            </table>
		   		</form>
		        </div>
		    </div>
		</div>
			<!--个人修改资料信息-->
			<div class="w850 fr" id="addUserInfo" style="display: none;">
		<div class="box_tab">
			    <h5>修改资料信息</h5>
		</div>
		<div class="border no-topb">
		    <div class="info-box-body">
		    	<form action="sys/login/saveregfile" id="modifyUserForm" method="post" enctype="multipart/form-data">			   
					<table style="width:520px;" class="reg-table-1">
						<input type="hidden" id="formCode1" name="formCode1" value="MARDEAL_REG_FORM">
						<input type="hidden" id="userInfoStatus" name="userInfoStatus" value="1">
						<input type="hidden" id="sys_user_id" name="sys_user_id" value="${sysUser.sys_user_id}">
		             </table>
		             <table class="table-c-5" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
		          			<th style="width:150px">
									登录账号：
							 </th>
		          			<td>
								${sysUser.sys_user_account}
							</td>
		        		</tr>
				
				        <tr>
				          <th style="width:150px"><font color="red">*</font>&nbsp;名称：</th>
				          <td>
							<input type="text" id="sys_user_name" name="sys_user_name" class="inpt w200" value="${sysUser.sys_user_name}">
				            <label id="error_name" class="error"></label>
						  </td>
				        </tr>
						<tr>
				          <th style="width:150px"><font color="red">*</font>&nbsp;联系方式：</th>
				          <td>
							<input type="text" id="sys_user_account" name="sys_user_account" class="inpt w200" value="${sysUser.sys_user_account}">
				            <label id="error_name" class="error"></label>
						  </td>
				        </tr>
						
						<tr id="certNo">
				          <th style="width:150px"><font color="red">*</font>&nbsp;地址 ：</th>
				          <td>
							<select class="inpt w200" id="bond_site" name="bond_site" style="float: left;">
								<!-- 省 -->
								<c:forEach items="${province}" var="varMap">
									
										<option value="${varMap.bond_site_id}"
												 <c:if test="${varMap.bond_site_id == siteOne.bond_site_pid}">selected </c:if>>
												${varMap.bond_location_name}
										</option>
								</c:forEach>
							</select>
							<select class="inpt w200" id="sys_area_id" name="sys_area_id" style="float: left;">
								<!-- 市 -->
								<c:forEach items="${city}" var="varMap">
										<option value="${varMap.bond_site_id}"
												 <c:if test="${varMap.bond_site_id == siteOne.bond_site_id}">selected </c:if>>
												${varMap.bond_location_name}
										</option>
								</c:forEach>
							</select>
						</td>
				        </tr>
				       <!-- 添加修改个人地址 -->
<script type="text/javascript">
	$(function(){
		$("#bond_site").change(function(){
			var bond_site = $("#bond_site").find("option:selected").text();
			var bond_site_pid = $("#bond_site").val();
			console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#sys_area_id");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
		});
		$("#sys_area_id").change(function(){
			
			var location_name = $("#sys_area_id").find("option:selected").text();
			var location_id = $("#sys_area_id").val();
			console.log("name:"+location_name+",id:"+location_id);
			console.log("地址栏："+$("#sys_area_id").val());
		});
		
	})
</script>
				        
				        
				        
				        
				        <tr id="certNo">
				          <th style="width:150px"><font color="red">*</font>&nbsp;附件1 ：</th>
				          <td>
							<input type="file" id="sys_file_1" name="sys_file_1" class="inpt w200" value="${sysUser.sys_area_id}" onchange="userclickfile1()">
				            <img id="image1" width="200px" height="200px" src="${file.sys_file1_addr}" alt="" />
						  </td>
				        </tr>
				        <tr id="certNo">
				          <th style="width:150px"><font color="red">*</font>&nbsp;附件2 ：</th>
				          <td>
							<input type="file" id="sys_file_2" name="sys_file_2" class="inpt w200" value="${sysUser.sys_area_id}" onchange="userclickfile2()">
				            <img id="image2" width="200px" height="200px" src="${file.sys_file2_addr}" alt="" />
						  </td>
				        </tr>
						<tr>
							<th>&nbsp;</th>
							<td>
						   		<input type="button" id="submitBtn" value="保存并修改" class="btn-1" onclick="checkUser();">
								<span style="color: #00A0EA;font-size: 12px;    float: right;"><a href="javascript:;" id="companyx">公司信息修改</a></span>
								&nbsp;&nbsp;
								</td>
							</tr>
			             </tbody>
		            </table>
		   		</form>
		        </div>
		    </div>
		</div>
			<!--修改密码-->
			<div class="w850 fr" id="modify_ped" style="display: none;">
			<div class="box_tab">
				    <h5>修改密码</h5>
			</div>
			<div class="border no-topb">
			    <div class="info-box-body"><form action="sys/login/modifyPassword" id="modifyPasswordForm" method="post">
				<input type="hidden" id="pwdType" name="pwdType" value="password">
				<input type="hidden" id="pwdTypeName" name="pwdTypeName" value="登录密码">
				<input type="hidden" id="backUrl" name="backUrl" value="">
				<input type="hidden" id="sys_user_account" name="sys_user_account" value="${sysUser.sys_user_account}">
				<input type="hidden" id="sys_user_id" name="sys_user_id" value="${sysUser.sys_user_id}">
			        <table class="table-c-5" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
			          		<th style="width:150px">
								登录账号：
							</th>
			          		<td>
								${sysUser.sys_user_account}
							</td>
			        	</tr>
					
						<tr id="oldPwdTr">
				          <th style="width:150px">原始密码 ：</th>
				          	<td>
								<input type="password" id="sys_user_password_old" name="sys_user_password_old" value="" maxlength="16" class="input-2" onblur="checkOldPwd()" onselectstart="return false" oncopy="return false" onpaste="return false">
					            <span id="oldPwd_span" style="color:red"></span>
								<span id="oldPwd_tip" style="color:gray">输入您的原始密码</span>
							</td>
				        </tr>
						<tr id="tipsRow" style="display:none">
							<th style="width:150px">友情提醒：</th>
							<td><span style="color:blue">您未设置密码，请直接设置新密码</span></td>
						</tr>
						<tr>
							<th style="width:150px">新密码：</th>
							<td>
								<input type="password" id="sys_user_password" name="sys_user_password" value="" maxlength="16" class="input-2" onblur="checkPassword()" onselectstart="return false" oncopy="return false" onpaste="return false">
								<span id="password_span" style="color:red">*</span>
								<span id="password_tip" style="color:gray"></span>
							</td>
						</tr>
						
						<tr>
							<th style="width:150px">确认密码：</th>
							<td>
								<input type="password" id="sys_user_password_conf" name="sys_user_password_conf" value="" maxlength="20" class="input-2" onblur="checkConfirmPwd()" onselectstart="return false" oncopy="return false" onpaste="return false">
								<span id="confirmPwd_span" style="color:red">*</span>
								<span id="confirmPwd_tip" style="color:gray">请再次输入新密码</span>
							</td>
						</tr>
					    <tr>
							<th></th>
							<td>
								<input type="button" id="submitBtn" value="修改" class="btn-1" onclick="btnClickBind('modifyPasswordForm')">
							</td>
						</tr>
			              </tbody>
			        </table>
			   </form>
			</div>
			</div>
			</div>
		<!--发布信息-->
			<div class="w850 fr"  id="my_infomation" style="display: none;">
				<div class="space-right w850 fr" style="background-color: white;">
					<div class="bc location bai_se" style="height:60px;border: 0;margin-bottom: 0px;">
					   <div style="float:left; width:240px; margin-top:0px; margin-left:0px;padding:0px;" align="left" height="100%"> 
						  <img height="60px;" width="200" style=" margin-left:-12px; " src="pages/sys/kj/img/infomation.png">
					   </div>
					   <div align="center" class="zcfb">
					       <a class="pub">  信息发布	</a>
					       <input type="hidden" id ="user_type" value="${currentUser.sys_user_reg_type_d}"/>
					   </div>					  
					</div>
					<script type="text/javascript">
					$(function(){
						$(".pub").click(function(){
							
							user_type=$("#user_type").val();
							if(user_type!=null && user_type=="a77fda4f171f45f1b089f0dd18221e22"){
								$(this).attr("href","bond/disposal/index");
							}else{
								alert("您没有这个操作权限！");
							}
						});
					})
					</script>
					<!-- tab页 -->
					<!--<form action="" name="form1" id="form1" method="post">
					  <input type="hidden" name="state" id="state" value="">
				    </form>-->
					<div class="" style="background-color: white;border-bottom:1px #ccc solid;">
					<div class="tab-box">
				        <div class="box">
							<div class="box_tab" style="border: none;border-bottom: 1px solid #e1e1e1;">
								<ul>            
						            <li id="positionLi" onclick="positionTab()" class="hover">资产处置</li>
						            <li id="delegationFailedLi" onclick="delegationFailedTab()" class="">资产委外</li>
							        <li style="margin-left: 475px;font-size: 12px;">
								        <select id="sel" class="inpt w100">
								        	<option value="01" selected>待审核</option>
								        	<option value="03">已发布</option>
								        	<option value="09">已结束</option>
								        </select>
						            </li>
								</ul>
							</div>
							<!--资产处置-->
							<div id="positionDiv" class="btop-none p20 " style="display: block;">							
							<form id="positionTable" class="tb1 w" style="table-layout:fixed;" width="100%" border="0" cellspacing="0" cellpadding="0">
							    <div class="box p15">
							      	<div class="box_con1" style="border-style:none;">					 
								        <div class="record-list">
							    			<table class="table-list-2 mt10" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: automatic;word-wrap:break-word;">					
												<tr class="tr1">
											        <th width="80">企业名称</th>
											        <th width="80">资产编号</th>
											        <th width="80">接单时间</th>
											        <th width="80">接单处置方</th>
											        <th width="80">联系人</th>
											        <th width="80">联系人电话</th>
											        <th width="100">操作</th>
											    </tr>
											    <tbody id="dis1" ></tbody>
											</table>
											<div class="tcdPageCode">
												<a class="pre">上一页</a> &nbsp; &nbsp;<span>共<span id="total"></span>页/</span><span>当前页:<span id="pageIndex"></span>页</span> &nbsp; &nbsp;<a class="next">下一页</a>
											</div>
										</div>
										
										
												
									</div>
									<div class="clr"></div>
								</div>
							</form>							
							</div>			
							
							<!--资产委外-->
							<div id="delegationFailedDiv" class="btop-none p20 " style="display: none;">							
							    <form	 id="delegationFailedTable" class="tb1 w" width="100%" border="0" cellspacing="0" cellpadding="0">
							    	<div class="box p15">
							      	<div class="box_con1" style="border-style:none;">					 
								        <div class="record-list">
							    			<table class="table-list-2 mt10" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;word-wrap:break-word;">					
												<tr class="tr9">
											        <th width="80">企业名称</th>
											        <th width="80">资产编号</th>
											        <th width="80">接单时间</th>
											        <th width="80">接单处置方</th>
											        <th width="80">处置方性质</th>
											        <th width="80">联系人</th>
											        <th width="80">联系人电话</th>
											        <th width="100">操作</th>
											    </tr>
											    <tbody id="dis2">
											    </tbody>
											</table>
										
										</div>
										
										
										
										
										<div class="clr mt20"></div>
										 
									<ul id="bondshow" class="pagination pagination-sm pagin">
									</ul>		
									</div>
									<div class="clr"></div>
								</div>
								</div>
							    </form>							    
							</div>
						</div>
					</div>
					</div>
			
 			</div>
			</div>		
			<!--资产拍卖-->
			<div class="w850 fr"  id="my_asset" style="display: none;">
				<jsp:include page="user_asset_auction.jsp"></jsp:include>
			</div>
			
		<!--交易信息-->
			<div class="w850 fr"  id="my_transaction" style="display: none;">
				<div class="space-right w850 fr" style="background-color: white;">
					<div class="bc location bai_se" style="height:60px;border: 0;">
					   <div style="float:left; width:240px; margin-top:0px; margin-left:0px;padding:0px;" align="left" height="100%"> 
						  <img height="60px;" width="200" style=" margin-left:-12px; " src="pages/sys/kj/img/infomation.png">
					   </div>
					   <div align="center" class="zcfb">
					       <a href="Publish.html">  信息发布	</a>
					   </div>
					</div>
					<!-- tab页 -->
					<form action="" name="form0" id="form0" method="post">
					  <input type="hidden" name="state" id="state" value="">
				    </form>
					<div class="" style="background-color: white;border-bottom:1px #ccc solid;">
					<div class="tab-box mt10">
				        <ul>
				            <li id="fundInfoLi" class="cur">
				                <a hidefocus="true">购买资产</a>
				            </li>
				           				            
				            <li style="margin-left: 606px;">
						        <select id="sel" class="inpt w100">
						        	<option value="">全部状态</option>
						        	<option value="01">待审核</option>
						        	<option value="03">已完成</option>
						        	<option value="09">未成功</option>
						        </select>
				            </li>
				        </ul>
				    </div>
					</div>
			<div class="box w850">
		      	<div class="box_con1" style="border-style:none;">
					 <div class="p15">
			            <div class="record-list">
		    	<form action=" " name="forms2" id="forms2" method="post">
					<table class="table-list-2 mt10" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;word-wrap:break-word;">					
							<tr>
								<th>企业名称</th>
						        <th>资产编号</th>
						        <th>欠款（元)</th>
						        <th>挂牌开始时间</th>
						        <th>挂牌结束时间</th>
						        <th>转让比例</th>
						        <th>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态</th>
						        <th>发布时间</th>
						        <th width="50px">操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
							</tr>					
							<tr>
								<td><a href="pages/sys/kj/custom.html"   title="东方红产业升级">东方红产业升级</a></td>
					            <td>000619</td>
					            <td>123.3123.00</td>
					            <td>2017-08-04</td>
					            <td>2017-08-14</td>
					            <td><span class="span_down">89%</span></td>
					            <td><span class="span_down">已完成</span></td> 
					            <td>2017-08-04</td>
					            <td><a href="pages/sys/kj/bargain_xq.html"  >查看详情</a></td>
							</tr>
							<tr>
								<td><a href=""   title="某国有独资企业融资">某国有独资企业融资</a></td>
								<td>000619</td>
					            <td>123.3123.00</td>
					            <td>2017-08-04</td>
					            <td>2017-08-14</td>
					            <td><span class="span_down">89%</span></td>
					            <td><span class="span_down">待审核</span></td> 
					            <td>2017-08-04</td>
					            <td><a href="Publish.html"  >修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改</a></td>
							</tr>					
							<tr>
								<td><a href="pages/sys/kj/custom.html"   title="某国有独资企业融资">某国有独资企业融资</a></td>
								<td>000619</td>
					            <td>123.3123.00</td>
					            <td>2017-08-04</td>
					            <td>2017-08-14</td>
					            <td><span class="span_down">89%</span></td>
					            <td><span class="span_down">未成功</span></td> 
					            <td>2017-08-04</td>
					            <td><a href="pages/sys/kj/failcause.html"  >查看详情</a></td>
							</tr>
					</table>
				</form>
				</div>
				<div class="clr mt20"></div>
				<div class="pages">					
					<div class="pages-box">
						<div class="pages">
							<form name="page_slider_765" action=" " method="post">
										<input type="hidden" name="ucAccount" value="1708150006">
										 <input type="hidden" maxlength="8" name="currentPage" title="输入页码按回车" size="2" value="1" onkeydown="if(event.keyCode==13){goto765('');return false;}">
							  	<input type="text" name="tmpHiddenField2" style="display:none;">  	  		<span class="disabled" title="已是首页"> &lt; </span>
							  	  				<span class="current">1</span>
									  	  		<span class="disabled" title="已是首页"> &gt; </span>
							  			
								<input type="hidden" value="" name="checkBoxSelected">
							</form>
						</div>
					</div>
				</div>
				</div>
				</div>
				
				
				<div class="clr"></div>
			</div>
 			</div>
			</div>	
			<!-- 我的催收 -->	
			<div class="w850 fr"  id="my_collection" style="display: none;">
				<div class="space-right w850 fr" style="background-color: white;">
					<div class="bc location bai_se" style="height:60px;border: 0;">
					   <div style="float:left; width:240px; margin-top:0px; margin-left:0px;padding:0px;" align="left" height="100%"> 
						  <img height="60px;" width="200" style=" margin-left:-12px; " src="pages/sys/kj/img/infomation.png">
					   </div>
					   
					</div>
					<!-- tab页 -->
					<form action="" name="forms1" id="forms1" method="post">
					  <input type="hidden" name="state" id="state" value="">
				    </form>
					<div class="" style="background-color: white;border-bottom:1px #ccc solid;">
					<div class="tab-box mt10">
				        <ul>
				            <li id="fundInfoLi" class="cur">
				                <a hidefocus="true" class="pro">单笔资产</a>
				            </li>
				            <li id="fundInfoLi" class="cur">
				                <a hidefocus="true" class="pack">资产包</a>
				            </li>
				           				            
				            
				        </ul>
				    </div>
					</div>
			<div class="box w850">
		      	<div class="box_con1" style="border-style:none;">
					 <div class="p15">
			            <div class="record-list">
		    	<form action=" " name="form3" id="form3" method="post">
					<div class="table-list-2 mt10 one"  width="100%" border="0" cellspacing="0" cellpadding="0" style="word-wrap:break-word;display: block;">					
							<table class="table-list-2 mt10" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;word-wrap:break-word;">					
												<tr>
											        <th>名称</th>
											      	<th>交易类别</th>
											  		<th>接单时间</th>
											       	<th>委外到期时间</th>
											     	<th>联系人</th>
											      	<th>联系人电话</th>
											       	<th>操作</th>
											    </tr>
											    <tbody id="sheetOne">
											    </tbody>
											    
							</table>
							<ul id="scoll" class="pagination pagination-sm pagin">
							</ul>	
					</div>
				</form>
				</div>
				<div class="clr mt20"></div>
				
				</div>
				</div>
				
				
				<div class="clr"></div>
			</div>
 			</div>
			</div>		
		
		<div class="clear"></div>			
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
	<div>
		  <%  
            String publish = request.getParameter("publish");  
            String user = request.getParameter("user");  
         %>  
	</div>
<script type="text/javascript">
	$(function(){
		var publish = <%=publish %>;
		var user = <%=user %>
		
		if(publish=='1'){
			$("#infomation").trigger("click");
		}
		if(user=='1'){
			$("#addUser").trigger("click");
		}
	});		

</script>	



	
      <script type="text/javascript">
      
//持有中tab
function positionTab(){
	//隐藏样式
	$("#favoriteDiv").hide();
	$("#favoriteLi").removeClass();
	$("#inProgressDiv").hide();
	$("#inProgressLi").removeClass();
	$("#transferDiv").hide();
	$("#transferLi").removeClass();
	$("#delegationFailedDiv").hide();
	$("#delegationFailedLi").removeClass();
	//显示样式
	$("#positionDiv").show();
	$("#positionLi").addClass("hover");
	jQuery.ajax({
		url:"https://trade.tjfae.com/home/user/get_balance.htm",
		async:false,
		success:function(data){
			$("#positionTable tr td").remove();
			$("#positionTable").append(data);
		}
	});
}
//已兑付tab

//认购失败tab
function delegationFailedTab(){
	//隐藏样式
	$("#favoriteDiv").hide();
	$("#favoriteLi").removeClass();
	$("#inProgressDiv").hide();
	$("#inProgressLi").removeClass();
	$("#transferDiv").hide();
	$("#transferLi").removeClass();
	$("#positionDiv").hide();
	$("#positionLi").removeClass();
	//显示样式
	$("#delegationFailedDiv").show();
	$("#delegationFailedLi").addClass("hover");
	jQuery.ajax({
		url:"https://trade.tjfae.com/home/user/get_delegate_failed.htm",
		success:function(data){
			$("#delegationFailedTable tr td").remove();
			$("#delegationFailedTable").append(data);
		}
	});
}
function check(){
	
	var company = $('#modifyCompanyForm #sys_user_name').val();
	var company_account = $("#modifyCompanyForm #sys_user_account").val();
	var org = $("#modifyCompanyForm #sys_org_id").val();
	var area = $("#modifyCompanyForm #sys_company_area").val();
	var image1 = $("#modifyCompanyForm").find("#image1").attr("src");
	var image2 = $("#modifyCompanyForm").find("#image2").attr("src");
		if(company !='' &&company_account!=''&&org!=''&&area!=''&&image1!=''&&image2!=''){
			btnClickBind('modifyCompanyForm');
			
		}else{
			alert("请将带星号的信息填写完整！");
		}
	
}
function checkUser(){
	
	var company = $('#modifyUserForm #sys_user_name').val();
	var company_account = $("#modifyUserForm #sys_user_account").val();
	var area = $("#modifyUserForm #sys_area_id").val();
	var image1 = $("#modifyUserForm").find("#image1").attr("src");
	var image2 = $("#modifyUserForm").find("#image2").attr("src");
		if(company !='' &&company_account!=''&&area!=''&&area!=null&&image1!=''&&image2!=''){
			btnClickBind('modifyUserForm');
			
		}else{
			alert("请将带星号的信息填写完整！");
		}
}
function btnClickBind(formName){
	$('#'+formName).ajaxSubmit({  
			success: function(data) {
			if(data.resultMsg){
				alert(data.resultMsg);
			}else{
				alert("您的资料上传成功 ，请耐心等待工作人员审核");
			}
		
		}
});

// 	   $.ajax({
// 			type: "POST",
// 			url:$('#'+formName).attr('action'),
// 			data:$('#'+formName).serialize(),// 你的formid
// 			cache: false,
// 			async: false,
// 			error: function(request) {
// 				alert("信息有误");
// 			},
// 			success: function(data) {
// 				if(data.resultMsg){
// 					alert(data.resultMsg);
// 				}else{
// 					alert("成功");
// 				}
				
// 			}
// 		});
}
//li标签hover切换
function changeHover(liId){
	var tempUrl = "";
	$("li[name='tableLi']").each(function(){ 
            tempUrl=$(this).attr("id") 
            if((tempUrl.indexOf(liId) >= 0 )){ 
                 $(this).attr("class","hover"); 
                return false; 
            }else{
				$(this).attr("class",""); 
			} 
       });
}

    	<!--导航树-->
    	$(function(){
			$(".treebox .level1>a").click(function(){
				$(this).addClass('current')  
				.find('i').addClass('down')  
				.parent().next().slideDown('slow','easeOutQuad')  
				.parent().siblings().children('a').removeClass('current')
				.find('i').removeClass('down').parent().next().slideUp('slow','easeOutQuad');
				 return false; //阻止默认时间
			});
		})
    	
	
	$(function(){
    var liobj=$(".level2 li a");
    liobj.each(function(){
        $(this).click(function(){
        liobj.removeClass("selectedMenu")
            $(this).addClass("selectedMenu");
            //return false;    //加这句来阻止跳转 可用来调试效果
        });
    });
});
   	$('#collection').on('click',function(){
            $("#my_collection").show();
     		$("#modify_ped").hide();
     		$("#my_infomation").hide();
     		$("#my_transaction").hide();
     		$("#my_asset").hide();
     		$("#jbxgk").hide();
     		$("#addUserInfo").hide();
     		$("#addcompanyInfo").hide();
       });

	$('#addUser').on('click',function(){
		//alert("个人用户请在个人信息页面修改，企业用户请在公司信息修改！");
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").show();
  		$("#modify_ped").hide();
  		$("#my_infomation").hide();
  		$("#my_transaction").hide();
  		$("#my_asset").hide();
  		$("#jbxgk").hide();
  		$("#my_collection").hide();
  		$("#addcompanyInfo").hide();
    });
	$('#modify_pwd').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").show();
  		$("#my_infomation").hide();
  		$("#my_transaction").hide();
  		$("#my_asset").hide();
  		$("#jbxgk").hide();
  		$("#my_collection").hide();
  		$("#addcompanyInfo").hide();
    });
    $('#infomation').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").hide();
  		$("#my_infomation").show();
  		$("#my_transaction").hide();
  		$("#my_asset").hide();
  		$("#jbxgk").hide();
  		$("#my_collection").hide();
  		$("#addcompanyInfo").hide();
    });
    $('#transaction').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").hide();
  		$("#my_infomation").hide();
  		$("#my_transaction").show();
  		$("#my_asset").hide();
  		$("#jbxgk").hide();
  		$("#my_collection").hide();
    });
       $('#asset').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").hide();
  		$("#my_infomation").hide();
  		$("#my_transaction").hide();
  		$("#my_asset").show();
  		$("#jbxgk").hide();
  		$("#my_collection").hide();
  		$("#addcompanyInfo").hide();
    });
	$('#companyx').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addcompanyInfo").show();
  		$("#addUserInfo").hide();
    });
	$('#users').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
        $("#addcompanyInfo").hide();
  		$("#addUserInfo").show();
    });
  
    </script>
    <script>
 
  $(function () {
  	//window.top.loadClose();
  	//Initialize Select2 Elements
    //$(".select2").select2();
	//Flat red color scheme for iCheck
	 //$('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
	   //checkboxClass: 'icheckbox_flat-green',
	   //radioClass: 'iradio_flat-green'
	 //});
	 $('#checkAll').on('ifChecked', function(event){
	 		$('input#sysFileIds').iCheck('check');
	 	});
	 	$('#checkAll').on('ifUnchecked', function(event){
	 		$('input#sysFileIds').iCheck('uncheck');
	 	});
	// $("#page").pagination({
	    // pageIndex: $("#pageIndex").val(),
	    // pageSize: $("#pageSize").val(),
		 //total: $("#total").val(),
	     //debug: true,
	     //showInfo: true,
	    // showJump: false,
	    // showPageSizes: false,
	    // pageElementSort: ['$page', '$size', '$jump', '$info']
	 //});
    $("#page").on("pageClicked", function (event, data) {
    	window.top.loadStart();
    	$("#pageIndex").val(data.pageIndex);
    	$("#sysfileListForm").submit();
	});
    $("#page").on("pageSizeChanged", function (event, data) {
    	window.top.loadStart();
    	$("#pageSize").val(data.pageSize);
    	$("#sysfileListForm").submit();
	});
    
  });
 	function del(url,height){
    	window.top.delDialog(url,height);
    }
    function delArray(url,height){
 		var sysFileIds = new Array();
 		 $("#sysFileIds:checked").each(function() {
 			sysFileIds.push($(this).val()); 
 		 });
    	window.top.delArrayDialog(url,sysFileIds);
    }
    function postObjs(url,height){
 		var objs = new Array();
 		 $("#sysFileIds:checked").each(function() {
 			var obj = {};
 			obj.sysFile_id = $(this).val();
 			objs.push(obj); 
 		 });
    	window.top.postObjsDialog(url,objs);
    }
    function upload(url,height){
    	window.top.uploadDialog(url,height);
    }
	function edit(url,height){
    	window.top.editDialog(url,height);
    }
    function add(url,height){
    	window.top.editDialog(url,height);
    }
    function formSubmit(){
		  $("#sysfileListForm").submit();
	}
	function resetSearch(){
    	$("#conditionValue").val("");
    	//alert($("#conditionName").val()); value 值
    	//alert($('#conditionName  option:selected').text()); text 值
    	$("#conditionName").val("").trigger("change");
    }
	 function userclickfile1(){
			 var r= new FileReader();
			 f=$("#modifyUserForm").find("#sys_file_1").get(0).files[0]
			 r.readAsDataURL(f);
			 r.onload=function  (e) {
			 	$("#modifyUserForm").find("#image1").attr("src",this.result);
			 }
		}
		function userclickfile2(){
			var r= new FileReader();
			f=$("#modifyUserForm").find("#sys_file_2").get(0).files[0]
			r.readAsDataURL(f);
			r.onload=function  (e) {
				$("#modifyUserForm").find("#image2").attr("src",this.result);
			}
		}
		function companyclickfile1(){
			 var r= new FileReader();
			 f=$("#modifyCompanyForm").find("#sys_file_1").get(0).files[0]
			 r.readAsDataURL(f);
			 r.onload=function  (e) {
				 $("#modifyCompanyForm").find("#image1").attr("src",this.result);
			 }
		}
		function companyclickfile2(){
			var r= new FileReader();
			f=$("#modifyCompanyForm").find("#sys_file_2").get(0).files[0]
			r.readAsDataURL(f);
			r.onload=function  (e) {
				$("#modifyCompanyForm").find("#image2").attr("src",this.result);
			}
		}
    </script>
</body>
</html>