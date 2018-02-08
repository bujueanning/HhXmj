<%--
  Created by IntelliJ IDEA.
  User: 我
  Date: 2017/10/18
  Time: 22:28
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
<ul>
    <c:choose>
        <c:when test="${not empty varList}">
            <c:forEach items="${varList}" var="var" varStatus="vs">
                <li><a href="javascript:void(0)" onclick="details('${var.company_news_id}')" title=${var.title} target="_blank">${var.title}</a><span
                        class="fr time"><fmt:formatDate value="${var.company_news_createtime}" pattern="yyyy.MM.dd" /></span></li>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr class="main_info">
                <td colspan="100" class="center" >没有相关数据</td>
            </tr>
        </c:otherwise>
    </c:choose>
</ul>
<script type="text/javascript">
    function details(company_news_id) {
        window.open('company/news/details?company_news_id='+company_news_id);
    }
</script>
</body>
</html>
