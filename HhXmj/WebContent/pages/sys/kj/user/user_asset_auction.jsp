<%--
  Created by IntelliJ IDEA.
  User: 我
  Date: 2017/10/13
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
</head>
<body>
<div class="space-right w850 fr" style="background-color: white;">
    <div class="bc location bai_se" style="height:60px;border: 0;">
        <div style="float:left; width:240px; margin-top:0px; margin-left:0px;padding:0px;" align="left" height="100%">
            <img height="60px;" width="200" style=" margin-left:-12px; " src="pages/sys/kj/img/infomation.png">
        </div>
        <div align="center" class="zcfb">
            <a href="auction/assets/index">  拍卖发布	</a>
        </div>
    </div>
    <!-- tab页 -->
    <form action="" name="form1" id="form1" method="post">
        <input type="hidden" name="state" id="state" value="">
    </form>
    <div class="" style="background-color: white;border-bottom:1px #ccc solid;">
        <div class="tab-box mt10">
            <ul>
                <li id="fundInfoLi" class="cur">
                    <a hidefocus="true">我的拍卖</a>
                </li>

                <li style="margin-left: 606px;">
                    <select id="sel" class="inpt w100">
                        <option value="">全部状态</option>
                        <option value="01">待审核</option>
                        <option value="03">已完成</option>
                        <option value="09">未成功</option>
                    </select>
                </li>
            </ul>
        </div>
    </div>
    <div class="box w850">
        <div class="box_con1" style="border-style:none;">
            <div class="p15">
                <div class="record-list">
                    <form action=" " name="form1" id="form2" method="post">
                        <table class="table-list-2 mt10" width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;word-wrap:break-word;">
                        <c:if test="${not empty varList}">
                            <tr>
                                <th>企业名称</th>
                                <th>资产编号</th>
                                <th>竞价周期</th>
                                <th>挂牌开始时间</th>
                                <th>挂牌结束时间</th>
                                <th>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态</th>
                                <th>发布时间</th>
                                <th width="50px">操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作</th>
                            </tr>
                        </c:if>
                            <c:choose>
                                <c:when test="${not empty varList}">
                                    <c:forEach items="${varList}" var="var" varStatus="vs">
                                        <tr>
                                            <input hidden value="${var.auction_assets_id}">
                                            <td>${var.auction_project_name}</td>
                                            <td>${var.auction_project_number}</td>
                                            <td>${var.auction_bidding_cycle}</td>
                                            <td><fmt:formatDate value="${var.auction_listing_start_time}"
                                                                pattern="yyyy-MM-dd"/></td>
                                            <td><fmt:formatDate value="${var.auction_listing_end_time}"
                                                                pattern="yyyy-MM-dd"/></td>
                                            <td>${var.auction_verify1}</td>
                                            <td><fmt:formatDate value="${var.auction_assets_createtime}"
                                                                pattern="yyyy-MM-dd"/></td>

                                            <td>
                                                <c:if test="${var.auction_verify== '1'}">
                                                    <a href="auction/assets/goedit?id=${var.auction_assets_id}">修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改</a>
                                                </c:if>
                                                <c:if test="${var.auction_verify== '2'}">
                                                    <a href="auction/assets/disposal?id=${var.auction_assets_id}">查看详情</a>
                                                </c:if>
                                                <c:if test="${var.auction_verify== '3'}">
                                                    <a href="auction/assets/goedit?id=${var.auction_assets_id}">修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr class="main_info">
                                        <td colspan="100" class="center">没有相关数据</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </table>
                    </form>
                </div>
                <div class="clr mt20"></div>
                <div class="pages">
                    <div class="pages-box">
                        <div class="pages">
                            <form name="page_slider_765" action=" " method="post">
                                <input type="hidden" name="ucAccount" value="1708150006">
                                <input type="hidden" maxlength="8" name="currentPage" title="输入页码按回车" size="2" value="1" onkeydown="if(event.keyCode==13){goto765('');return false;}">
                                <input type="text" name="tmpHiddenField2" style="display:none;">  	  		<span class="disabled" title="已是首页"> &lt; </span>
                                <span class="current">1</span>
                                <span class="disabled" title="已是首页"> &gt; </span>

                                <input type="hidden" value="" name="checkBoxSelected">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clr"></div>
    </div>
</div>
</body>
</html>
