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
								'<strong style="color: #fff;">0311-8853898</strong>'+
							'</p>'+
							'<p class="foot-auth">版权所有·鑫淼聚 © 2017 |<a href="http://www.miitbeian.gov.cn" style="color: #fff;"> 京ICP证160759</a></p>'+
							'<p class="a-box" style="font-size: 12px;">鑫淼聚技有限公司&nbsp; &nbsp;&nbsp; |&nbsp; &nbsp;&nbsp;  北京市通州区东三环西路16号</p>'+
						'</div>'+
				    '</div>'+
			   ' </div>'   
	$(".personal-footer").append(x);
//	导航
var y='<div class="nav">'+				    
		    '<div class="nav_c">'+
		        '<ul class="ul">'+
		            '<li class="li li_first libg">'+
		                '<a href="pages/sys/kj/index.jsp" class="span">首页</a>'+
		            '</li>'+
				    '<li class="li">'+
				        '<a href="bond/disposal/list" class="span">资产委外</a>'+
				   '</li>'+
				    '<li class="li">'+
				        '<a href="auction/assets/list" class="span">资产拍卖</a>'+
				    '</li>'+
				    '<li class="li">'+
				        '<a href="pages/sys/kj/service.html" class="span">业务服务</a>'+
				    '</li>'+
				    '<li class="li">'+
				        '<a href="pages/sys/kj/help.html" class="span">客户专区</a>'+
				    '</li>'+
				    '<li class="li">'+
				        '<a href="about.html" class="span">走进鑫淼聚</a>'+
						'<div class="nav_sub">'+
					        '<dl>'+
					            '<dd>'+
					                '<a href="about.html">公司介绍</a>'+
					                '| <br/>'+
					                '<a href="contact.html">联系我们</a>'+
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
		        '<img src="pages/sys/kj/img/tel.png" alt="" class="fl tel" />'+
		        '<div class="fl links">'+
		            '<a href="sys/kj/login">登录</a>'+
		            '<br />'+
		            '<a href="sys/kj/goreg">注册</a>'+
		        '</div>'+
		        '<div class="fl links" style="display:none;">'+
		            '<a href="../login/login.html">登录人名称</a>'+
		            '<br />'+
		            '<a href=".../index.html">退出</a>'+
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
	$(".personal-top").append(top);
});

