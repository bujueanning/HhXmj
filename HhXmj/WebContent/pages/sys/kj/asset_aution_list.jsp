<%--
  Created by IntelliJ IDEA.
  User: 我
  Date: 2017/9/13
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <script>
        $(function () {
            $("#asset").jPages({
                containerID: "itemContainer"
            });
        });
    </script>
</head>
<body>
    <div class="screen_large"  style="display: block;">
            <c:choose>
            <c:when test="${not empty varList}">
            <ul id="itemContainer">
            <c:forEach items="${varList}" var="var" varStatus="vs">
            <li>
                <div>
                    <input id="auction_assets_id" name="auction_assets_id" value="${var.auction_assets_id}" type="hidden">
                              <span class="spanA" style="text-decoration:underline;">
                                  <a href="auction/assets/disposal?id=${var.auction_assets_id}">
                                      <img width="200" height="140" src="${var.auction_assets_img}"/>
                                  </a>
                              </span>

                              <span class="company_tit">
                                  <a href="auction/assets/disposal?id=${var.auction_assets_id}">
                                      <span class="spanA">${var.auction_project_name}</span>
                                  </a>
                              </span>

                              <span class="company_info">
                                                  挂牌价格：${var.auction_starting_price}
                                            <br>
                                                  挂牌结束日期：<fmt:formatDate value="${var.auction_listing_end_time}"
                                                                         pattern="yyyy-MM-dd"/></span>
                    <span class="about"><a href="auction/assets/disposal?id=${var.auction_assets_id}"><span class="spanA">[详情]</span></a></span>
                </div>
            </li>
            </c:forEach>
            </ul>
            </c:when>
            <c:otherwise>
            <div align="center">没有相关数据</div>
            </c:otherwise>
            </c:choose>
        
        <div id="asset" class="holder" ></div>
</div>
</body>
</html>
