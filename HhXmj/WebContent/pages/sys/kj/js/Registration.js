//上传图片
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
   var file_img=document.getElementById("img"),
  iptfileupload = document.getElementById('iptfileupload') ;
  getPath(file_img,iptfileupload,file_img) ;
 }
//转让方
var user=document.getElementById("user");
    user.onblur=function(){
        if(user.value){
            user.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(user.validity.valueMissing){
            user.setCustomValidity("转让方名称不能为空");  
        };        
    };
    //企业性质
var sushuhangye=document.getElementById("sushuhangye");
    sushuhangye.onblur=function(){
        if(sushuhangye.value){
            sushuhangye.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(sushuhangye.validity.valueMissing){
            sushuhangye.setCustomValidity("企业性质能为空");  
        };        
    };
     
    //  联系人
    var Contacts=document.getElementById("Contacts");
    Contacts.onblur=function(){
        if(Contacts.value){
            Contacts.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(Contacts.validity.valueMissing){
            Contacts.setCustomValidity("联系人不能为空");  
        }
    };
    //  联系方式
    var Telephone=document.getElementById("Telephone");
    Telephone.onblur=function(){
        if(Telephone.value){
            Telephone.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(Telephone.validity.valueMissing){
            Telephone.setCustomValidity("联系方式不能为空");  
        }
    };
    //  上传图片
    var iptfileupload=document.getElementById("iptfileupload");
    iptfileupload.onblur=function(){
        if(iptfileupload.value){
            iptfileupload.setCustomValidity("");//现将有输入时的提示设置为空
        }else if(iptfileupload.validity.valueMissing){
            iptfileupload.setCustomValidity("请上传图片");  
        }
    };