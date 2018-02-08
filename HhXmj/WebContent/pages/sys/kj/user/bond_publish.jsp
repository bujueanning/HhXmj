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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache,no-store">
	<meta http-equiv="expires" content="0"/>
	<title>鑫淼聚不良资产处置平台</title>
	<meta http-equiv="keywords" content="鑫淼聚,资产管理,鑫淼聚,东方证券资产管理有限公司,投资,理财,基金，私募,集合理财,券商,专户理财,券商资管,资管,定向客户,宏观经济,业绩,领先"/>
	<meta http-equiv="description" content="鑫淼聚资产管理有限公司是中国证券会批准设立的首家券商资产管理公司；自1998年开始从事客户资产管理业务，2002年首批获得从事客户资产管理业务资格，2005年成为首批开展券商集合理财业务的证券公司，2010年成为首家获准设立的券商资产管理公司。 "/>
	<link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css?t=201710102113"/>
	<link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css?t=201710102113"/>
	<link rel="stylesheet" type="text/css" href="pages/sys/kj/css/user.css?t=201710102113"/>
	<!-- bootstrap datepicker -->
	<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
	<script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/main.js"></script>

	<!-- 
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
	 -->
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	<!-- 
	<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
	 -->
	<c:set var="name" value="${currentUser.sys_user_name}"/>
	<script type="text/javascript">
    var name = "${name}";
 	</script>
	<style type="text/css">
		.thStyle{
			width:130px ;
			border-width:1px;
			text-align:center
		}

		.tdStyle{
			width: 150px;
			border-width:1px;
			text-align:center
		}
		.show{
			float:left
		}
	</style>
	<c:set var="varList" value="${varList}"/>
	
	<script type="text/javascript">
    	var bondDisposal = "${varList}";
    	var bond_location ="${bond_location}";
    	var bond_product_solutions ="${bond_product_solutions}";
    	var bond_ownership_amount ="${bond_ownership_amount}";
    	var bond_classify ="${bond_classify}";
 	</script>
	
	
</head>
<body>
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
<div class="w1000 bc mt10">
	<form id="disposal" action="bond/disposal/save" method="post" enctype="multipart/form-data">
