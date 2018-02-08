<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>鑫淼聚不良资产后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="dist/css/login.style.css">
</head>
<body>

<div id="content">
    <div class="login-header">
        <img src="dist/img/logon_1.jpg">
    </div>
    <form id="loginForm" action="sys/login/dologin" method="post">
        <div class="login-input-box">
            <span class="icon icon-user"></span>
            <input id="sys_user_account" name="sys_user_account" type="text" class="form-control" placeholder="帐号" title="帐号">
        </div>
        <div class="login-input-box">
            <span class="icon icon-password"></span>
            <input id="sys_user_password" name="sys_user_password" type="password" class="form-control" placeholder="密码" title="密码">
        </div>
    
    <div class="login-input-yz">
      	<div class="row">
        <div class="div-inline">
        	<input id="verifyCode" name="verifyCode" type="text"  class="form-control" placeholder="请输入验证码" title="验证码"/>
            
        </div>
        <div class="div-inline">
        	<img id="verifyCodeImage"  src="sys/login/getVerifyCodeImage"/>
        </div>
      </div>
	  </div>
    <div class="login-button-box">
        <button id="dologin" type="button" class="btn btn-primary btn-block btn-flat" onclick="doLogin();">登陆</button>
    </div>
    </form>
</div>


<!-- /.login-box -->

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
	  if(validateInputs()){
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
						window.location.href="sys/login/index";
					}else{
						$.alert({
							content: data.msg,
					        confirmButton: true,
					        cancelButton: false,
					        confirmButton: '确认',
					        cancelButton: '取消',
					        confirmButtonClass: 'btn-warning',
					        cancelButtonClass: 'btn-success',
					        animation: 'zoom',
					        closeIcon: true,
					        closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
					        title: false, // hides the title.
					        backgroundDismiss: false
					    });
					}
					
				}
			});
	  }
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
