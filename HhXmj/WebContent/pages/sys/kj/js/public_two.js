$(document).ready(function () { 
		//	尾部
           var x='<div class="sitemap">'+
				    '<div class="sitemap_c">'+
				  		'<div class="foot-box clearfix">'+
							'<p class="a-box">'+
								'<a href="javascript:void(0);" >客户中心</a> |'+
								'<a href="javascript:void(0);">关于我们</a> |'+
								'<a href="javascript:void(0);" title="联系我们">联系我们</a> |'+
								'<a href="" title="">服务热线</a>'+
								'<strong style="color: #fff;">0311-85338599</strong>'+
							'</p>'+
							'<p class="foot-auth">版权所有·河北汇海征信 © 2018 |<a href="http://www.miitbeian.gov.cn" style="color: #fff;"> 京ICP证160759</a></p>'
							+'<p class="a-box" style="font-size: 12px;">河北汇海征信服务有限公司&nbsp; &nbsp;&nbsp; |&nbsp; &nbsp;&nbsp;' 
							+'石家庄市桥西区中华南大街一江国际大厦B座409</p>'+
						'</div>'+
				    '</div>'+
			   ' </div>'    
	$(".personal-footer").append(x);
//	导航
var y='<div class="nav">'+				    
		    '<div class="nav_c">'+
		        '<ul id="ull" class="ul">'+
		            '<li class="li li_first">'+
		                '<a href="pages/sys/kj/index.jsp" class="span">首页</a>'+
		            '</li>'+
				    '<li class="li">'+
				        '<a href="bond/disposal/list" class="span">资产委外</a>'+
				   '</li>'+
				    '<li class="li">'+
				        '<a href="auction/assets/list" class="span">资产拍卖</a>'+
				    '</li>'+
				    '<li class="li">'+
				        '<a href="pages/sys/kj/service.jsp" class="span">业务服务</a>'+
				    '</li>'+
				    '<li class="li">'+
				        '<a href="pages/sys/kj/help.jsp" class="span">客户专区</a>'+
				    '</li>'+
				    '<li class="li">'+
				        '<a href="pages/sys/kj/about.jsp" class="span">走进鑫淼聚</a>'+
						'<div class="nav_sub">'+
					        '<dl>'+
					            '<dd>'+
					                '<a href="pages/sys/kj/about.jsp">公司介绍</a>'+
					                '| <br/>'+
					                '<a href="pages/sys/kj/contact.jsp">联系我们</a>'+
					                '|' +
					            '</dd>'+
					        '</dl>'+
						'</div>'+
				    '</li>'+  
		        '</ul>'+
		    '</div>'+
	'</div>'
		    
	$(".personal-banner").append(y);
	//	头部
var top='<div class="top_wrap">'+	
		    '<div class="top">'+
		        '<a href="pages/sys/kj/index.jsp">'+
		        	'<img src="pages/sys/kj/img/logo9.png"  class="fl logo"/>'+
		        '</a>'+
		        '<img src="pages/sys/kj/img/tel1.jpg" alt="" class="fl tel" />'+
		        '<div class="fl links">'+
		            '<a href="sys/kj/login">登录</a>'+
		            '<br />'+
		            '<a href="sys/kj/goreg">注册</a>'+
		        '</div>'+
		        '<div class="fr search">'+
		            '<form name="formT" id="formT" method="post"   action="">'+
		                '<input class="input inputFocus" type="text" name="inputSearchQuery" id="inputSearchQueryT" maxlength="12"/>'+
		                '<input type="hidden" name="service" value=""/>'+
		                '<input type="hidden" name="sp" value="S0"/>'+
		                '<input type="hidden" name="Form0" value="category,inputSearchQuery,$Submit"/>'+
		                '<input type="hidden" name="category" value="-1"/>'+
		                '<input type="submit" value="" class="btn_search hand" />'+
		            '</form>'+
		        '</div>'+
		    '</div>'+
		'</div>'
		    

//if(!window.type){
//	//var type1 =getCookie("type"); 
//	
//	alert("从cookie中获取："+getCookie("type"));
//}else{
//	alert("获取type："+type);
//	document.cookie="type="+type;
//}	    

//alert("js中的："+type1);
var user_type="";
var type="";

	
//var name ="<%=session.getAttribute('name') %>"
	//alert(name);
		if(name){
			$.ajax({
            url: "bond/disposal/usertype",
            async: false,
            success: function (data) {
				//console.log(JSON.stringify(data));
				if(data.resultObj.user!=null && data.resultObj.user!=""){
					//alert(111);
					type=data.resultObj.user.sys_user_reg_type_d;
				}
            }
        	});
		}
		
//$.ajax("bond/disposal/usertype",{},function(data){
//	console.log(JSON.stringify(data));
//	type = data.resultObj.user.sys_user_reg_type_d
//	
//	
//
//});
if(type!="" && type!= null){
		if(type=="a77fda4f171f45f1b089f0dd18221e22"){
			user_type="(发布方)";
		}else if(type=="37b73a43f23a42edb6bef45a96628217"){
			user_type="(处置方)";
		}
}




//alert("从cookie中获取："+getCookie("type"));

	    
var top1 =  '<div class="top_wrap">'+
			'<div class="top">'+
			    '<a href="pages/sys/kj/index.jsp"><img src="pages/sys/kj/img/logo9.png"  class="fl logo"/></a>'+
			    '<img src="pages/sys/kj/img/tel1.jpg" alt="" class="fl tel"/>'+
			    '<div class="fl links">'+
				    '<span class="hidden-xs">'+user_type+name+'</span><br/>'+
			        '<a href="sys/login/logoutjs" class="btn btn-default btn-flat">退出</a>'+
			    '</div>'+
			    '<div class="fr search">'+
			        '<form name="formT" id="formT" method="post" target="_blank" action="">'+
			            '<input class="input inputFocus" type="text" name="inputSearchQuery" id="inputSearchQueryT"  maxlength="12"/>'+
			            '<input type="hidden" name="service" value=""/>'+
			            '<input type="hidden" name="sp" value="S0"/>'+
			            '<input type="hidden" name="Form0" value="category,inputSearchQuery,$Submit"/>'+
			            '<input type="hidden" name="category" value="-1"/>'+
			            '<input type="submit" value="" class="btn_search hand"/>'+
			        '</form>'+
			    '</div>'+
			'</div>'+
			'</div>'   
		    

		  if(name){
			 $(".personal-top").append(top1); 
		  }else{
			 $(".personal-top").append(top);
		  }
	          
		  
		  
	
});
$(function(){
	
	    $('#ull .li a').each(function(){  
	        if($($(this))[0].href==String(window.location))  
	            $(this).parent().addClass('libg');  
	    });  
	       



});






