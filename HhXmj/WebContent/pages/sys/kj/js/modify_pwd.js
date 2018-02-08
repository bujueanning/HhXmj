var checkData = null;

function checkOldPwd(){
	jQuery("#oldPwd_tip").hide();
	var oldPwd = jQuery("#oldPwd").val();
	if(oldPwd == ""){
		jQuery("#oldPwd_span").html("");
		return true;
	}else {
		//ajax获取校验数据后的解析并校验
		/*if(checkData != null) {
			var checkRule = checkData.checkRule;
			if(checkRule != null) {
				var regex = eval("/"+checkRule+"/");
				if(!regex.test(oldPwd)) {
					jQuery("#oldPwd_span").html("&nbsp;&nbsp;"+checkData.checkRuleTips);
					return false;
				}
			}
		}*/
	}
	jQuery("#oldPwd_span").html("");
	return true;
}
function checkPassword(){
	jQuery("#password_tip").hide();
	var password = jQuery("#password").val();
	if(password == ""){
		jQuery("#password_span").html("*&nbsp;&nbsp;请输入新密码");
		return false;
	} else {
		//ajax获取校验数据后的解析并校验
		if(checkData != null) {
			var checkRule = checkData.checkRule;
			if(checkRule != null) {
				var regex = eval("/"+checkRule+"/");
				if(!regex.test(password)) {
					jQuery("#password_span").html("*&nbsp;&nbsp;"+checkData.checkRuleTips);
					return false;
				}
			}
		}	
		if(password == jQuery("#oldPwd").val()){
			jQuery("#password_span").html("*&nbsp;&nbsp;新密码必须和原密码不同");
			return false;
		}
		
	}
	jQuery("#password_span").html("*");
	return true;
}

function checkConfirmPwd(){
	jQuery("#confirmPwd_tip").hide();
	if(jQuery("#confirmPwd").val() == ""){
		jQuery("#confirmPwd_span").html("*&nbsp;&nbsp;请输入确认密码");
		return false;
	}else if(jQuery("#password").val() != jQuery("#confirmPwd").val()){
		jQuery("#confirmPwd_span").html("*&nbsp;&nbsp;新密码与确认密码不一致");
		return false;
	}
	jQuery("#confirmPwd_span").html("*");
	return true;
}

function doSubmit(){
	avoidDuplicateSubmit();
	hideTips();
	var flag = true;
	if(!checkPassword()) {
		flag = false;
	}
	if(!checkConfirmPwd()) {
		flag = false;
	}
	if(flag){
		doOpen();
	} else {
		enableSubmit(); //校验不通过，再允许提交
	}
}

function doOpen() {
	$( "#dialog-confirm" ).dialog( "open" );
 }
 


 //获得修改密码的信息
 function getPwdInfo() {
 	var attrKey = "password";
 	var formId = "";
 	jQuery.ajax({
		type : 'POST',
   	 	url : "",		
		data:{attrKey:attrKey, formId:formId, userId:"3580"},
		async:false,
   	 	success : function(data) {
			//data = eval("("+data+")");
			if(data != null && data != "") {
				checkData = data;
				if(checkData != null) {
					var maxLength = checkData.maxLength;
					if(maxLength != null) {
						jQuery("#oldPwd").attr("maxLength", maxLength);
						jQuery("#password").attr("maxLength", maxLength);
					}
					var tips = checkData.tips;
					if(tips != null) {
						jQuery("#password_tip").html(tips);
					}
					jQuery("#attrId").val(checkData.id);
					//增加隐藏与否
					if(data.attrValue == "0") {
					    $("#dialog-confirm").dialog({title: "设置密码确认"});
						$("#dialog-confirm")[0].innerText = "您是否确认设置支付密码";
					    						jQuery("#oldPwdTr").hide();
						jQuery("#tipsRow").show();
						jQuery("#submitBtn").val("设置");
					} else {
					    $("#dialog-confirm").dialog({title: "修改密码确认"});
						$("#dialog-confirm")[0].innerText = "您是否确认修改";
						jQuery("#oldPwdTr").show();
						jQuery("#tipsRow").hide();
						jQuery("#submitBtn").val("修改");
						//当前密码类型
						if(attrKey == "payPwd") {
							jQuery("#forget_pay_tip").show();
						} else {
							jQuery("#forget_pay_tip").hide();
						}
					}
				}
			} 
   	 	},
		error : function() {
			alert("网络异常");
		}
	});

	//清除提示信息
	jQuery("#oldPwd").val("");
	jQuery("#password").val("");
	jQuery("#confirmPwd").val("");
	jQuery("#oldPwd_span").html("");
	jQuery("#password_span").html("*");
	jQuery("#confirmPwd_span").html("*");
 }
 
 function hideTips() {
 	jQuery("#oldPwd_tip").hide();
	jQuery("#password_tip").hide();
	jQuery("#confirmPwd_tip").hide();
 }
 
 function avoidDuplicateSubmit() {
	jQuery("#submitBtn").attr("style", "color:gray");
	jQuery("#submitBtn").unbind("click");
}

function enableSubmit() {
	document.getElementById("submitBtn").removeAttribute("style");
	jQuery("#submitBtn").bind("click", function(){
		doSubmit();
	})
}