<div class="space-right publishtable">
	<div class="border p10" style="border-width:0px;">
		<div class="clr"></div>
		<input type="hidden" name="bond_disposal_id" id="bond_disposal_id" value="${bondDis.bond_disposal_id}"/>
		<!-- 新加一个修改，varList为空是则是发布，不为空则是修改 -->
		 <c:choose>
            <c:when test="${empty varList}">
		<div class="mt10">		
		
         <table class="table-c-1" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
				<td class="publishtitle" colspan="4" style="border: none;    padding-bottom: 30px;">
					<spant><bold>发布资产委外信息</bold></spant>
					<h2 style="float: right;"><a href="pages/sys/kj/index.jsp" style="font-size: 14px; color: darkgrey;">返回 ></a></h2>
				</td>
			</tr>		
			<tr>
				
				<input type="hidden" name="bond_disposal_createuid" id="bond_disposal_createuid" value="${currentUser.sys_user_id}"/>
				<input type="hidden" name="token"  value="<%=session.getAttribute("token") %>"/>
				<th class="thStyle">企业(个人)名称</th>
				<td class="tdStyle" colspan="3">
					<input id="bond_company_name" name="bond_company_name"  type="text" style="text-align:center;" required/>
				</td>
			</tr>
			<tr>
				<th class="thStyle">交易类别</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_deal" name="bond_deal" style="float: left;">
						<c:forEach items="${dictList}" var="varMap" varStatus="vs">
							<c:if test="${varMap.dict_assets_pid == 'bond_deal'}">
								<option value="${varMap.dict_assets_key}">
										${varMap.dict_assets_name}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<th class="thStyle">资产包案件数量</th>
				<td class="tdStyle">
					<table>
						<tr>
							<td style="border:none;"><input title="只有修改交易类别为委外包才可修改此属性!" disabled name="bond_case" id="bond_case" value="1"  type="text" placeholder="单笔用1份表示" pattern="[0-9]+" style="width: 100px;" required/></td>
							<td style="border:none;"><span style="vertical-align: top;" >份</span></td>
						</tr>
					</table>
					 
					 
				 </td>
				</tr>
				<tr>
				<th class="thStyle">债权人所在地</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_site" name="bond_site" style="float: left;">
						
							     <option value="">
                                     	请选择省份
                                  </option>
                                  <c:forEach items="${siteList}" var="varMap" varStatus="vs">
                                          <option value="${varMap.bond_site_id}">
                                                  ${varMap.bond_location_name}
                                          </option>
                                  </c:forEach>
						
					</select>
					<select class="inpt w200" id="bond_location" name="bond_location" style="float: left;">
						<option value="">请选择城市</option>
					</select>
				</td>
				<th class="thStyle">债务人所在地</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_debt_site" name="bond_debt_site" style="float: left;">
						
							     <option value="">
                                     	请选择省份
                                  </option>
                                  <c:forEach items="${siteList}" var="varMap" varStatus="vs">
                                          <option value="${varMap.bond_site_id}">
                                                  ${varMap.bond_location_name}
                                          </option>
                                  </c:forEach>
						
					</select>
					<select class="inpt w200" id="bond_debt_location" name="bond_debt_location" style="float: left;">
						<option value="">请选择城市</option>
					</select>
				</td>
			</tr>
			<!-- 
			<tr>
				<th class="thStyle">交易类别</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_deal" name="bond_deal" style="float: left;">
						<c:forEach items="${dictList}" var="varMap" varStatus="vs">
							<c:if test="${varMap.dict_assets_pid == 'bond_deal'}">
								<option value="${varMap.dict_assets_key}">
										${varMap.dict_assets_name}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<th class="thStyle">权属金额</th>
				<td class="tdStyle">
				 -->
				<!-- 
					<select class="inpt w200" id="bond_ownership_amount" name="bond_ownership_amount" style="float: left;">
						<c:forEach items="${dictList}" var="varMap">
							<c:if test="${varMap.dict_assets_pid == 'bond_ownership_amount'}">
								<option value="${varMap.dict_assets_key}">
										${varMap.dict_assets_name}
								</option>
							</c:if>
						</c:forEach>
					</select>
					 -->
					 <!-- 
					<table>
						<tr>
							<td style="border:none;"><input name="bond_ownership_amount" id="bond_ownership_amount" type="text" pattern="[0-9]+" style="width: 100px;;" required/></td>
							<td style="border:none;"><span style="vertical-align: top;" >万元</span></td>
						</tr>
					</table>
					
				</td>
			</tr>
			 -->
			<tr>
				<th class="thStyle">债权类型</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_product_solutions" name="bond_product_solutions" style="float: left;">
						<c:forEach items="${dictList}" var="varMap" varStatus="vs">
							<c:if test="${varMap.dict_assets_pid == 'bond_product_solutions'}">
								<option value="${varMap.dict_assets_key}">
										${varMap.dict_assets_name}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<th class="thStyle">处置模式</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_classify" name="bond_classify" style="float: left;">
						<c:forEach items="${dictList}" var="varMap" varStatus="vs">
							<c:if test="${varMap.dict_assets_pid == 'bond_classify'}">
								<option value="${varMap.dict_assets_key}">
										${varMap.dict_assets_name}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
		    </tr>
			<!-- 
			<tr>
				<th class="thStyle">权属金额</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_ownership_amount" name="bond_ownership_amount" style="float: left;">
						<c:forEach items="${dictList}" var="varMap">
							<c:if test="${varMap.dict_assets_pid == 'bond_ownership_amount'}">
								<option value="${varMap.dict_assets_key}">
										${varMap.dict_assets_name}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<th class="thStyle">资产编号</th>
				<td class="tdStyle">
					<input id="bond_asset_number" name="bond_asset_number"  />
				</td>
		     </tr>
		      -->
		      
			 <tr>
				 <th class="thStyle">逾期时间</th>
				 <td class="tdStyle">
					 <input  style="width: 100px;height: 50px;float:left;" name="bond_overdue" id="bond_overdue"  type="text" placeholder="单笔交易精确到天，资产包精确月。例如：1-2个月" pattern="[0-9]+"/>
					 <select id="overdue_time" name="overdue_time" style="margin-left: 50px;height: 50px;"><option>天</option><option>月</option></select>
				 </td>
				 
				 <th class="thStyle">
					 委外期限
				 </th>
				 <td class="tdStyle">
					 <input  style="width: 100px;height: 50px;float:left;" name="bond_deadline" id="bond_deadline"   type="text" placeholder="请填写数字，精确到月" pattern="[0-9]+"/>
					 <select id="deadline_time" name="deadline_time" style="margin-left: 50px;height: 50px;"><option>月</option></select>
				 </td>
			 </tr>
		     
			 <tr>
			 	 <th class="thStyle">总欠款(元)</th>
			 	 <td class="tdStyle">
					 <input  name="bond_disposal_arrears" id="bond_disposal_arrears" class="form-control " required/>
				 </td>
				 <th class="thStyle">佣金比例(%)</th>
				 <td class="tdStyle">
					 <input id="bond_transfer_ratio" name="bond_transfer_ratio" type="text" title="例:9" maxlength="2" pattern="^([1-9][0-9])|([1-9])$" required />
				 </td>
				 
			 </tr>
			 
		    
			
			<tr>
				<th class="thStyle">发布方联系人</th>
				<td class="tdStyle">	
					<input id="bond_contacts" name="bond_contacts" required />
				</td>
				<th class="thStyle">发布方联系方式</th>
				<td class="tdStyle">		
				    <input id="bond_contact_number" name="bond_contact_number" required />
				</td>
		     </tr>
		    
			 <tr>
				<td style="width:130px ; border-width:1px;text-align:center" width="120">
					上传照片
				</td>
				<td width="150" style="border-width:1px;" colspan="3">
					<div class="bmxtxzp">
						点击上传照片
						<input type="file" id="bond_disposal_img" name="bond_disposal_img" value="" onchange="javascript:checkAttr('91','auction_assets_img','N','N','[\s\S]*.(jpg|jpeg|gif|png|pdf|JPG|JPEG|GIF|PNG)$','','','edit','auction_assets_img','null')">
						
					</div>
					<%--<div class="bmxtxzp">--%>
						<%--<span id="idCardBackImg_view" style="position:relative;top:-20px;left:-20px;">--%>
                            <%--<input type='file' id='auction_assets_img' name="auction_assets_img" onchange='show()' value='' style="opacity: 0;height: 120px;"/>--%>
         					<%--<img src='pages/sys/kj/img/shipin.png' alt='' id='img' class="span_img"/>--%>
						<%--</span>--%>
						<%--<label for="thumbnail" class="col-md-3 control-label">点击上传照片</label>--%>
					<%--</div>--%>
				</td>
			</tr>
			<tr>
				<td style="width:130px ; border-width:1px;text-align:center" width="120">
					上传附件
				</td>
				<td width="150" style="border-width:1px;" colspan="3">
					<div class="bmxtxzp">
						点击上传附件
						<input type="file" id="bond_disposal_accessory" name="bond_disposal_accessory" value="" >
					</div>
				</td>
			</tr>
			
		      
		</table>					
	</div>
     <div class="mt10">
		 <input class="publishtj" type='submit' value='提交审核'/>
     </div>
     </c:when>
     <c:otherwise>
      <!-- 修改的内容 -->
     <div class="mt10">		
		
         <table class="table-c-1" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
				<td class="publishtitle" colspan="4" style="border: none;    padding-bottom: 30px;">
					<spant><bold>修改资产委外信息</bold></spant>
					<h2 style="float: right;"><a href="pages/sys/kj/index.jsp" style="font-size: 14px; color: darkgrey;">返回 ></a></h2>
				</td>
			</tr>		
			<tr>
				<c:forEach items="${varList}" var="bondDisposal">
					<input type="hidden" name="location" id="location" value="${bondDisposal.bond_location}"/>
					<input type="hidden" name="product_solutions" id="product_solutions" value="${bondDisposal.bond_product_solutions}"/>
					<input type="hidden" name="ownership_amount" id="ownership_amount" value="${bondDisposal.bond_ownership_amount}"/>
					<input type="hidden" name="classify" id="classify" value="${bondDisposal.bond_classify}"/>
					
				</c:forEach>
				<th class="thStyle">企业名称</th>
				<td class="tdStyle" colspan="3">
				 <c:forEach items="${varList}" var="bondDisposal">
					<input id="bond_company_name" name="bond_company_name"  type="text" style="text-align:center;"  value="${bondDisposal.bond_company_name }"/>
				 </c:forEach>
				</td>
				</tr>
				<tr>
				<th class="thStyle">债权人所在地</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_site" name="bond_site" style="float: left;">
						<!-- 省 -->
						<c:forEach items="${province}" var="varMap">
							
								<option value="${varMap.bond_site_id}"
										 <c:if test="${varMap.bond_site_id == siteOne.bond_site_pid}">selected </c:if>>
										${varMap.bond_location_name}
								</option>
						</c:forEach>
					</select>
					<select class="inpt w200" id="bond_location" name="bond_location" style="float: left;">
						<!-- 市 -->
						<c:forEach items="${city}" var="varMap">
							
								<option value="${varMap.bond_site_id}"
										 <c:if test="${varMap.bond_site_id == siteOne.bond_site_id}">selected </c:if>>
										${varMap.bond_location_name}
								</option>
						</c:forEach>
					</select>
				</td>
				<th class="thStyle">债务人所在地</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_debt_site" name="bond_debt_site" style="float: left;">
						<!-- 省 -->
						<c:forEach items="${debtPro}" var="varMap">
							
								<option value="${varMap.bond_site_id}"
										 <c:if test="${varMap.bond_site_id == debtSite.bond_site_pid}">selected </c:if>>
										${varMap.bond_location_name}
								</option>
						</c:forEach>
					</select>
					<select class="inpt w200" id="bond_debt_location" name="bond_debt_location" style="float: left;">
						<!-- 市 -->
						<c:forEach items="${debtCity}" var="varMap">
							
								<option value="${varMap.bond_site_id}"
										 <c:if test="${varMap.bond_site_id == debtSite.bond_site_id}">selected </c:if>>
										${varMap.bond_location_name}
								</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="thStyle">交易类别</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_deal" name="bond_deal" style="float: left;" disabled="disabled">
						<c:forEach items="${dictList}" var="varMap" varStatus="vs">
							<c:if test="${varMap.dict_assets_pid == 'bond_deal'}">
								<option value="${varMap.dict_assets_key}" 
								 		<c:if test="${varMap.dict_assets_key== bondDisposal.bond_deal}">selected</c:if>>
								 		${varMap.dict_assets_name}
								</option>							
								
							</c:if>
						</c:forEach>
					</select>
				</td>
				<th class="thStyle">资产包案件数量</th>
				<td class="tdStyle">
					 <input  name="bond_case" id="bond_case"  type="text" placeholder="单笔用1份表示" value="${bondDisposal.bond_case }" required/>
				 </td>
			</tr>
			<tr>
				<th class="thStyle">债权类型</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_product_solutions" name="bond_product_solutions" style="float: left;">
						<c:forEach items="${dictList}" var="varMap" varStatus="vs">
							<c:if test="${varMap.dict_assets_pid == 'bond_product_solutions'}">
								<option value="${varMap.dict_assets_key}"
										<c:if test="${varMap.dict_assets_key== bondDisposal.bond_product_solutions}">selected</c:if>>
										${varMap.dict_assets_name}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<th class="thStyle">处置模式</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_classify" name="bond_classify" style="float: left;">
						<c:forEach items="${dictList}" var="varMap" varStatus="vs">
							<c:if test="${varMap.dict_assets_pid == 'bond_classify'}">
								<option value="${varMap.dict_assets_key}">
										${varMap.dict_assets_name}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
		    </tr>
			
			<tr>
				<th class="thStyle">权属金额</th>
				<td class="tdStyle">
					<select class="inpt w200" id="bond_ownership_amount" name="bond_ownership_amount" style="float: left;">
						<c:forEach items="${dictList}" var="varMap">
							<c:if test="${varMap.dict_assets_pid == 'bond_ownership_amount'}">
								<option value="${varMap.dict_assets_key}">
										${varMap.dict_assets_name}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<th class="thStyle">资产编号</th>
				<td class="tdStyle">
				<c:forEach items="${varList}" var="bondDisposal">
					<input id="bond_asset_number" name="bond_asset_number"  type="text" value="${bondDisposal.bond_asset_number}" required/>
				</c:forEach>
				</td>
		     </tr>
			 <tr>
				 <th class="thStyle">逾期时间</th>
				 <td class="tdStyle">
					 <input style="width: 100px;height: 50px;float:left;" name="bond_overdue" id="bond_overdue"  type="text" placeholder="单笔交易精确到天，资产包精确月。例如：1-2个月"  pattern="[0-9]+" required
					  		 value="${bondDisposal.bond_overdue }"/>
					 <select id="overdue_time" name="overdue_time"style="margin-left: 50px;height: 50px;"><option>天</option><option>月</option></select>
				 </td>
				 <th class="thStyle">
					 委外期限
				 </th>
				 <td class="tdStyle">
					 <input style="width: 100px;height: 50px;float:left;" name="bond_deadline" id="bond_deadline"   type="text" placeholder="请填写数字，精确到月" value="${bondDisposal.bond_deadline }" pattern="[0-9]+" required/>
					 <select id="deadline_time" name="deadline_time" style="margin-left: 50px;height: 50px;"><option>月</option></select>
				 </td>
			 </tr>
		     <c:forEach items="${varList}" var="bondDisposal">
			 <tr>
			 	 <th class="thStyle">总欠款(元)</th>
			 	 <td class="tdStyle">
					 <input  name="bond_disposal_arrears" id="bond_disposal_arrears" class="form-control " type="text" value="${bondDisposal.bond_disposal_arrears}" pattern="[0-9]+" required/>
				 </td>
				 <th class="thStyle">佣金比例(%)</th>
				 <td class="tdStyle">
					 <input id="bond_transfer_ratio" name="bond_transfer_ratio" type="text" maxlength="3" pattern="^([1-9][0-9])|([1-9])$" title="例:9" value="${bondDisposal.bond_transfer_ratio}" required />
				 </td>
				 
			 </tr>
			 
		    
			
			<tr>
				<th class="thStyle">发布方联系人</th>
				<td class="tdStyle">	
				
					<input id="bond_contacts" name="bond_contacts"  type="text" required value="${bondDisposal.bond_contacts}"/>
				</td>
				<th class="thStyle">发布方联系方式</th>
				<td class="tdStyle">		
				    <input id="bond_contact_number" name="bond_contact_number" type="text" required value="${bondDisposal.bond_contact_number}" pattern="^[1][3,4,5,7,8][0-9]{9}$" required />
				</td>
		     </tr>
		    </c:forEach>
			 <tr>
				<td style="width:130px ; border-width:1px;text-align:center" width="120">
					上传照片
				</td>
				<td width="150" style="border-width:1px;" colspan="3">
					<div class="bmxtxzp">
						点击上传照片
						<input type="file" id="bond_disposal_img" name="bond_disposal_img" value="${bondDisposal.bond_disposal_img}" onchange="img2();">
					</div>
					<img id="image2" width="200px" height="200px" src="${bondDisposal.bond_disposal_img}"/>
					<%--<div class="bmxtxzp">--%>
						<%--<span id="idCardBackImg_view" style="position:relative;top:-20px;left:-20px;">--%>
                            <%--<input type='file' id='auction_assets_img' name="auction_assets_img" onchange='show()' value='' style="opacity: 0;height: 120px;"/>--%>
         					<%--<img src='pages/sys/kj/img/shipin.png' alt='' id='img' class="span_img"/>--%>
						<%--</span>--%>
						<%--<label for="thumbnail" class="col-md-3 control-label">点击上传照片</label>--%>
					<%--</div>--%>
					
				</td>
			</tr>
			<tr>
				<td style="width:130px ; border-width:1px;text-align:center" width="120">
					上传附件
				</td>
				<td width="150" style="border-width:1px;" colspan="3">
					<div class="bmxtxzp">
						点击上传附件
						<input type="file" id="bond_disposal_accessory" name="bond_disposal_accessory" value="" >
					</div>
					
				<!-- 	
					<c:if test="${not empty FileName}">
						<div>
							${FileName}<a style="cursor:pointer;"href="bond/disposal/download?bond_disposal_accessory=${bondDisposal.bond_disposal_accessory}" class="btn btn-social-icon btn-primary btn-xs">下载</a>
						</div>
					</c:if>
				-->	
				</td>
			</tr>
		      
		</table>					
	</div>
     <div class="mt10">
		 <input class="publishtj" type='submit' value='提交修改'/>
     </div>
     
     
     </c:otherwise>
     
     
     </c:choose>
     
     
	</div>			 
	</div>
