
//名称
var partFullName=document.getElementById("partFullName");
    partFullName.onblur=function(){
        if(partFullName.value){
            partFullName.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(partFullName.validity.valueMissing){
            partFullName.setCustomValidity("名称不能为空");  
        };        
    };
    //登录密码
var passwords=document.getElementById("passwords");
    passwords.onblur=function(){
        if(passwords.value){
            passwords.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(passwords.validity.valueMissing){
            passwords.setCustomValidity("6~10 位数字母、数字");  
        };        
    };
     //所在地
var phone=document.getElementById("phone");
    phone.onblur=function(){
        if(phone.value){
            phone.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(phone.validity.valueMissing){
            phone.setCustomValidity("请输入正确的手机号");  
        };        
    };
//  项目金额
    var marny=document.getElementById("marny");
    marny.onblur=function(){
        if(marny.value){
            marny.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(marny.validity.valueMissing){
            marny.setCustomValidity("金额不能为空");  
        };
        if(marny.validity.patternMismatch){ 
            marny.setCustomValidity("只能输入正数字且首数字不能为0");
        }
    };
    //  挂牌数量
    var shares=document.getElementById("shares");
    shares.onblur=function(){
        if(shares.value){
            shares.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(shares.validity.valueMissing){
            shares.setCustomValidity("挂牌数量不能为空");  
        };
        if(shares.validity.patternMismatch){ 
            shares.setCustomValidity("只能输入正数字且首数字不能为0");
        }
    };
    
   


  
  function doSubmit() {
  	if(!$("#accept").attr("checked")) {
  		alert("请先同意注册协议！");
		return false;
	}
        if(!isAgreementChked()) {
		alert("请先同意注册协议！");
		return;
	}
	
