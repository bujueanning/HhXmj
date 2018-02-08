// 身份证正面
 function getPath(obj,fileQuery,transImg) {
 
  var imgSrc = '', imgArr = [], strSrc = '' ;
 
  if(window.navigator.userAgent.indexOf("MSIE")>=1){ // IE浏览器判断
  if(obj.select){
   obj.select();
   var path=document.selection.createRange().text;
   alert(path) ;
   obj.removeAttribute("src");
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src",transImg);
   obj.style.filter=
    "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+path+"', sizingMethod='scale');"; // IE通过滤镜的方式实现图片显示
   }else{
   //try{
   throw new Error('File type Error! please image file upload..'); 
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
  }else{
   // alert(fileQuery.value) ;
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.src = fileQuery.value ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
  }
 
  } else{
  var file =fileQuery.files[0];
  var reader = new FileReader();
  reader.onload = function(e){
 
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src", e.target.result) ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
   // alert(e.target.result); 
  }
  reader.readAsDataURL(file);
  }
 }
 
 function show(){
   var file_img=document.getElementById("sfzimg"),
  iptfileupload = document.getElementById('iptfileupload') ;
  getPath(file_img,iptfileupload,file_img) ;
 }
// 身份证反面
 function getPath(obj,fileQuery,transImg) {
 
  var imgSrc = '', imgArr = [], strSrc = '' ;
 
  if(window.navigator.userAgent.indexOf("MSIE")>=1){ // IE浏览器判断
  if(obj.select){
   obj.select();
   var path=document.selection.createRange().text;
   alert(path) ;
   obj.removeAttribute("src");
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src",transImg);
   obj.style.filter=
    "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+path+"', sizingMethod='scale');"; // IE通过滤镜的方式实现图片显示
   }else{
   //try{
   throw new Error('File type Error! please image file upload..'); 
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
  }else{
   // alert(fileQuery.value) ;
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.src = fileQuery.value ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
  }
 
  } else{
  var file =fileQuery.files[0];
  var reader = new FileReader();
  reader.onload = function(e){
 
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src", e.target.result) ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
   // alert(e.target.result); 
  }
  reader.readAsDataURL(file);
  }
 }
 
 function show2(){
  var file_imgs=document.getElementById("sfzfmimg"),
  sfzfmimgupload = document.getElementById('sfzfmimgupload') ;
  getPath(file_imgs,sfzfmimgupload,file_imgs) ;
 }
 // 营业执照
 function getPath(obj,fileQuery,transImg) {
 
  var imgSrc = '', imgArr = [], strSrc = '' ;
 
  if(window.navigator.userAgent.indexOf("MSIE")>=1){ // IE浏览器判断
  if(obj.select){
   obj.select();
   var path=document.selection.createRange().text;
   alert(path) ;
   obj.removeAttribute("src");
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src",transImg);
   obj.style.filter=
    "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+path+"', sizingMethod='scale');"; // IE通过滤镜的方式实现图片显示
   }else{
   //try{
   throw new Error('File type Error! please image file upload..'); 
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
  }else{
   // alert(fileQuery.value) ;
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.src = fileQuery.value ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
  }
 
  } else{
  var file =fileQuery.files[0];
  var reader = new FileReader();
  reader.onload = function(e){
 
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src", e.target.result) ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
   // alert(e.target.result); 
  }
  reader.readAsDataURL(file);
  }
 }
 
 function show3(){
  var file_imgyz=document.getElementById("yingyeimg"),
  yingyeimgupload = document.getElementById('yingyeimgupload') ;
  getPath(file_imgyz,yingyeimgupload,file_imgyz) ;
 }
 
// 会员合同
 function getPath(obj,fileQuery,transImg) {
 
  var imgSrc = '', imgArr = [], strSrc = '' ;
 
  if(window.navigator.userAgent.indexOf("MSIE")>=1){ // IE浏览器判断
  if(obj.select){
   obj.select();
   var path=document.selection.createRange().text;
   alert(path) ;
   obj.removeAttribute("src");
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src",transImg);
   obj.style.filter=
    "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+path+"', sizingMethod='scale');"; // IE通过滤镜的方式实现图片显示
   }else{
   //try{
   throw new Error('File type Error! please image file upload..'); 
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
  }else{
   // alert(fileQuery.value) ;
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.src = fileQuery.value ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
  }
 
  } else{
  var file =fileQuery.files[0];
  var reader = new FileReader();
  reader.onload = function(e){
 
   imgSrc = fileQuery.value ;
   imgArr = imgSrc.split('.') ;
   strSrc = imgArr[imgArr.length - 1].toLowerCase() ;
   if(strSrc.localeCompare('jpg') === 0 || strSrc.localeCompare('jpeg') === 0 || strSrc.localeCompare('gif') === 0 || strSrc.localeCompare('png') === 0){
   obj.setAttribute("src", e.target.result) ;
   }else{
   //try{
   throw new Error('File type Error! please image file upload..') ;
   //}catch(e){
   // alert('name: ' + e.name + 'message: ' + e.message) ;
   //}
   }
 
   // alert(e.target.result); 
  }
  reader.readAsDataURL(file);
  }
 }
 
 function show4(){
  var file_imghy=document.getElementById("huiyimg"),
  huiyimgupload = document.getElementById('huiyimgupload') ;
  getPath(file_imghy,huiyimgupload,file_imghy) ;
 }


 	//资产处置tab
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
//资产处置tab

//资产委外tab
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
		url:"",
		success:function(data){
			$("#delegationFailedTable tr td").remove();
			$("#delegationFailedTable").append(data);
		}
	});
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


	$('#addUser').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").show();
  		$("#modify_ped").hide();
  		$("#my_infomation").hide();
  		$("#my_transaction").hide();
  		$("#my_asset").hide();
    });
	$('#modify_pwd').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").show();
  		$("#my_infomation").hide();
  		$("#my_transaction").hide();
  		$("#my_asset").hide();
    });
    $('#infomation').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").hide();
  		$("#my_infomation").show();
  		$("#my_transaction").hide();
  		$("#my_asset").hide();
    });
    $('#transaction').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").hide();
  		$("#my_infomation").hide();
  		$("#my_transaction").show();
  		$("#my_asset").hide();
    });
       $('#asset').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#addUserInfo").hide();
  		$("#modify_ped").hide();
  		$("#my_infomation").hide();
  		$("#my_transaction").hide();
  		$("#my_asset").show();
  		$("#jbxgk").hide();
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
    

//姓名
var user=document.getElementById("user");
    user.onblur=function(){
        if(user.value){
            user.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(user.validity.valueMissing){
            user.setCustomValidity("姓名不能为空");  
        };        
    };
    //  身份证
    var shenfenz=document.getElementById("shenfenz");
    shenfenz.onblur=function(){
        if(shenfenz.value){
            shenfenz.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(shenfenz.validity.valueMissing){
            shenfenz.setCustomValidity("身份证");  
        };
       
    };
    //公司名称
var gs_name=document.getElementById("gs_name");
    gs_name.onblur=function(){
        if(gs_name.value){
            gs_name.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(gs_name.validity.valueMissing){
            gs_name.setCustomValidity("公司名称不能为空");  
        };        
    };
    //社会信用代码
var gs_name=document.getElementById("gs_name");
    gs_name.onblur=function(){
        if(gs_name.value){
            gs_name.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(gs_name.validity.valueMissing){
            gs_name.setCustomValidity("社会信用代码不能为空");  
        };        
    };