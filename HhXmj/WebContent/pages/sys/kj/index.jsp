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
    <title>鑫淼聚资产管理有限公司</title>
    <meta http-equiv="keywords" content="鑫淼聚,资产管理,鑫淼聚资产管理有限公司,投资,理财,基金，私募,集合理财,券商,专户理财,券商资管,资管,定向客户,宏观经济,业绩,领先"/>
    <meta http-equiv="description" content="鑫淼聚资产管理有限公司是中国证券会批准设立的首家券商资产管理公司；自1998年开始从事客户资产管理业务，2002年首批获得从事客户资产管理业务资格，2005年成为首批开展券商集合理财业务的证券公司，2010年成为首家获准设立的券商资产管理公司。 "/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/bootstrap.min.css"/>
    <script type="text/javascript" src="pages/sys/kj/js/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/main.js"></script>
    
    <script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/jPages.js"></script>
    <script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
    <c:set var="name" value="${currentUser.sys_user_name}" scope="session"/>
	<script type="text/javascript">
    var name = "${name}";
 	</script>
    
    <style>
    .top {
	    width: 1000px;
	    margin: 0 auto;
	    padding-top: 16px;
	    height: 70px;
	    text-align: left;
	}
	.nav .ul {
	    margin-bottom: 0px;
	    float: right;
	    padding-right: 10px;
	}
	.hots {
	    width: 328px;
	   
	}
	.inform{
		position: relative;
  		left: 30px;
  		top: -20px;
	}
    </style>
</head>
<body>
<div class="personal-top"></div>
<!--导航-->
<div class="personal-banner"></div>
<!--轮播图-->
<div class="banner">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators" >
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				</ol>
				<!-- Wrapper for slides内容 -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div style="padding-top: 100px;text-align:center;height:300px;background-image:url(pages/sys/kj/img/5.jpg);background-size:1400px 300px;background-repeat: no-repeat;background-position-x:center"></div>
					</div>

					<div class="item">
						<div style="padding-top: 100px;color: white;text-align:center;height:300px;background-image:url(pages/sys/kj/img/2.jpg);background-size:1400px 300px;background-repeat: no-repeat;background-position-x:center"></div>

					</div>
					<div class="item">
						<div style="padding-top: 100px;text-align:center;height:300px;background-image:url(pages/sys/kj/img/4.jpg);background-size:1400px 300px;background-repeat: no-repeat;background-position-x:center"></div>

					</div>
					<div class="item">
						<div style="padding-top: 100px;text-align:center;height:300px;background-image:url(pages/sys/kj/img/1.jpg);background-size:1400px 300px;background-repeat: no-repeat;background-position-x:center"></div>

					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<div class="info">
            <a href="pages/sys/kj/login/login.jsp"   class="btn_red_big">登录</a><br />
            <a href="pages/sys/kj/bargain.jsp" class="btn_gray_s">成交公告</a>　
            <a href="sys/kj/goinfo" class="btn_gray_s">个人中心</a><br />
            <!-- 
            <div class="ul">
                <li>
                    手机客户端下载<br />
                    <img src="img/qrcode.jpg" />
                </li>
                <li class="li">
                    微信服务号 扫一扫<br />
                    <img src="img/qrcode.jpg" />
                </li>
            </div>
             -->
        </div>
		</div>

