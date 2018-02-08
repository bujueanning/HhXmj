<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <meta http-equiv="keywords" content="鑫淼聚,资产管理,鑫淼聚资产管理有限公司,投资,理财,基金，私募,集合理财,券商,专户理财,券商资管,资管,定向客户,宏观经济,业绩,领先"/>
    <meta http-equiv="description" content="鑫淼聚资产管理有限公司是中国证券会批准设立的首家券商资产管理公司；自1998年开始从事客户资产管理业务，2002年首批获得从事客户资产管理业务资格，2005年成为首批开展券商集合理财业务的证券公司，2010年成为首家获准设立的券商资产管理公司。 "/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="pages/sys/kj/css/catalog.css"/>
    <script type="text/javascript" src="pages/sys/kj/js/jquery-1.8.2.min.js"></script>
</head>
<body style="background: #fff;">
<!--注册登录-->
<!--注册登录-->
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

<div class="content">
    <div class="cont_right" style="width:950px;margin: 0 auto;float: none;">
        <div class="content">
            <div class="cont_left" style="height: 477px;">
                <ul>
                    <li><h2><img src="pages/sys/kj/img/title.png" style="margin-top: 0;"></h2></li>
                    <li><ul>
                        <li><h3><a href="company/news/frontList" class="curr" title="公司动态">公司动态</a></h3></li>
                        <li><h3><a href="release/notice/frontList" title="发布方公告">发布方公告</a></h3></li>
                        <li><h3><a href="manage/notice/frontList" title="处置方公告">处置方公告</a></h3></li>

                    </ul></li>
                </ul>
            </div>
            <!--右边内容-->
            <div class="cont_right">
                <p class="page_pos">当前位置：<a href="sys/kj/index">首页</a> &gt;
                    <span>公司动态</span>
                </p>
                <div class="information">
                    <!--资讯信息主体-->
                    <div class="info_cont">
                        <ul>
                            <c:choose>
                                <c:when test="${not empty varList}">
                                    <c:forEach items="${varList}" var="var" varStatus="vs">
                                        <li>
                                            <span><fmt:formatDate value="${var.company_news_createtime}" pattern="yyyy-MM-dd" /></span>
                                            <a href="javascript:void(0)" onclick="details('${var.company_news_id}')" title=${var.title}>
                                                    ${var.title}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr class="main_info">
                                        <td colspan="100" class="center" >没有相关数据</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                        <div class="page">
                            <a class="pageOn">1</a>
                            <a href="javascript:void(0);" title="2">2</a>
                            <a href="javascript:void(0);" title="3">3</a>
                            ...
                            <a href="javascript:void(0);" title="9">9</a>
                            <a href="javascript:void(0);">下一页</a>
                            &nbsp;跳转到<input name="textfield" type="text" id="pageIdx" maxlength="4" style="width:30px;text-align: center;border: 1px solid #ccc;" value="2">页
                            <input type="button" onclick="go();" value=" GO " style="border: 1px solid #ccc;height: 20px;cursor: pointer">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--尾部-->
<div class="personal-footer"></div>
<!-- 公共引入 -->
<script type="text/javascript" src="pages/sys/kj/js/public_two.js"></script>
<script type="text/javascript">
    function details(company_news_id) {
        window.open('company/news/details?company_news_id='+company_news_id);
    }
</script>
</body>
</html>
