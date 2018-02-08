<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css"/>
     <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/login.css"/>
    <script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/main.js"></script>
   <style type="text/css">
        .sitemap{
        	position:absolute;
            bottom:0;
        }
    </style>
</head>
<body>
<div class="top_wrap">
	<!--头部-->
    <div class="top">
       <a href="sys/kj/index"><img src="pages/sys/kj/img/logo9.png" class="fl logo"/></a>
        <img src="pages/sys/kj/img/tel1.jpg" alt="" class="fl tel" />
        <div class="fl links">
        <c:if test="currentUser.sys_user_name">
        	<span class="hidden-xs">${currentUser.sys_user_name}已登陆</span>
	        <a href="sys/login/logout" class="btn btn-default btn-flat">退出</a>
        </c:if>
	    <c:if test="currentUser.sys_user_name">
        	 <c:if test="currentUser.sys_user_name">
	        	<span class="hidden-xs">${currentUser.sys_user_name}已登陆</span>
		        <a href="sys/login/logoutjs" class="btn btn-default btn-flat">退出</a>
	        </c:if>
		    <c:if test="currentUser.sys_user_name">
	        	 <a href="sys/kj/login">登录</a><br/>
	            <a href="sys/kj/goreg">注册</a>
	        </c:if>
        </c:if>
            
        </div>
        <div class="fr search">
            <form name="formT" id="formT" method="post" target="_blank" action="http://www.dfham.com/infoseek/search">
                <input class="input inputFocus" type="text" name="inputSearchQuery" id="inputSearchQueryT" maxlength="12"/>
                <input type="hidden" name="service" value="direct/0/Home/searchForm"/>
                <input type="hidden" name="sp" value="S0"/>
                <input type="hidden" name="Form0" value="category,inputSearchQuery,$Submit"/>
                <input type="hidden" name="category" value="-1"/>
                <input type="submit" value="" class="btn_search hand" />
            </form>
        </div>
    </div>
</div>
<!--导航-->
<div class="w1000 bc mt10">
    			<div class="clear"></div>
    			<div class="clear"></div>
    			<div class="box">




<script type="text/javascript">

