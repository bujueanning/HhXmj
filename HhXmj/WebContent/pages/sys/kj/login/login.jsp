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
		        <a href="sys/login/logoutjs" class="btn btn-default btn-flat">退出</a>
	        </c:if>
		    <c:if test="currentUser.sys_user_name">
	        	 <a href="sys/kj/login">登录</a><br/>
	            <a href="sys/kj/goreg">注册</a>
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
	function doPerSonalLogin(){
		window.location.href = '';
	}
	function  returnflag(){
		
		if('${backUrl}'!=""||'${backUrl}'!=null){
			;
		}
	}
</script>



<div class="box_tab">
	<h5>会员登录</h5>
</div>
<div class="box_con">
<div class="login_box">
<div class="login_con fl">	
	<form id="loginForm" name="loginForm" method="post" action="sys/login/dologin">
			<input type="hidden" name="backUrl" value="">
			<input type="hidden" name="qualifyType" value="002001">
			<input type="hidden" name="clientType" value="uc">
			<input type="hidden" name="exchangeId" value="">
			<table class="login-table-1">
			  <tbody>
			  	<tr>
			  		<th>账　号</th>
					  <td>
					    <input type="text" id="sys_user_account" name="sys_user_account" value="账号" onfocus="if(this.value=='账号'){this.value=''; this.style.color='#000000'}" onblur="if(this.value.replace(/\s/g, '')==''){this.value='手机号'; this.style.color='#999999'}" class="inpt" style="width: 200px; color: rgb(153, 153, 153);" maxlength="256" onkeydown="moveToNext('password',event)">
					</td>
				</tr>
			  <tr>
			    <th>密　码</th>
			    <td>
			        <input type="password" id="sys_user_password" name="sys_user_password" value="" class="inpt" style="width:200px;" onselectstart="return false" oncopy="return false" onpaste="return false" onkeydown="moveToNext('checkCode',event)" maxlength="20">
			       	<span id="forget_span" name="forget_span" class="co_r ml10">          	
			       		<a href="forget.html">忘记密码?</a>
          			</span>
			    </td>
		    </tr>
		    <tr>
			  <th>验证码</th>
			  <td>
			  	<input type="text" class="inpt" id="verifyCode" name="verifyCode" style="width:130px;" onkeydown="keyDown(event)" maxlength="5">
				<a href="javascript:changeCheckCode();" class="f12 ml5">
					<img id="verifyCodeImage"  src="sys/login/getVerifyCodeImage"/>
				</a>
			  </td>
			</tr>
			<tr><th></th></tr>
			<tr>
			  <th></th>
			  	<td>
			  		<button onclick="doLogin()" class="button-3 w150" type="button">登 录</button>
			  		&nbsp;&nbsp;
			  		<button onclick="window.location.href='sys/kj/goreg'" class="button-3 w150" type="button">立即注册</button>
			  		&nbsp;&nbsp;								
			  	</td>
			</tr>
		  </tbody>
	</table>
	<p class="tc"></p>    
    </form>
    </div>    
   	<div class="login_infor fr tc">		
		<img src="pages/sys/kj/img/login_pic1.png">
	</div>	
	</div>
	</div>
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
<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/icheck-1.x/icheck.min.js"></script>
<!-- jquery.validity -->
<script src="plugins/validity-master/build/jquery.validity.min.js"></script>
<script src="plugins/validity-master/build/jquery.validity.lang.zh.js"></script>
<!-- jquery-confirm -->
<script src="plugins/jqueryConfirmv2.5.0/dist/jquery-confirm.min.js"></script>
<!--  
<script type="text/javascript">
	$(function(){
		$.post("bond/disposal/kill",{},function(){});
	});
</script>
-->
<script>
  $(function () {
	  $('input').iCheck({
	      checkboxClass: 'icheckbox_square-blue',
	      radioClass: 'iradio_square-blue',
	      increaseArea: '20%' // optional
	    });
	$("#verifyCodeImage").bind("click", changeCode);
  });
  $(document).keyup(function(event) {
		if (event.keyCode == 13) {
		doLogin();
			$("#dologin").trigger("click");
		}
	});
  function changeCode() {  //刷新  
      $('#verifyCodeImage').hide().attr('src', 'sys/login/getVerifyCodeImage?' + Math.floor(Math.random()*100) ).fadeIn();    
      event.cancelBubble=true;    
  }
  function doLogin(){
// 			jQuery("#sys_user_account").val(jQuery.trim(jQuery("#account").val()));
// 			jQuery("#forget_span").html("");
// 			cptpd.submitForm('loginForm');
// 			$("#loginForm").submit();
			
				  $.ajax({
						type: "POST",
						url:$('#loginForm').attr('action'),
						data:$('#loginForm').serialize(),// 你的formid
						cache: false,
						async: false,
						error: function(request) {
							alert("Connection error");
						},
						success: function(data) {
							if(data.resultCode==1){
								window.location.href="sys/kj/index";
							}else{
								alert("信息有误");
// 								$.alert({
// 									content: data.msg,
// 							        confirmButton: true,
// 							        cancelButton: false,
// 							        confirmButton: '确认',
// 							        cancelButton: '取消',
// 							        confirmButtonClass: 'btn-warning',
// 							        cancelButtonClass: 'btn-success',
// 							        animation: 'zoom',
// 							        closeIcon: true,
// 							        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
// 							        title: false, // hides the title.
// 							        backgroundDismiss: false
// 							    });
							}
							
						}
					});
	  
	  
  }
  function register(url,height){
		$.confirm({
			content: "<iframe name='dialogFrame' id='dialogFrame' style='height: "+height+"px;width: 100%;'  src='"+url+"' frameborder='0' ></iframe>",
	        confirmButton: true,
	        cancelButton: true,
	        confirmButton: '确认',
	        cancelButton: '取消',
	        confirmButtonClass: 'btn-info',
	        cancelButtonClass: 'btn-danger',
	        animation: 'zoom',
	        columnClass: 'col-md-12',
	        closeIcon: true,
	        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
	        title: false, // hides the title.
	        backgroundDismiss: false,
	        cancel: function(){
	            //$.alert('canceled');
	        },
	        confirm: function(){
	        	if(self.dialogFrame.validateInputs()){
	        		self.dialogFrame.formSubmit();
	            	return true;
	        	}else{
	        		return false;
	        	}
	        }
	    });
	}
  function validateInputs() {
     $.validity.start();
	 $('#sysUserAccount').require();//帐号
	 $('#sysUserPassword').require();//密码
	 $('#verifyCode').require();//验证码
	 
     var result = $.validity.end();
     return result.valid;
}
</script>
</body>
</html>