<!--轮播图-->
   
  <!--网站公告-->
  <div class="notice">
      <div class="notice_c">
          <img src="pages/sys/kj/img/notice.png" class="fl img_inform" />
          <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Wrapper for slides内容 -->
				<div class="carousel-inner inform" role="listbox">
					<div class="item active">
						<div>
							<a href="pages/sys/kj/contact.jsp" >关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a>
						</div>
					</div>

					<div class="item">
						<div>
							<a href="pages/sys/kj/contact.jsp" >个人金融信息安全</a>
						</div>

					</div>
					<div class="item">
						<div>
							<a href="pages/sys/kj/contact.jsp">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a>
						</div>
					</div>
				</div>
			</div>
          
          
          <!-- 
          <div class="notices">
              <div class="bd">
                  <ul>
                      <li><a href="contact.jsp" >关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                      <li><a href="contact.jsp" >个人金融信息安全</a></li>
                      <li><a href="contact.jsp">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                  </ul>
              </div>
          </div>
           -->
      </div>
  </div>
    
    <!--内容-->
    <div class="wrap">
    	<!--广告-->
        <div class="hots_div hiden">
    <div class="hots">
        <img src="pages/sys/kj/img/corner_1.png" class="corner corner1" />
        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2" />
        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3" />
        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4" />
        <h3>客户盈利是考核的核心指标</h3>投资之道<br />
        <div class="div">
            <div class="fl hots_l">
                <img src="pages/sys/kj/img/11.jpg" width="141" height="105" />
            </div>
            <div class="fr hots_r">
                <p>勤练内功，赢在长期</p>
                <a href="pages/sys/kj/about.jsp?aa=2"   class="a">查看详情</a>
            </div>
        </div>
    </div>
    <div class="hots">
        <img src="pages/sys/kj/img/corner_1.png" class="corner corner1" />
        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2" />
        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3" />
        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4" />
        <h3>择时不如择股</h3>面对面<br />
        <div class="div">
            <div class="fl hots_l">
                <img src="pages/sys/kj/img/12.jpg" width="141" height="105" />
            </div>
            <div class="fr hots_r">
                <p>市场趋于分化 精选个股获取绝对收益</p>
                <a href="pages/sys/kj/about.jsp?aa=3"   class="a">查看详情</a>
            </div>
        </div>
    </div>
    <div class="hots hots_last">
        <img src="pages/sys/kj/img/corner_1.png" class="corner corner1" />
        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2" />
        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3" />
        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4" />
        <h3>善良为先 智慧为道 奋斗为本</h3>长期致胜之道<br />
        <div class="div">
            <div class="fl hots_l">
                <img src="pages/sys/kj/img/13.jpg" width="141" height="105" />
            </div>
            <div class="fr hots_r">
                <p><span style="TEXT-ALIGN: left; TEXT-TRANSFORM: none; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 24px; DISPLAY: inline !important; FONT: 12px/24px 宋体, 微软雅黑, arial, sans-seri; FLOAT: none; LETTER-SPACING: normal; COLOR: rgb(40,40,40); WORD-SPACING: 0px; -webkit-text-stroke-width: 0px">一切以客户利益为先</span></p><p>&nbsp;</p>
                <a href="pages/sys/kj/about.jsp?aa=4"   class="a">查看详情</a>
            </div>
        </div>
    </div>
        
        </div>
  <!--项目信息-->
  <div class="index_gdlc">
        <img src="pages/sys/kj/img/corner_1.png" class="corner corner1" />
        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2" />
        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3" />
        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4" />
        <h3>
                                   项目信息
             <div class="product_search">
                    <div class="input_div input_div2">
                        <input id="searchinp" type="text" class="input input2 inputFocus" value="请输入产品代码、名称、类型" />
                        <input type="button" id="searchbtn" value="" class="btn_search1 hand"/>
                        <ul class="nsearchlist"></ul>
                    </div>
                    <script type="text/javascript">
                        var allFunds = [
                            "xmgj-2,星美国际影院信托...,专项计划-专项计划,/product/zhuanxiang/xmgj-2/notice/index.html,星美国际影院信托受益权二期",
                        ];
                       $(function () {
                            //搜索框效果
                            $("#searchinp").bind("keyup", function () {
                               
                            });
                            $("#searchbtn").click(function () {
	                            var sty= $(".table_gdlc").css("display");
	                      		console.log("可以，sty:"+sty);
	                      		if(sty!="none"){
	                      			debugger
	                      			var str =$("#searchinp").val();
	                      			console.log("13:"+str);
	                      			if(str=="请输入产品代码、名称、类型"){
	                      				str=" ";
	                      			}
	                      			console.log("输入的字符串为:"+str)
	                      			$.post("bond/disposal/listtree",{"conditionName": "allSearch", "conditionValue":str},function (datas) {
	                                	$(".tr12").html(datas);
	                                });
	                      		}else{
	                      			if($("#searchinp").val()=="请输入产品代码、名称、类型"){
	                      				$("#searchinp").val("");
	                      			}
									$.post("auction/assets/list1",{"conditionName": "allSearch", "conditionValue":$("#searchinp").val()},function (datas) {
										$(".mainbox").html(datas)
	                                });
	                      		}
                            });
                            $("#searchinp").bind("click", function (e) {
                                e.stopPropagation();
                            });
                            $(document).bind("click", function () {
                                $(".nsearchlist").hide();
                            });
                        });
                    </script>
             </div>
            </h3>
     <!---债券处置--->
     <div class="index_gdlc_c">
        <ul class="ul_qxjj" style="padding-top: 11px;height: 40px;">
            <li class="li_first li_curr" id="li_first" onmouseover="showStype(this.id,'li_two');">资产委外<img src="pages/sys/kj/img/line_arrow1.png"/></li>
            <li id="li_two" onmouseover="showStype(this.id,'li_first');">资产拍卖<img src="pages/sys/kj/img/line_arrow1.png"/></li>
        </ul>
        <!--债券处置-->
        <div class="tr12 table_gdlc" id="li_first_" >
        	<input type="hidden" id="error" value="<%=session.getAttribute("error") %>"/>
			<input type="hidden" id="success" value="<%=session.getAttribute("success") %>"/>
        </div>
   		<!---拍卖信息--->
        <div class="table_gdlc none" id="lifirst">
         	<div class="screen_large" style="display: block;margin-top: 10px;">
		         <div style=" min-height: 20px;" class="mainbox">
			           <div class="holder"></div>
			     </div>
      		</div>
      	</div>
     </div>
  </div>
  <script type="text/javascript">
  	function showStype(id1,id2,id3,id4){
  		//alert(1123)
  		$("#"+id1).addClass("li_curr");
  		$("#"+id2).removeClass("li_curr");
  		$(".li_curr").trigger("click");
  	}
  </script>
        <div class="banner1">
				 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
				<ol class="carousel-indicators" >
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				</ol>
				<!-- Wrapper for slides内容 -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div style="padding-top: 100px;text-align:center;height:300px;background-image:url(pages/sys/kj/img/21.jpg);background-size:1000px 180px"></div>
					</div>

					<div class="item">
						<div style="padding-top: 100px;color: white;text-align:center;height:300px;background-image:url(pages/sys/kj/img/2.jpg);background-size:1000px 180px"></div>

					</div>
				</div>
		</div>	
    </div>
        <div class="index_news hiden">
