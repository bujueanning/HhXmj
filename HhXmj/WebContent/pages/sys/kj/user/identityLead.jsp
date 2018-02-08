<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
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
	<link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css?t=201710102113"/>
	<link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css?t=201710102113"/>
	<link rel="stylesheet" type="text/css" href="pages/sys/kj/css/user.css?t=201710102113"/>
	<!-- bootstrap datepicker -->
	<link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
	<script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jquery.SuperSlide.2.1.1.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/global.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jcarousellite_1.0.1.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/iepng.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/jquery.extend.js"></script>
	<script type="text/javascript" src="pages/sys/kj/js/main.js"></script>

	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
	<style type="text/css">
		.thStyle{
			width:130px ;
			border-width:1px;
			text-align:center
		}

		.tdStyle{
			width: 150px;
			border-width:1px;
			text-align:center
		}
	</style>
</head>
<body>
<!-- 登陆注册 -->
<div class="personal-top"></div>


<!--导航-->
<div class="personal-banner"></div>
<!--网站公告-->
  <div class="notice">
      <div class="notice_c">
          <img src="pages/sys/kj/img/notice.png" class="fl img" />
          <div class="notices">
              <div class="bd">
                  <ul>
                      <li><a href="contents.html" >关于暂停通联支付民生银行卡开户（11月28日15:00起）的通知</a></li>
                      <li><a href="contents.html" >个人金融信息安全</a></li>
                      <li><a href="contents.html">关于通联支付交易系统暂停邮储银行快捷开户服务的提示</a></li>
                  </ul>
              </div>
          </div>
      </div>
  </div>
  
  
  <div class="wrap" style="    margin-top: 20px;">
    	
 	 	<div class="w1000 bc mt10">
		<!--左侧导航-->
		<div class="w1000 bc mt10">
		  	<div class="w130 fl">
			    <div class="treebox">
					<ul class="menu">
						<li class="level1" style="border-top:1px solid #ca0821;">
							<a href="#none"><em class="ico ico1"></em>个人信息<i class="down"></i></a>
							<ul class="level2">
								<li><a href="adduser_info.html#addUserInfo">完善资料</a></li>
								<li><a href="adduser_info.html#modify_ped">修改密码</a></li>
							</ul>
						</li>
						<li class="level1">
							<a href="#none"><em class="ico ico2"></em>发布管理<i></i></a>
							<ul class="level2">
								<li><a href="javascript:;">我的发布</a></li>
								<li><a href="javascript:;">浏览记录</a></li>
							</ul>
						</li>
					</ul>
				</div>
			    <div class="ad mt10">
		        <img width="140px" src="pages/sys/kj/img/ad5.png">
		        </div>
		    </div>
		  </div>
		  <!--右侧信息-->
		<div class="space-right left" style="    margin-left: 8px;">
		<div class="space-right left">
			<div class="w850 fr">
				<div class="border p20">
					<div class="tishi-box s2">
					<div class="left-ico"><i class="img-ico "></i></div>
					<div class="right-info">
						<ul>
			                <li><h5><b>
			                      请先完善个人信息,工作人员会在1-2工作日内审核完成发放发布权限！<a href="pages/sys/kj/user/adduser_info.jsp">去完善个人信息。</a>或10秒之后自动跳转到完善信息页面。
								</br>
			              </b>
			              
			              </h5></li>
						</ul>
					</div>       
			    	<div class="clr"></div>
				</div>
			</div>
			<script>
			 function ok(){
			    window.parent.parent.location.href="pages/sys/kj/user/adduser_info.jsp";
			 }
			 window.setTimeout("ok();",9000);
			 
			</script>
			
			</div>		
		</div>
		</div>
		<div class="clear"></div>			
		</div>
   </div>





<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
</body>
</html>