function checkName(){
	var myreg=/((?=[\x21-\x7e]+)[^A-Za-z0-9])/
	if(myreg.test($("#sys_user_name").val())||$("#sys_user_name").val()==""||$("#sys_user_name").val()==null){
		$("#partFullName_special").show();
	}else{
		$("#partFullName_special").hide();
	}
	
}
function confirmPass(){
	var confirmPass = $("#confirm_password").val();
	var pass = $("#sys_user_password").val();
	if(confirmPass != pass ){
		$("#confirm_password_check").show();
	}else{
		$("#confirm_password_check").hide();
	}	
}
function checkPhone(){
	var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;  
    if (!myreg.test($("#sys_user_account").val())) {  
    	$("#cellPhone_check").show();
    }else{
    	$("#cellPhone_check").hide();
    }   
	
}
function checkPass(){
	
	var myreg=/(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{6,12}/;  
    if (!myreg.test($("#sys_user_password").val())) {  
    	$("#password_check").show();
    }else{
    	$("#password_check").hide();
    }   
	
}

function checkOrg(){
	debugger
	var org_id =/^[0-9]{18}|[0-9A-Z]{18}$/;  
	var sys_org = $("#sys_org_id").val();
		if(!org_id.test(sys_org)){
			$("#orgCode_check").show();
		}else{
			$("#orgCode_check").hide();
		}
}



</script>

<script>

 
jQuery(function(){
	  			//刷新图形验证码
			});
	
  
  function doSubmit() {
	  debugger
  	if(!$("#accept").attr("checked")) {
  		alert("请先同意注册协议！");
		return false;
	}
        if(!isAgreementChked()) {
		alert("请先同意注册协议！");
		return;
	}
        var myregPhone=/^[1][3,4,5,7,8][0-9]{9}$/;  
        if (!myregPhone.test($("#sys_user_account").val())) {  
        	$("#cellPhone_check").show();
        	alert("请完善信息");
        	return false;
        }
        var myregPass=/(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{6,12}/;  
        if (!myregPass.test($("#sys_user_password").val())) {  
        	$("#password_check").show();
        	alert("请完善信息");
        	return false;
        }
        var confirmPass = $("#confirm_password").val();
    	var pass = $("#sys_user_password").val();
    	if(confirmPass != pass ){
    		$("#confirm_password_check").show();
    		alert("请完善信息");
        	return false;
    	}
    	var myregName=/((?=[\x21-\x7e]+)[^A-Za-z0-9])/
   		if(myregName.test($("#sys_user_name").val())||$("#sys_user_name").val()==""||$("#sys_user_name").val()==null){
   			$("#partFullName_special").show();
   			alert("请完善信息");
   			return false;
   		}
    	var rad = $("input:radio[name='sys_user_reg_type_d']:checked").val();
    	if( rad == null){
    		alert("请选择一个用户类型");
    		return false;
    	}
    	var location = $("#sys_area_id").val();
		if( location == null || location== ""){
			alert("请填写地址！");
			return false;
		}
		
		var org_id =/^[0-9]{18}|[0-9A-Z]{18}$/;  
		var sys_org = $("#sys_org_id").val();
			if(!org_id.test(sys_org)){
				$("#orgCode_check").show();
				alert("请完善信息");
				return false;
			}
		
// 			    	    
        $.ajax({
			type: "POST",
			url:$('#regForm').attr('action'),
			data:$('#regForm').serialize(),// 你的formid
			cache: false,
			async: false,
			error: function(request) {
				alert("信息有误");
			},
			success: function(data) {
				if(data.resultCode==1){
					window.location.href='sys/kj/index';
					alert("注册成功");
					
				}else{
					alert(data.resultMsg);
				}
			}
		});
  }


  function checkEncryptCertNo(certNo) {
      var res = false;
      jQuery.ajax({
          data:{certNo:certNo},
          url: appServer +"/user/check/certNoIsUnique.json",
          dataType:"json",
          async:false,
          success : function(data) {
              if(data){
                  //alert("手机号码不能重复");
              }else{
                  res = true;
              }
          },
          error : function() {
              alert("请检查身份证号后，重试！");
          }
      });
      return res;
  }

  
  function doSafeSubmit(obj) {
    	$(obj).attr("disabled","disabled");
    	
    	if(isSubmitEnabled) {
    	isSubmitEnabled = false;
    		if(doSubmit()) {
    			isSubmitEnabled = false;
    		} else {
    			isSubmitEnabled = true;
    			$(obj).removeAttr("disabled");
    		}
    	} else{
    		alert("不要重复提交表单！");
    	}
    }
  
  function isAgreementChked() {
    return jQuery("#accept").attr("checked");
  }
  
  function viewAgreement() {
	$("#agree_open_bid").dialog("open");
  }
  
  $(function(){
      $("#parentAgentUser").removeAttr("readonly");
	  $("#parentAgentUser").attr("maxlength","20");
    })
    
  function sendCodeReg(obj){
    var formId = $("#formId").val();
    if(!checkAttr(formId,'cellPhone','Y','Y','^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1})|(14[0-9]{1}))+\\d{8})$','','','add','cellPhone','50')) {
    	 alert('请输入正确的移动电话号码再发送验证码');
         return false;
    }
    var password = jQuery.trim($("#password").val());
    if(password==''||password==null){
    	alert('请输入注册信息再发送验证码');
        return false;
    }
    	var conPassword = jQuery.trim($("#confirm_password").val());
    if(conPassword==''||conPassword==null){
    	alert('请输入注册信息再发送验证码');
        return false;
    }
    
	    var mobile = jQuery.trim($("#cellPhone").val());
    var exchangeId = jQuery.trim($("#exchangeId").val());
    if(exchangeId==''||exchangeId==null){
    	exchangeId=0;
    }
    
     popcheckcode();
}

</script>

<!-- 全国的地址 -->
<script type="text/javascript">
	$(function(){
			$.post("bond/site/listjson",{"bond_site":"0"},function(map){
				//console.log(JSON.stringify(map));
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
	});

	$(function(){
		$("#bond_site").change(function(){
			var bond_site = $("#bond_site").find("option:selected").text();
			var bond_site_pid = $("#bond_site").val();
			//console.log(bond_site+","+bond_site_pid);
			$.post("bond/site/listjson",{"bond_site":bond_site_pid},function(map){
				//console.log(JSON.stringify(map.resultObj.varList));
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
	})
</script>
<div class="w1000 bc mt10">
	<div class="box">
		<div class="box_tab">
			<h5>新用户注册</h5>
			<h2 style="float: right;"><a href="sys/kj/index">返回 </a>></h2>
		</div>
		<div class="box_con">
			<div class="login_box">
				<div class="regbox-wrap">
					<div class="reg-content mt50">
					<form id="regForm" name="regForm" action="sys/login/savereg" method="post">					
						<table style="width:520px;" class="reg-table-1">
						<tbody>
							<tr>   
								<th valign="top" nowrap="nowrap" style="width:22%;" class="tt">机构全称：</th>
								<td>
								<input id="sys_user_id" name="sys_user_id" type="hidden" value=""></input>
								<input id="sys_user_name" name="sys_user_name" placeholder="请输入10位以内不含特殊字符的名称" onblur="checkName();" class="inpt w200" maxlength="100" style="width:100;" type="text" required><span style="color:red">*&nbsp;</span><span id="partFullName_required" style="display:none;color:red;">不能为空</span><span id="partFullName_maxlength" style="display:none;color:red;">机构全称长度超长</span><span id="partFullName_special" style="display:none;color:red;">用户名不能为空或含有特殊字符</span>							
								</td>             
							</tr>
							
							<tr>
								<th valign="top" nowrap="nowrap" style="width:22%;" class="tt">公司地址：</th>
								<td>	              
	                  <div class="row">
	                    <div class="col-md-8">
	                        <div class="form-group">
	                            <div class="col-sm-10">
	                            	<!-- 省 -->
	                                <select class="inpt w200" id="bond_site"
	                                        name="bond_site" style="float: left;">
	                                        
	                                </select><span style="color:red">*&nbsp;</span>
	                                	<!-- 市 -->
		                                <select class="inpt w200" id="sys_area_id"
		                                        name="sys_area_id" style="float: left;">
		                                    
		                                            <option value="">
		                                                   请选择城市
		                                            </option>
		                                       
		                                </select><span style="color:red">*&nbsp;</span>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	              </td>
							</tr>
						<tr>
							<th valign="top" nowrap="nowrap" style="width:22%;" class="tt">登录密码：</th>
							<td>
							<input id="sys_user_password" name="sys_user_password" onblur="checkPass();" placeholder="6-12位数字与字母的组合" class="inpt w200" maxlength="16" style="width:64" type="password" onselectstart="return false" oncopy="return false" onpaste="return false" required><span style="color:red">*&nbsp;</span><span id="password_required" style="display:none;color:red;">登录密码不能为空</span><span id="password_check" style="display:none;color:red;">请输入6~16位字符，至少包含数字、字母（区分大小写）、符号中的2种。</span><span id="password_maxlength" style="display:none;color:red;">登录密码长度超长</span>
							</td>
						</tr>
						<tr>
							<th>确认密码：</th>
							<td>
							<input id="confirm_password" name="confirm_password" class="inpt w200" maxlength="16" style="width:64" onblur="confirmPass();" placeholder="确认登录密码" type="password" onselectstart="return false" oncopy="return false" onpaste="return false" required><span style="color:red">*&nbsp;</span><span id="confirm_password_check" style="display:none;color:red;">两次输入的密码不相同</span>							
							</td>             
						</tr>
						<tr>
							<th valign="top" nowrap="nowrap" style="width:22%;" class="tt">组织机构代码：</th>
							<td>
								<input id="sys_org_id" name="sys_org_id"  onblur="checkOrg();"class="inpt w200" maxlength="36" style="width:36;"placeholder="18位的阿拉伯数字或大写英文字母" type="text" title="组织机构代码由18位的阿拉伯数字或大写英文字母" required><span style="color:red">*&nbsp;</span><span id="orgCode_unique" style="display:none;color:red;">组织机构代码不能重复</span><span id="orgCode_required" style="display:none;color:red;">不能为空</span><span id="orgCode_check" style="display:none;color:red;">组织机构代码由18位的阿拉伯数字或大写英文字母</span><span id="orgCode_maxlength" style="display:none;color:red;">组织机构代码长度超长</span>							
							</td>             
						</tr>
						<tr>
							<th valign="top" nowrap="nowrap" class="tt" style="    height: 20px;">&nbsp;</th>
							<td style="text-align: left;">
								<input name="sys_user_reg_type_d" type="radio" value="a77fda4f171f45f1b089f0dd18221e22" style="float: none;"/>发布方
								<input name="sys_user_reg_type_d" type="radio" value="37b73a43f23a42edb6bef45a96628217" style="float: none;"/>处置方 
							</td>	
						</tr>
						
						<tr>      
							<th valign="top" nowrap="nowrap" style="width:22%;" class="tt">手机号：</th>
							<td>
								<input id="sys_user_account" name="sys_user_account" placeholder="请写入合法的手机号" onblur="checkPhone()" class="inpt w200" maxlength="50" type="text" required><span style="color:red" >*&nbsp;</span><span id="cellPhone_unique" style="display:none;color:red;">手机号不能重复</span><span id="cellPhone_required" style="display:none;color:red;">手机号不能为空</span><span id="cellPhone_check" style="display:none;color:red;">手机号不符合规则</span><span id="cellPhone_maxlength" style="display:none;color:red;">手机号长度超长</span>						<span id="cellPhone_unique" style="display:none;color:red;">手机号不能重复</span>
													
							</td>             
						</tr>
<!-- 						<tr height="40"> -->
<!-- 							<th valign="top" nowrap="nowrap" class="tt">验证码：</th> -->
<!-- 							<td> -->
<!-- 								<input type="text" class="inpt" id="checkCode" name="checkCode" style="width:130px;" maxlength="5"> -->
<!-- 								<a href="javascript:changeCheckCode();" class="f12 ml5" style="float: left;"> -->
<!-- 									<img id="picChkImg" src="https://tradereg.tjfae.com/checkcode/regpic.htm?t=" width="80" height="24"> -->
<!-- 								</a> -->
<!-- 							</td> -->
							
<!-- 						</tr> -->
						
						<tr>
							<td colspan="3">我已阅读并接受：
								<input id="accept" name="checkbox" type="checkbox"  style="float: none;">
								<a href="javascript:void(0)" onclick="viewAgreement()" style="color:#0044DD;cursor:pointer;">《鑫淼聚资产注册用户协议》</a>
							</td>
						</tr>
						<tr>
							<th></th>
							<td colspan="2">
								 <div id="submitBtn"><button class="button-3 w200" type="button" onclick="doSubmit()">立即注册</button></div>
								 <div id="submitTxt" style="display:none;color:red;">提交中,请稍后pages/sys/kj.</div>
							</td>
							<td valign="top" id="message"></td>
						</tr>
						</tbody>
						</table>
								<script>
						            var checkData = {unGroupData:[{formId:'91',attrKey:'partFullName',isRequired:'Y',isUnique:'N',checkRule:'',isEdit:'Y',isAdd:'null',type:'text',canExtended:'2',maxlength:'100'},{formId:'91',attrKey:'password',isRequired:'Y',isUnique:'N',checkRule:'(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{6,16}$',isEdit:'Y',isAdd:'null',type:'pwd',canExtended:'2',maxlength:'16'},{formId:'91',attrKey:'orgCode',isRequired:'Y',isUnique:'Y',checkRule:'^([A-Z]|[a-z]|[\\d]|[-])*$',isEdit:'Y',isAdd:'null',type:'text',canExtended:'2',maxlength:'36'},{formId:'91',attrKey:'channel',isRequired:'Y',isUnique:'N',checkRule:'',isEdit:'Y',isAdd:'null',type:'select',canExtended:'2',maxlength:'100'},{formId:'91',attrKey:'cellPhone',isRequired:'Y',isUnique:'Y',checkRule:'^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\\d{8})$',isEdit:'Y',isAdd:'null',type:'text',canExtended:'2',maxlength:'50'}],groupData:''};
						        </script>
						</form>
						</div>
				</div>
			</div>
		</div>
	</div>
 </div>
<div class="clear"></div>
<script>
	//jQuery UI对话框渲染
	function renderDialog(title, content, width, height, yesFn, noFn) {
		//弹出确认框的初始化
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
		if(!isInitDialog()) {
			$( "#dial_open_bid" ).dialog( "open" );
			return;
		}
		
		jQuery("#dial_open_bid").attr("title", title);
		jQuery("#dialogContent").empty();
		jQuery("#dialogContent").append(content);
		var dialogSetting = {
			resizable: true,
			width:width != null ? width : 380,
			height:height != null ? height : 320,
			modal: true,
			buttons: {
				"确定": function() {
					//点击确定后的回调函数
					if(yesFn != null) {
						if(!yesFn()) {
							return;
						}
					}
					$( this ).dialog( "close" );
				},
				"取消": function() {
					//点击取消后的回调函数
					if(noFn != null) {
						if(!noFn()) {
							return;
						}
					}
					$( this ).dialog( "close" );
				}
			}
		};
		$("#dial_open_bid").dialog(dialogSetting);
	}
	
	function isInitDialog() {
		return jQuery.trim(jQuery("#dialogContent").html()) == "";
	}

	jQuery(function(){
		//弹出确认框的初始化
		//$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
	})
</script>
<div class="dialog_bid" id="dial_open_bid" title="defaultTitle" style="display:none">
  <input type="hidden" id="currHiddenAttrId">
  <div class="searchBox" id="dialogContent" style="border:none;background:none;">
  </div>
</div>
</div>
<div class="clear"></div>
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
</body>
</html>