<!--公司动态-->
<div class="index_news1 news">
    <img src="pages/sys/kj/img/corner_1.png" class="corner corner1" />
    <img src="pages/sys/kj/img/corner_2.png" class="corner corner2" />
    <img src="pages/sys/kj/img/corner_3.png" class="corner corner3" />
    <img src="pages/sys/kj/img/corner_4.png" class="corner corner4" />
    <h3 class="h3_1">
        <ul>
            <li class="li_curr"><span class="span">公司动态</span></li>
        </ul>
        <a href=""><img src="pages/sys/kj/img/icon_more.png" class="fr img_more" /></a>
    </h3>
        <div class="index_news_c company">
        </div>
        
</div>
    <div class="index_news1 index_news2">
        <img src="pages/sys/kj/img/corner_1.png" class="corner corner1" />
        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2" />
        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3" />
        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4" />
        <h3 class="h3_2">
            <ul>
                <li class="li_curr1"><span class="span">发布方公告</span></li>
            </ul>
            <a href=""><img src="pages/sys/kj/img/icon_more.png" class="fr img_more" /></a>
        </h3>
        <div class="index_news_c release">
        </div>
    </div>
    <div class="index_news1 index_news3">
        <img src="pages/sys/kj/img/corner_1.png" class="corner corner1" />
        <img src="pages/sys/kj/img/corner_2.png" class="corner corner2" />
        <img src="pages/sys/kj/img/corner_3.png" class="corner corner3" />
        <img src="pages/sys/kj/img/corner_4.png" class="corner corner4" />
        <h3 class="h3_2">
            <ul>
                <li class="li_curr1"><span class="span">处置方公告</span></li>
            </ul>
            <a href=""><img src="pages/sys/kj/img/icon_more.png" class="fr img_more" /></a>
        </h3>
        <div class="index_news_c manage">
        </div>
    </div>
        </div>
        
    </div>
    <!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript">
	$(function(){
		var error = $("#error").val();
		var success =$("#success").val();
		if(error!= "null" && error !="" && error!=null){
			alert(error);
			$.post("bond/sheet/remove",{},function(){});
		}
		if(success!="null"&&success!=''&&success!=null){
			alert(success);
			$.post("bond/sheet/remove",{},function(){});
		}
		//$.post("auction/assets/list1",{},function (datas) {
			//$(".mainbox").html(datas);
        //});
		//$.post("../../../bond/disposal/listtree",{},function (datas) {
        	//$(".tr12").html(datas);
        //});
	});
</script>
<script type="text/javascript">
    window.onload=function() {
        $.ajax({
            url: "company/news/companynews",
            async: false,
            dataType: "html",
            success: function (data) {
                $('.company').html(data);
            }
        });

        $.ajax({
            url: "manage/notice/news",
            async: false,
            dataType: "html",
            success: function (data) {
                $('.manage').html(data);
            }
        });

        $.ajax({
            url: "release/notice/news",
            async: false,
            dataType: "html",
            success: function (data) {
                $('.release').html(data);
            }
        });
        $.ajax({
            url: "bond/disposal/listtree",
            async: false,
            dataType: "html",
            success: function (data) {
                $(".tr12").html(data);
            }
        });
        $.ajax({
            url: "auction/assets/list1",
            async: false,
            dataType: "html",
            success: function (data) {
                $(".mainbox").html(data);
            }
        });
    }
</script>
<script>
	
	$(function(){
    var liobj=$(".ul_qxjj li");
    liobj.each(function(){
        $(this).click(function(){
        liobj.removeClass("li_first li_curr")
            $(this).addClass("li_first li_curr");           
            //return false;    //加这句来阻止跳转 可用来调试效果
        });
    });
});
 $('#li_first').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#lifirst").hide();
  		$("#li_first_").show();
    });
     $('#li_two').on('click',function(){
//      $("#open_Texts").html("展开提示消息");
       $("#lifirst").show();
  		$("#li_first_").hide();
    });
</script>
</body>
</html>