<div class="clear"></div>
	</form>
</div>
<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
<!-- bootstrap datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- 债券类型与委外数量 -->
<script type="text/javascript">
	$(function(){
		$("#bond_deal").change(function(){
			if($("#bond_deal").val()==2){
				$("#bond_case").removeAttr("disabled");
			}else if($("#bond_deal").val()==1){
				$("#bond_case").attr("disabled",'disabled');
			}
			
		});
		var ratio = $("#bond_transfer_ratio").val();
		
		if(ratio.toString().indexOf("%")!= "-1"){
			 $("#bond_transfer_ratio").val(ratio.toString().replace("%",""));
		}
		
	});
</script>
<!-- 判断提交时的数据是否为空 -->
<script type="text/javascript">
	function check(){
		if($("#bond_location").val()==""){
			alert("请选择地址！");
			return false;
		}
		return true;
	}
	function img2(){
			var r= new FileReader();
			f=$("#disposal").find("#bond_disposal_img").get(0).files[0]
			r.readAsDataURL(f);
			r.onload=function  (e) {
				$("#disposal").find("#image2").attr("src",this.result);
			}
		}
</script>
<!-- 修改时全国的债务人的地址 -->
<script type="text/javascript">
	$(function(){
		$("#bond_debt_site").change(function(){
			var bond_site = $("#bond_debt_site").find("option:selected").text();
			var bond_site_pid = $("#bond_debt_site").val();
			//console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				//console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#bond_debt_location");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
			
		});
		$("#bond_debt_location").change(function(){
			var location_name = $("#bond_debt_location").find("option:selected").text();
			var location_id = $("#bond_debt_location").val();
			//console.log("name:"+location_name+",id:"+location_id);
			//console.log("地址栏："+$("#bond_debt_location").val());
		});
		
	})
	
</script>
<!-- 修改时全国的债权人的地址 -->
<script type="text/javascript">
	$(function(){
		$("#bond_site").change(function(){
			var bond_site = $("#bond_site").find("option:selected").text();
			var bond_site_pid = $("#bond_site").val();
			//console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				//console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#bond_location");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
			
		});
		$("#bond_location").change(function(){
			
			var location_name = $("#bond_location").find("option:selected").text();
			var location_id = $("#bond_location").val();
			//console.log("name:"+location_name+",id:"+location_id);
			//console.log("地址栏："+$("#bond_location").val());
		});
		
	})
	
</script>
<!-- 全国的债权人的地址 -->
<script type="text/javascript">
	$(function(){
		$("#bond_site").change(function(){
			var bond_site = $("#bond_site").find("option:selected").text();
			var bond_site_pid = $("#bond_site").val();
			//console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				//console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#bond_location");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
		});
		$("#bond_location").change(function(){
			
			var location_name = $("#bond_location").find("option:selected").text();
			var location_id = $("#bond_location").val();
			//console.log("name:"+location_name+",id:"+location_id);
			//console.log("地址栏："+$("#bond_location").val());
		});
		
	})
</script>
<!-- 全国的债务人的地址 -->
<script type="text/javascript">
	$(function(){
		$("#bond_debt_site").change(function(){
			var bond_site = $("#bond_debt_site").find("option:selected").text();
			var bond_site_pid = $("#bond_debt_site").val();
			//console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				//console.log(JSON.stringify(map.resultObj.varList));
				var varList = map.resultObj.varList
				var select = $("#bond_debt_location");
				select.empty(); 
				select.append('<option value="">请选择城市</option>');
				for(var i in varList){
					var bond_site_id = varList[i].bond_site_id;
					var bond_location_name =varList[i].bond_location_name;
					select.append('<option value="'+bond_site_id+'">'+bond_location_name+'</option>');  
				}
			});
		});
		$("#bond_debt_location").change(function(){
			
			var location_name = $("#bond_debt_location").find("option:selected").text();
			var location_id = $("#bond_debt_location").val();
			//console.log("name:"+location_name+",id:"+location_id);
			//console.log("地址栏："+$("#bond_location").val());
		});
		
	})
</script>

<script type="text/javascript">
	//Date picker
	$('.datepicker').datepicker({
		format: 'yyyy-mm-dd',
		autoclose: true
	});
	//实例化编辑器
	//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	//var ue = UE.getEditor('auction_project_announcement');
</script>
</body>
</html>